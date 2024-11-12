package vn.dangthehao.bookshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.dangthehao.bookshop.domain.CartDetail;
import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.Book;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    public CartDetail findByCartAndBook(Cart cart, Book book);

    public List<CartDetail> findByCart(Cart cart);
}
