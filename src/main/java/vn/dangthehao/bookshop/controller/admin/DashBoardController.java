package vn.dangthehao.bookshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.dangthehao.bookshop.service.BookService;
import vn.dangthehao.bookshop.service.OrderService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class DashBoardController {
    private final BookService bookService;
    private final UserService userService;
    private final OrderService orderService;

    public DashBoardController(BookService bookService, UserService userService, OrderService orderService) {
        this.bookService = bookService;
        this.userService = userService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        model.addAttribute("totalBooks", this.bookService.countBooks());
        model.addAttribute("totalUsers", this.userService.countUsers());
        model.addAttribute("totalOrders", this.orderService.countOrders());
        return "admin/dashboard";
    }
}
