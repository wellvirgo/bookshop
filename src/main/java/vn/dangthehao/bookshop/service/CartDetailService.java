package vn.dangthehao.bookshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;
    private final BookService bookService;

    public CartDetailService(CartDetailRepository cartDetailRepository, BookService bookService) {
        this.cartDetailRepository = cartDetailRepository;
        this.bookService = bookService;
    }

    public List<CartDetail> fetchCartDetailsByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);
    }

    public CartDetail saveCartDetail(CartDetail cartDetail) {
        return this.cartDetailRepository.save(cartDetail);
    }

    public void deleteCartDetail(CartDetail cartDetail) {
        this.cartDetailRepository.delete(cartDetail);
    }

    public boolean validateCartDetailQuantity(CartDetail cartDetail) {
        Book book = bookService.fetchBookById(cartDetail.getBook().getId());
        int cartDetailQuantity = cartDetail.getQuantity();
        int availableBookQuantity = book.getQuantity();
        return cartDetailQuantity <= availableBookQuantity;
    }
}
