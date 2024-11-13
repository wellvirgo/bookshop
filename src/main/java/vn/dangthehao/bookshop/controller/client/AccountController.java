package vn.dangthehao.bookshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.UploadFileService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class AccountController {
    private final UserService userService;
    private final UploadFileService uploadFileService;

    public AccountController(UserService userService, UploadFileService uploadFileService) {
        this.userService = userService;
        this.uploadFileService = uploadFileService;
    }

    @GetMapping("/account")
    public String viewAccountInformation(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email") + "";
        User user = this.userService.fetchUserByEmail(email);
        model.addAttribute("user", user);
        return "client/auth/account_management";
    }

    @PostMapping("/account/update")
    public String updateAccountInformation(@ModelAttribute("user") User user,
            @RequestParam("avatarFile") MultipartFile file) {
        User updateUser = this.userService.fetchUserById(user.getId());
        updateUser.setFullName(user.getFullName());
        updateUser.setAddress(user.getAddress());
        updateUser.setPhone((user.getPhone()));
        if (!file.isEmpty()) {
            String avatarLink = this.uploadFileService.handleUploadFile(file, "avatars");
            updateUser.setAvatarLink(avatarLink);
        }
        this.userService.saveUser(updateUser);
        return "redirect:/account";
    }
}
