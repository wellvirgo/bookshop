package vn.dangthehao.bookshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.dangthehao.bookshop.domain.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    public Book findById(long id);
}
