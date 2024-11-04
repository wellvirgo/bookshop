package vn.dangthehao.bookshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admin/user")
    public String getUserDashboard(Model model) {
        List<User> users = this.userService.fetchUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    @GetMapping("/admin/user/view-detail/{id}")
    public String getUserDetailPage(Model model, @PathVariable long id) {
        User selectedUser = this.userService.fetchUserById(id);
        model.addAttribute("user", selectedUser);
        return "admin/user/viewdetail";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getUserDeletionPage(Model model, @PathVariable long id) {
        model.addAttribute("userId", id);
        return "admin/user/deletion";
    }

    @PostMapping("/admin/user/delete/{id}")
    public String deleteUser(@PathVariable long id) {
        this.userService.deleteUserById(id);
        return "redirect:/admin/user";
    }
}
