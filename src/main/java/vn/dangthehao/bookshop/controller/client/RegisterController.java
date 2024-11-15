package vn.dangthehao.bookshop.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.validation.Valid;
import vn.dangthehao.bookshop.domain.Role;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.domain.dto.RegisterDTO;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class RegisterController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public RegisterController(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute(name = "registerUser") RegisterDTO registerUser,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.convertRegisterUserToUser(registerUser);
        String hashPassword = this.passwordEncoder.encode(registerUser.getPassword());
        Role role = this.userService.getRoleByName("USER");
        user.setPassword(hashPassword);
        user.setRole(role);

        this.userService.saveUser(user);
        return "redirect:/login";
    }

}
