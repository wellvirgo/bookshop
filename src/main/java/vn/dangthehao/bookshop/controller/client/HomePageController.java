package vn.dangthehao.bookshop.controller.client;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("/books")
    public String getBooksPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int currentPage = 1;
        if (pageOptional.isPresent()) {
            currentPage = Integer.parseInt(pageOptional.get());
        }
        Pageable pageable = PageRequest.of(currentPage - 1, 8);
        Page<Book> bookPagination = this.bookService.fetchBooksWithPagination(pageable);
        List<Book> books = bookPagination.getContent();
        model.addAttribute("books", books);
        model.addAttribute("totalPages", bookPagination.getTotalPages());
        model.addAttribute("currentPage", currentPage);
        return "client/book/show";
    }

}
