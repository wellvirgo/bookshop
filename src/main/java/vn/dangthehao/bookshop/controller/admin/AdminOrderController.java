package vn.dangthehao.bookshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.ServletContext;
import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.service.ExportPDFService;
import vn.dangthehao.bookshop.service.OrderService;

@Controller
public class AdminOrderController {
    private final OrderService orderService;
    private final ExportPDFService exportPDFService;
    private final ServletContext servletContext;

    public AdminOrderController(OrderService orderService, ExportPDFService exportPDFService,
            ServletContext servletContext) {
        this.orderService = orderService;
        this.exportPDFService = exportPDFService;
        this.servletContext = servletContext;
    }

    @GetMapping("/admin/order")
    public String getOrderDashboard(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int currentPage = 1;
        if (pageOptional.isPresent()) {
            currentPage = Integer.parseInt(pageOptional.get());
        }
        Pageable pageable = PageRequest.of(currentPage - 1, 10);
        Page<Order> orderPagination = this.orderService.fetchOrdersWithPagination(pageable);
        List<Order> orders = orderPagination.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", orderPagination.getTotalPages());
        model.addAttribute("currentPage", currentPage);
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

    @PostMapping("/admin/export-pdf/{id}")
    public String exportDataToPDF(@PathVariable("id") long id) {
        Optional<Order> orderOptional = this.orderService.fetchOrderById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            String documentPath = this.servletContext.getRealPath("/resources/pdf/infoOfOrder_") + order.getId()
                    + ".pdf";
            this.exportPDFService.exportDataToPDF(documentPath, order);
            return "redirect:/admin/order/view-detail/" + order.getId();
        }
        return "redirect:/admin/order";
    }
}
