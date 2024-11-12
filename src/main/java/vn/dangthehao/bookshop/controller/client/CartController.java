package vn.dangthehao.bookshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.service.CartDetailService;
import vn.dangthehao.bookshop.service.CartService;
import vn.dangthehao.bookshop.service.UserService;

@Controller
public class CartController {
    private final CartService cartService;
    private final UserService userService;
    private final CartDetailService cartDetailService;

    public CartController(CartService cartService, UserService userService, CartDetailService cartDetailService) {
        this.cartService = cartService;
        this.userService = userService;
        this.cartDetailService = cartDetailService;
    }

    @PostMapping("/add-book-to-cart/{bookId}")
    public String addBookToCart(@ModelAttribute(name = "book") Book book, HttpServletRequest request,
            @PathVariable long bookId) {
        HttpSession session = request.getSession(false);

        this.cartService.addBookToCart(bookId, session, 1);
        return "redirect:/books";
    }

    @GetMapping("/cart")
    public String viewCart(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = this.userService.fetchUserByEmail(session.getAttribute("email") + "");
        Cart cart = this.cartService.fetchCartByUser(currentUser);
        List<CartDetail> cartDetails = this.cartDetailService.fetchCartDetailsByCart(cart);
        double cartTotal = cart.getTotal();
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("cartTotal", cartTotal);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/cart/delete/cartDetail/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        this.cartService.deleteCartDetail(id, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckout(@ModelAttribute(name = "cart") Cart cart) {
        List<CartDetail> newCartDetails = cart.getCartDetails();
        Cart oldCart = this.cartService.fetchCartById(cart.getId());
        this.cartService.handleUpdateCartBeforeCheckOut(newCartDetails, oldCart);
        return "redirect:/";
    }
}
