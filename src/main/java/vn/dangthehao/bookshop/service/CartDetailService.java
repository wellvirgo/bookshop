package vn.dangthehao.bookshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public List<CartDetail> fetchCartDetailsByCart(Cart cart) {
        return this.cartDetailRepository.findByCart(cart);
    }

    public CartDetail saveCartDetail(CartDetail cartDetail) {
        return this.cartDetailRepository.save(cartDetail);
    }
}
