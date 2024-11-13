package vn.dangthehao.bookshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;

import vn.dangthehao.bookshop.domain.Order;
import vn.dangthehao.bookshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    public List<Order> findByUser(User user);

    @NonNull
    public Page<Order> findAll(@NonNull Pageable pageable);
}
