package vn.dangthehao.bookshop.controller.client;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.domain.dto.ForgotPasswordDTO;
import vn.dangthehao.bookshop.service.BookService;
import vn.dangthehao.bookshop.service.EmailService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class HomePageController {
    private final BookService bookService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final UserService userService;

    public HomePageController(BookService bookService, PasswordEncoder passwordEncoder,
            EmailService emailService, UserService userService) {
        this.bookService = bookService;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Book> books = this.bookService.fetchBooks();
        Optional<Book> bestSellingBookOptional = this.bookService.fetchBestSellingBook();
        if (bestSellingBookOptional.isPresent()) {
            model.addAttribute("bestSellingBook", bestSellingBookOptional.get());
        }
        model.addAttribute("books", books);
        return "client/home";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/login/forgot-password")
    public String getForgotPasswordPage(Model model) {
        model.addAttribute("forgotPasswordDTO", new ForgotPasswordDTO());
        return "client/auth/forgot_password";
    }

    @PostMapping("/login/forgot-password")
    public String preUpdatePassWord(
            @Valid @ModelAttribute(name = "forgotPasswordDTO") ForgotPasswordDTO forgotPasswordDTO,
            BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "client/auth/forgot_password";
        }

        Random random = new Random();
        String encryptedPassword = passwordEncoder.encode(forgotPasswordDTO.getPassword());
        String verificationCode = String.valueOf(random.nextInt(1000, 10000));
        emailService.sendThankMessage(forgotPasswordDTO.getEmail(), "VERIFICATION CODE",
                "Your verification code: " + verificationCode);
        forgotPasswordDTO.setPassword(encryptedPassword);
        forgotPasswordDTO.setVerificationCode(verificationCode);
        model.addAttribute("forgotPasswordDTO", forgotPasswordDTO);
        return "client/auth/verification";
    }

    @PostMapping("/login/forgot-password/verify")
    public String updatePassword(@ModelAttribute(name = "forgotPasswordDTO") ForgotPasswordDTO forgotPasswordDTO) {
        if (!forgotPasswordDTO.getVerificationCode().equals(forgotPasswordDTO.getConfirmVerificationCode())) {
            return "client/auth/verification";
        }
        User user = userService.fetchUserByEmail(forgotPasswordDTO.getEmail());
        user.setPassword(forgotPasswordDTO.getPassword());
        userService.saveUser(user);
        return "client/auth/login";
    }

}
