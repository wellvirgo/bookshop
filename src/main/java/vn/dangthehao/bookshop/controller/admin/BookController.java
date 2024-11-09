package vn.dangthehao.bookshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.service.BookService;
import vn.dangthehao.bookshop.service.UploadFileService;

@Controller
public class BookController {
    private final BookService bookService;
    private final UploadFileService uploadFileService;

    public BookController(BookService bookService, UploadFileService uploadFileService) {
        this.bookService = bookService;
        this.uploadFileService = uploadFileService;
    }

    @GetMapping("/admin/book")
    public String getProductDashboard(Model model) {
        List<Book> books = this.bookService.fetchBooks();
        model.addAttribute("books", books);
        return "admin/book/show";
    }

    @GetMapping("/admin/book/view-detail/{id}")
    public String getBookDetailPage(Model model, @PathVariable long id) {
        Book book = this.bookService.fetchBookById(id);
        model.addAttribute("book", book);
        return "admin/book/view_detail";
    }

    @GetMapping("/admin/book/create")
    public String getBookCreationPage(Model model) {
        model.addAttribute("newBook", new Book());
        return "admin/book/creation";
    }

    @PostMapping("/admin/book/create")
    public String createBook(@Valid @ModelAttribute(name = "newBook") Book newBook,
            BindingResult bookBindingResult,
            @RequestParam("imgFile") MultipartFile file) {
        // if have error when validate, do not create new book
        List<FieldError> errors = bookBindingResult.getFieldErrors();
        if (!errors.isEmpty()) {
            return "/admin/book/creation";
        }
        // if do not have error, create new book
        String imageLink = this.uploadFileService.handleUploadFile(file, "bookImages");
        newBook.setImageLink(imageLink);
        this.bookService.saveBook(newBook);
        return "redirect:/admin/book";
    }

    @GetMapping("/admin/book/update/{id}")
    public String getUpdateBookPage(Model model, @PathVariable long id) {
        Book selectedBook = this.bookService.fetchBookById(id);
        model.addAttribute("selectedBook", selectedBook);
        return "admin/book/update";
    }

    @PostMapping("/admin/book/update")
    public String updateBook(@Valid @ModelAttribute(name = "selectedBook") Book selectedBook,
            BindingResult bookBindingResult, @RequestParam(name = "imgFile") MultipartFile file) {
        List<FieldError> errors = bookBindingResult.getFieldErrors();
        if (!errors.isEmpty()) {
            return "admin/book/update";
        }
        Book updateBook = this.bookService.fetchBookById(selectedBook.getId());
        if (!file.isEmpty()) {
            String imgLink = this.uploadFileService.handleUploadFile(file, "bookImages");
            updateBook.setImageLink(imgLink);
        }
        updateBook.setName(selectedBook.getName());
        updateBook.setShortDesc(selectedBook.getShortDesc());
        updateBook.setDetailDesc(selectedBook.getDetailDesc());
        updateBook.setQuantity(selectedBook.getQuantity());
        updateBook.setPrice(selectedBook.getPrice());
        updateBook.setYearOfPublication(selectedBook.getYearOfPublication());
        updateBook.setAuthorName(selectedBook.getAuthorName());
        updateBook.setCategory(selectedBook.getCategory());
        this.bookService.saveBook(updateBook);
        return "redirect:/admin/book";
    }

    @GetMapping("/admin/book/delete/{id}")
    public String getDeletionBookPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        return "admin/book/deletion";
    }

    @PostMapping("/admin/book/delete/{id}")
    public String deleteBook(@PathVariable long id) {
        this.bookService.deleteBookById(id);
        return "redirect:/admin/book";
    }
}
