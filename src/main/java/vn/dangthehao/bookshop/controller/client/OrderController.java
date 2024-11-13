package vn.dangthehao.bookshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class OrderController {
    private final UserService userService;

    public OrderController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/purchase-history")
    public String viewPurchaseHistory(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email") + "";
        User user = this.userService.fetchUserByEmail(email);
        List<Order> orders = user.getOrders();
        if (orders != null) {
            model.addAttribute("orders", orders);
        } else {
            model.addAttribute("orders", new ArrayList<Order>());
        }

        return "client/order/history";
    }
}
