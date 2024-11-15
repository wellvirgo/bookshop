package vn.dangthehao.bookshop.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Repository;

import vn.dangthehao.bookshop.domain.Book;

@Repository
public interface BookRepository extends JpaRepository<Book, Long>, JpaSpecificationExecutor<Book> {
    public Book findById(long id);

    @NonNull
    public Page<Book> findAll(@NonNull Pageable pageable);

    @NonNull
    public Page<Book> findAll(@Nullable Specification<Book> specs, @NonNull Pageable pageable);
}
