package vn.dangthehao.bookshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.service.BookService;

@Controller
public class HomePageController {
    private final BookService bookService;

    public HomePageController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Book> books = this.bookService.fetchBooks();
        model.addAttribute("books", books);
        return "client/home";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

}
