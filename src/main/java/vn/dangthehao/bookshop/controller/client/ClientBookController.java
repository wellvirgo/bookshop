package vn.dangthehao.bookshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.service.BookService;

@Controller
public class ClientBookController {
    private final BookService bookService;

    public ClientBookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/book/{id}")
    public String viewSingleBook(Model model, @PathVariable long id) {
        Book book = this.bookService.fetchBookById(id);
        model.addAttribute("book", book);
        return "client/book/single_book";
    }
}
