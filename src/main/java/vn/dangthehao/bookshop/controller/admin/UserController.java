package vn.dangthehao.bookshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.dangthehao.bookshop.domain.Role;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.RoleService;
import vn.dangthehao.bookshop.service.UploadFileService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class UserController {
    private final UserService userService;
    private final RoleService roleService;
    private final UploadFileService uploadFileService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, RoleService roleService,
            UploadFileService uploadFileService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.roleService = roleService;
        this.uploadFileService = uploadFileService;
        this.passwordEncoder = passwordEncoder;
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
    public String getUserDeletionPage(Model model, @PathVariable long id, @ModelAttribute User currentUser) {
        currentUser = this.userService.fetchUserById(id);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("userId", id);
        return "admin/user/deletion";
    }

    @PostMapping("/admin/user/delete")
    public String deleteUser(@ModelAttribute(name = "currentUser") User currentUser) {
        this.userService.deleteUserById(currentUser.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User selectedUser = this.userService.fetchUserById(id);
        model.addAttribute("user", selectedUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(@ModelAttribute(name = "user") User user) {
        // set updated data
        User updatedUser = this.userService.fetchUserById(user.getId());
        updatedUser.setFullName(user.getFullName());
        updatedUser.setAddress(user.getAddress());
        updatedUser.setPhone(user.getPhone());
        Role role = this.roleService.fetchRoleByRoleName(user.getRole().getRoleName());
        updatedUser.setRole(role);

        // update user into database
        this.userService.saveUser(updatedUser);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/create")
    public String getUserCreationPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/creation";
    }

    @PostMapping("/admin/user/create")
    public String createUser(@ModelAttribute(name = "newUser") User user,
            @RequestParam(name = "avatarFile") MultipartFile file) {
        Role role = this.roleService.fetchRoleByRoleName(user.getRole().getRoleName());
        user.setRole(role);
        if (!file.isEmpty()) {
            String avatarLink = this.uploadFileService.handleUploadFile(file, "avatars");
            user.setAvatarLink(avatarLink);
        }
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        this.userService.saveUser(user);
        return "redirect:/admin/user";
    }
}
