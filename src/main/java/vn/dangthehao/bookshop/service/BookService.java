package vn.dangthehao.bookshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.repository.BookRepository;

@Service
public class BookService {
    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> fetchBooks() {
        return this.bookRepository.findAll();
    }

    public Book fetchBookById(long id) {
        return this.bookRepository.findById(id);
    }

    public void saveBook(Book book) {
        this.bookRepository.save(book);
    }

    public void deleteBookById(long id) {
        this.bookRepository.deleteById(id);
    }
}
