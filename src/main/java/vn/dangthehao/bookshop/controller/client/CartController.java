package vn.dangthehao.bookshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.CartDetailService;
import vn.dangthehao.bookshop.service.CartService;
import vn.dangthehao.bookshop.service.EmailService;
import vn.dangthehao.bookshop.service.OrderService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class CartController {
    private final CartService cartService;
    private final UserService userService;
    private final CartDetailService cartDetailService;
    private final OrderService orderService;
    private final EmailService emailService;

    public CartController(CartService cartService, UserService userService,
            CartDetailService cartDetailService, OrderService orderService,
            EmailService emailService) {
        this.cartService = cartService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
        this.orderService = orderService;
        this.emailService = emailService;
    }

    @PostMapping("/add-book-to-cart/{bookId}")
    public String addBookToCart(@ModelAttribute(name = "book") Book book, HttpServletRequest request,
            @PathVariable long bookId) {
        HttpSession session = request.getSession(false);
        this.cartService.addBookToCart(bookId, session, 1);
        return "redirect:/books";
    }

    @PostMapping("/add-book-to-cart-form-view-detail/{bookId}")
    public String addBookToCartFromViewDetail(@PathVariable long bookId, HttpServletRequest request,
            @RequestParam(name = "quantity") int quantity) {
        HttpSession session = request.getSession(false);
        this.cartService.addBookToCart(bookId, session, quantity);
        return "redirect:/books";
    }

    @GetMapping("/cart")
    public String viewCart(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = this.userService.fetchUserByEmail(session.getAttribute("email") + "");
        Cart cart = this.cartService.fetchCartByUser(currentUser);
        if (cart != null) {
            List<CartDetail> cartDetails = this.cartDetailService.fetchCartDetailsByCart(cart);
            double cartTotal = cart.getTotal();
            model.addAttribute("cartDetails", cartDetails);
            model.addAttribute("cartTotal", cartTotal);
            model.addAttribute("cart", cart);
        } else {
            model.addAttribute("cart", cart);
        }

        return "client/cart/show";
    }

    @PostMapping("/cart/delete/cartDetail/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartService.deleteCartDetail(id, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckout(@ModelAttribute(name = "cart") Cart cart, Model model) {
        List<CartDetail> updatedCartDetails = cart.getCartDetails();
        Cart oldCart = this.cartService.fetchCartById(cart.getId());

        /*
         * Validate quantity in each cart detail
         * If quantity <= available quantity book, it's passed
         * Else it's failed
         */
        List<Boolean> failedQuantityCheck = updatedCartDetails.stream()
                .map(updatedCartDetail -> cartDetailService.validateCartDetailQuantity(updatedCartDetail))
                .filter(checkResult -> checkResult == false)
                .toList();
        if (!failedQuantityCheck.isEmpty()) {
            model.addAttribute("cartDetails", oldCart.getCartDetails());
            model.addAttribute("failedValidation", 1);
            model.addAttribute("cartTotal", oldCart.getTotal());
            return "client/cart/show";
        }

        this.cartService.handleUpdateCartBeforeCheckOut(updatedCartDetails, oldCart);
        Cart updatedCart = this.cartService.fetchCartById(oldCart.getId());
        model.addAttribute("cartDetails", updatedCart.getCartDetails());
        model.addAttribute("cartTotal", updatedCart.getTotal());
        model.addAttribute("cart", updatedCart);
        return "client/cart/check_out";
    }

    @PostMapping("/place-order")
    public String placeOrder(HttpServletRequest request, @RequestParam(name = "receiver_name") String receiverName,
            @RequestParam(name = "receiver_address") String receiverAddress,
            @RequestParam(name = "receiver_phone") String receiverPhone) {
        HttpSession session = request.getSession(false);
        String email = session.getAttribute("email") + "";
        User user = this.userService.fetchUserByEmail(email);
        this.orderService.createOrder(user, receiverName, receiverAddress, receiverPhone, session);
        String thankMessage = "Thank for your support. Have a good day!";
        this.emailService.sendThankMessage(email, "Thank email", thankMessage);
        return "client/cart/thank";
    }
}
