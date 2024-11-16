package vn.dangthehao.bookshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.dto.BookCriteriaDTO;
import vn.dangthehao.bookshop.repository.BookRepository;
import vn.dangthehao.bookshop.service.specification.BookSpecs;

@Service
public class BookService {
    private final BookRepository bookRepository;

    public BookService(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public List<Book> fetchBooks() {
        return this.bookRepository.findAll();
    }

    public Page<Book> fetchBooksWithPagination(Pageable pageable) {
        return this.bookRepository.findAll(pageable);
    }

    public Page<Book> fetchBooksWithSpec(BookCriteriaDTO bookCriteriaDTO, Pageable pageable) {
        Specification<Book> specs = Specification.where(null);
        if (bookCriteriaDTO.getCategory() == null && bookCriteriaDTO.getYearOfPublication() == null
                && bookCriteriaDTO.getPrice() == null) {
            return this.bookRepository.findAll(pageable);
        }
        if (bookCriteriaDTO.getCategory() == null ? false : bookCriteriaDTO.getCategory().isPresent()) {
            specs = specs.and(BookSpecs.isCategoryIn(bookCriteriaDTO.getCategory().get()));
        }
        if (bookCriteriaDTO.getYearOfPublication() == null ? false
                : bookCriteriaDTO.getYearOfPublication().isPresent()) {
            specs = specs.and(buildYOPSpecification(bookCriteriaDTO.getYearOfPublication().get()));
        }
        if (bookCriteriaDTO.getPrice() == null ? false : bookCriteriaDTO.getPrice().isPresent()) {
            specs = specs.and(buildPriceSpecification(bookCriteriaDTO.getPrice().get()));
        }

        return this.bookRepository.findAll(specs, pageable);
    }

    public Specification<Book> buildYOPSpecification(List<String> yOPSelections) {
        Specification<Book> combinedSpec = Specification.where(null);
        for (String yOPSelection : yOPSelections) {
            int minYOP = 0;
            int maxYOP = 0;
            switch (yOPSelection) {
                case "truoc-2000": {
                    maxYOP = 1999;
                    combinedSpec = combinedSpec.or(BookSpecs.isYOPLess(maxYOP));
                    break;
                }
                case "sau-2000": {
                    minYOP = 2000;
                    combinedSpec = combinedSpec.or(BookSpecs.isYOPGreater(minYOP));
                    break;
                }

                default:
                    break;
            }
        }
        return combinedSpec;
    }

    public Specification<Book> buildPriceSpecification(List<String> priceSelections) {
        Specification<Book> combinedSpec = Specification.where(null);
        for (String priceSelection : priceSelections) {
            int minPrice = 0;
            int maxPrice = 0;
            switch (priceSelection) {
                case "duoi-50k": {
                    minPrice = 0;
                    maxPrice = 49999;
                    combinedSpec = combinedSpec.or(BookSpecs.isPriceInRange(minPrice, maxPrice));
                    break;
                }
                case "tu50k-toi100k": {
                    minPrice = 50000;
                    maxPrice = 100000;
                    combinedSpec = combinedSpec.or(BookSpecs.isPriceInRange(minPrice, maxPrice));
                    break;
                }
                case "tren-100k": {
                    minPrice = 100000;
                    combinedSpec = combinedSpec.or(BookSpecs.isPriceGreater(minPrice));
                    break;
                }

                default:
                    break;
            }
        }
        return combinedSpec;
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

    public void updateBookQuantityAfterOrder(long bookId, int orderedQuantity) {
        Book book = this.fetchBookById(bookId);
        int updateQuantity = book.getQuantity() - orderedQuantity;
        book.setQuantity(updateQuantity);
        this.saveBook(book);
    }

    public long countBooks() {
        return this.bookRepository.count();
    }

    public void updateNumOfSales(long bookId, int orderedQuantity) {
        Book book = this.fetchBookById(bookId);
        int updateNumOfSales = book.getNumOfSales() + orderedQuantity;
        book.setNumOfSales(updateNumOfSales);
        this.saveBook(book);
    }

    public Optional<Book> fetchBestSellingBook() {
        return this.bookRepository.findTopByOrderByNumOfSalesDesc();
    }
}
