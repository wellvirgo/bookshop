package vn.dangthehao.bookshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.dangthehao.bookshop.domain.Cart;
import vn.dangthehao.bookshop.domain.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    public Cart findByUser(User user);

    public Cart findById(long id);
}
