package vn.dangthehao.bookshop.controller.client;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import jakarta.servlet.http.HttpServletRequest;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Book_;
import vn.dangthehao.bookshop.domain.dto.BookCriteriaDTO;
import vn.dangthehao.bookshop.service.BookService;

@Controller
public class ClientBookController {
    private final BookService bookService;

    public ClientBookController(BookService bookService) {
        this.bookService = bookService;
    }

    @GetMapping("/books")
    public String getBooksPage(Model model, BookCriteriaDTO bookCriteriaDTO,
            HttpServletRequest request) {
        // Set default value of current page
        int currentPage = 1;
        // Get value of current page if param page is exists in queryString
        if (bookCriteriaDTO.getPage().isPresent()) {
            currentPage = Integer.parseInt(bookCriteriaDTO.getPage().get());
        }
        // Set pageable without sorting
        Pageable pageable = PageRequest.of(currentPage - 1, 8);
        // If have sorting, reset pageable
        if (bookCriteriaDTO.getSort() != null && bookCriteriaDTO.getSort().isPresent()) {
            if (bookCriteriaDTO.getSort().get().equals("priceAsc")) {
                pageable = PageRequest.of(currentPage - 1, 8,
                        Sort.by(Book_.PRICE).ascending().and(Sort.by(Book_.NAME)));
            } else if (bookCriteriaDTO.getSort().get().equals("priceDesc")) {
                pageable = PageRequest.of(currentPage - 1, 8,
                        Sort.by(Book_.PRICE).descending().and(Sort.by(Book_.NAME)));
            }
        }

        String queryString = request.getQueryString();
        if (queryString != null && !queryString.isBlank()) {
            queryString = queryString.replace("page=" + currentPage, "");
        }

        Page<Book> bookPagination = this.bookService.fetchBooksWithSpec(bookCriteriaDTO, pageable);

        List<Book> books = bookPagination.getContent();
        model.addAttribute("books", books);
        model.addAttribute("totalPages", bookPagination.getTotalPages());
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("queryString", queryString);
        return "client/book/show";
    }

    @GetMapping("/book/{id}")
    public String viewSingleBook(Model model, @PathVariable long id) {
        Book book = this.bookService.fetchBookById(id);
        model.addAttribute("book", book);
        return "client/book/single_book";
    }
}
