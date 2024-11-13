package vn.dangthehao.bookshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.domain.OrderDetail;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderDetailService orderDetailService;
    private final OrderRepository orderRepository;
    private final CartDetailService cartDetailService;
    private final CartService cartService;
    private final BookService bookService;

    public OrderService(OrderDetailService orderDetailService, OrderRepository orderRepository,
            CartDetailService cartDetailService, CartService cartService,
            BookService bookService) {
        this.orderDetailService = orderDetailService;
        this.orderRepository = orderRepository;
        this.cartDetailService = cartDetailService;
        this.cartService = cartService;
        this.bookService = bookService;
    }

    public void createOrder(User user, String receiverName, String receiverAddress, String receiverPhone,
            HttpSession session) {
        Cart cart = user.getCart();
        Order order = new Order();
        order.setUser(user);
        order.setTotal(cart.getTotal());
        order.setReceiverName(receiverName);
        order.setReceiverAddress(receiverAddress);
        order.setReceiverPhone(receiverPhone);
        order.setStatus("PENDING");
        this.orderRepository.save(order);

        List<CartDetail> cartDetails = cart.getCartDetails();
        for (CartDetail cartDetail : cartDetails) {
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setQuantity(cartDetail.getQuantity());
            orderDetail.setBook(cartDetail.getBook());
            orderDetail.setTotal(cartDetail.getTotal());
            orderDetail.setOrder(order);
            this.orderDetailService.saveOrderDetail(orderDetail);
            this.bookService.updateBookQuantityAfterOrder(cartDetail.getBook().getId(), cartDetail.getQuantity());
            this.cartDetailService.deleteCartDetail(cartDetail);
        }
        this.cartService.deleteCart(cart);
        session.setAttribute("sumInCart", 0);
    }

    public List<Order> fetchAllOrders() {
        return this.orderRepository.findAll();
    }

    public Optional<Order> fetchOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public Order saveOrder(Order order) {
        return this.orderRepository.save(order);
    }
}
