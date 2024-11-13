package vn.dangthehao.bookshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.service.OrderService;

@Controller
public class AdminOrderController {
    private OrderService orderService;

    public AdminOrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("/admin/order")
    public String getOrderDashboard(Model model) {
        List<Order> orders = this.orderService.fetchAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    @GetMapping("/admin/order/view-detail/{id}")
    public String viewDetailOrder(Model model, @PathVariable long id) {
        Optional<Order> order = this.orderService.fetchOrderById(id);
        if (order.isPresent()) {
            model.addAttribute("order", order.get());
        }
        return "admin/order/view_detail";
    }

    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Optional<Order> order = this.orderService.fetchOrderById(id);
        if (order.isPresent()) {
            model.addAttribute("order", order.get());
        }
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateStatusOfOrder(@ModelAttribute(name = "order") Order updateOrder) {
        Optional<Order> oldOrder = this.orderService.fetchOrderById(updateOrder.getId());
        if (oldOrder.isPresent()) {
            oldOrder.get().setStatus(updateOrder.getStatus());
            this.orderService.saveOrder(oldOrder.get());
        }
        return "redirect:/admin/order";
    }
}
