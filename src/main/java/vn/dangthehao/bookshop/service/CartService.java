package vn.dangthehao.bookshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.domain.User;
import vn.dangthehao.bookshop.repository.BookRepository;
import vn.dangthehao.bookshop.repository.CartDetailRepository;
import vn.dangthehao.bookshop.repository.CartRepository;

@Service
public class CartService {
    private final CartRepository cartRepository;
    private final UserService userService;
    private final CartDetailRepository cartDetailRepository;
    private final BookRepository bookRepository;

    public CartService(CartRepository cartRepository, UserService userService,
            CartDetailRepository cartDetailRepository, BookRepository bookRepository) {
        this.cartRepository = cartRepository;
        this.userService = userService;
        this.cartDetailRepository = cartDetailRepository;
        this.bookRepository = bookRepository;
    }

    public void addBookToCart(long bookId, HttpSession session, int quantity) {
        User currentUser = this.userService.fetchUserByEmail(session.getAttribute("email") + "");

        if (currentUser != null) {
            Cart cart = this.cartRepository.findByUser(currentUser);

            if (cart == null) {
                Cart newCart = new Cart();
                newCart.setUser(currentUser);
                newCart.setSum(0);
                newCart.setTotal(0);
                cart = this.cartRepository.save(newCart);
            }

            Book book = this.bookRepository.findById(bookId);
            CartDetail cartDetail = this.cartDetailRepository.findByCartAndBook(cart, book);

            if (cartDetail == null) {
                CartDetail newCartDetail = new CartDetail();
                if (book != null) {
                    newCartDetail.setBook(book);
                    newCartDetail.setTotal(quantity * book.getPrice());
                }
                newCartDetail.setCart(cart);
                newCartDetail.setQuantity(quantity);
                int sumInCart = cart.getSum() + 1;
                cart.setSum(sumInCart);
                cart.setTotal(cart.getTotal() + newCartDetail.getTotal());
                this.cartDetailRepository.save(newCartDetail);
                this.cartRepository.save(cart);
                session.setAttribute("sumInCart", sumInCart);
            } else {
                cartDetail.setQuantity(cartDetail.getQuantity() + quantity);
                cartDetail.setTotal(cartDetail.getTotal() + (quantity * book.getPrice()));
                cart.setTotal(cart.getTotal() + (quantity * book.getPrice()));
                this.cartDetailRepository.save(cartDetail);
                this.cartRepository.save(cart);
            }
        }

    }

    public Cart fetchCartByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public Cart fetchCartById(long id) {
        return this.cartRepository.findById(id);
    }

    public void deleteCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetail = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetail.isPresent()) {
            Cart cart = cartDetail.get().getCart();
            this.cartDetailRepository.deleteById(cartDetailId);
            int sumInCart = cart.getSum() - 1;
            cart.setSum(sumInCart);
            cart.setTotal(cart.getTotal() - cartDetail.get().getTotal());
            this.cartRepository.save(cart);
            session.setAttribute("sumInCart", sumInCart);
        }
    }

    public void handleUpdateCartBeforeCheckOut(List<CartDetail> updatedCartDetails, Cart cart) {
        double updatedTotalOfCart = 0;
        for (CartDetail updatedCartDetail : updatedCartDetails) {
            Optional<CartDetail> oldCartDetail = this.cartDetailRepository.findById(updatedCartDetail.getId());
            if (oldCartDetail.isPresent()) {
                // Update cartDetail
                oldCartDetail.get().setQuantity(updatedCartDetail.getQuantity());
                oldCartDetail.get().setTotal(updatedCartDetail.getTotal());
                this.cartDetailRepository.save(oldCartDetail.get());
                // Update total of cart
                updatedTotalOfCart += updatedCartDetail.getTotal();
                cart.setTotal(updatedTotalOfCart);
            }
        }
        this.cartRepository.save(cart);
    }

    public void deleteCart(Cart cart) {
        this.cartRepository.delete(cart);
    }
}
