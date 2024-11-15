package vn.dangthehao.bookshop.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import vn.dangthehao.bookshop.domain.Book;
import vn.dangthehao.bookshop.domain.Book_;

public class BookSpecs {
    public static Specification<Book> isCategoryIn(List<String> categories) {
        return (root, query, builder) -> {
            return builder.in(root.get(Book_.CATEGORY)).value(categories);
        };
    }

    public static Specification<Book> isPriceInRange(double min, double max) {
        return (root, query, builder) -> {
            return builder.between(root.get(Book_.PRICE), min, max);
        };
    }

    public static Specification<Book> isYOPGreater(int min) {
        return (root, query, builder) -> {
            return builder.ge(root.get(Book_.YEAR_OF_PUBLICATION), min);
        };
    }

    public static Specification<Book> isYOPLess(int max) {
        return (root, query, builder) -> {
            return builder.lessThan(root.get(Book_.YEAR_OF_PUBLICATION), max);
        };
    }

    public static Specification<Book> isPriceGreater(int priceCompare) {
        return (root, query, builder) -> {
            return builder.greaterThan(root.get(Book_.PRICE), priceCompare);
        };
    }
}
