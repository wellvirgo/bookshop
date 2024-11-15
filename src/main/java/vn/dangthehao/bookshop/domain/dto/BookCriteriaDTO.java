package vn.dangthehao.bookshop.domain.dto;

import java.util.List;
import java.util.Optional;

public class BookCriteriaDTO {
    private Optional<String> page;
    private Optional<String> name;
    private Optional<List<String>> category;
    private Optional<List<String>> yearOfPublication;
    private Optional<List<String>> price;
    private Optional<String> sort;

    public Optional<String> getPage() {
        return page != null ? page : Optional.empty();
    }

    public void setPage(Optional<String> page) {
        this.page = page;
    }

    public Optional<String> getName() {
        return name;
    }

    public void setName(Optional<String> name) {
        this.name = name;
    }

    public Optional<List<String>> getCategory() {
        return category;
    }

    public void setCategory(Optional<List<String>> category) {
        this.category = category;
    }

    public Optional<List<String>> getPrice() {
        return price;
    }

    public Optional<List<String>> getYearOfPublication() {
        return yearOfPublication;
    }

    public void setYearOfPublication(Optional<List<String>> yearOfPublication) {
        this.yearOfPublication = yearOfPublication;
    }

    public void setPrice(Optional<List<String>> price) {
        this.price = price;
    }

    public Optional<String> getSort() {
        return sort;
    }

    public void setSort(Optional<String> sort) {
        this.sort = sort;
    }

}
