<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <title>Book shop</title>
                    <meta charset="utf-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <meta name="format-detection" content="telephone=no">
                    <meta name="mobile-web-app-capable" content="yes">
                    <meta name="author" content="">
                    <meta name="keywords" content="">
                    <meta name="description" content="">

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
                        crossorigin="anonymous">

                    <link rel="stylesheet" type="text/css" href="/client/css/normalize.css">
                    <link rel="stylesheet" type="text/css" href="/client/icomoon/icomoon.css">
                    <link rel="stylesheet" type="text/css" href="/client/css/vendor.css">
                    <link rel="stylesheet" type="text/css" href="/client/css/style.css">

                </head>

                <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0" class="row">

                    <jsp:include page="../layout/header.jsp" />

                    <section id="client-holder" data-aos="fade-up"
                        style="padding: 0px !important; width: 20%; height: 50%;">
                        <div class="container">
                            <div class="row">
                                <div class="inner-content">

                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <h3>Category</h3>
                                            <div id="categoryFilter">
                                                <div class="form-check form-check-inline">
                                                    <input id="TRINH_THAM" type="checkbox" value="TRINH_THAM"
                                                        class="form-check-input">
                                                    <label for="TRINH_THAM" class="form-check-label">TRINH_THAM</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="TRUYEN_NGAN" type="checkbox" value="TRUYEN_NGAN"
                                                        class="form-check-input">
                                                    <label for="TRUYEN_NGAN"
                                                        class="form-check-label">TRUYEN_NGAN</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="LICH_SU" type="checkbox" value="LICH_SU"
                                                        class="form-check-input">
                                                    <label for="LICH_SU" class="form-check-label">LICH_SU</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="KHOA-HOC_VIEN-TUONG" type="checkbox"
                                                        value="KHOA-HOC_VIEN-TUONG" class="form-check-input">
                                                    <label for="KHOA-HOC_VIEN-TUONG"
                                                        class="form-check-label">KHOA-HOC_VIEN-TUONG</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="TIEU_THUYET" type="checkbox" value="TIEU_THUYET"
                                                        class="form-check-input">
                                                    <label for="TIEU_THUYET"
                                                        class="form-check-label">TIEU_THUYET</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <h3>Year of publication</h3>
                                            <div id="yOPFilter">
                                                <div class="form-check form-check-inline">
                                                    <input id="bf2000" type="checkbox" value="truoc-2000"
                                                        class="form-check-input">
                                                    <label for="bf2000" class="form-check-label">Before 2000</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="af2000" type="checkbox" value="sau-2000"
                                                        class="form-check-input">
                                                    <label for="af2000" class="form-check-label">After 2000</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <h3>Price</h3>
                                            <div id="priceFilter">
                                                <div class="form-check form-check-inline">
                                                    <input id="lt50" type="checkbox" value="duoi-50k"
                                                        class="form-check-input">
                                                    <label for="lt50" class="form-check-label">Less than 50K</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="50to100" type="checkbox" value="tu50k-toi100k"
                                                        class="form-check-input">
                                                    <label for="50to100" class="form-check-label">50K to 100K</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input id="gt100" type="checkbox" value="tren-100k"
                                                        class="form-check-input">
                                                    <label for="gt100" class="form-check-label">Greater than
                                                        100K</label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-2">
                                        <div class="col-12">
                                            <h3>Sort by price</h3>
                                            <div class="form-check form-check-inline">
                                                <input id="noSorting" type="radio" value="noSorting"
                                                    class="form-check-input" name="sorting" checked>
                                                <label for="noSorting" class="form-check-label">No sorting</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input id="priceAsc" type="radio" value="priceAsc"
                                                    class="form-check-input" name="sorting">
                                                <label for="priceAsc" class="form-check-label">Price
                                                    ascending</label>
                                            </div>
                                            <div class="form-check form-check-inline">
                                                <input id="priceDesc" type="radio" value="priceDesc"
                                                    class="form-check-input" name="sorting">
                                                <label for="priceDesc" class="form-check-label">Price
                                                    descending</label>
                                            </div>
                                        </div>
                                    </div>

                                    <button id="btnFilter" class="btn btn-pill btn-primary">
                                        <strong>Fill books</strong>
                                    </button>


                                </div>
                            </div>
                        </div>
                    </section>

                    <section id="featured-books" class="py-5 my-5" style="width: 80%;">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">

                                    <div class="section-header align-center">
                                        <div class="title">
                                            <span>All book in our shop</span>
                                        </div>
                                        <h2 class="section-title">Books</h2>
                                    </div>

                                    <div class="product-list" data-aos="fade-up">
                                        <div class="row">

                                            <c:forEach var="book" items="${books}">
                                                <div class="col-md-3">
                                                    <div class="product-item">
                                                        <figure class="product-style">
                                                            <a href="/book/${book.getId()}">
                                                                <img src="/images/bookImages/${book.getImageLink()}"
                                                                    alt="Books" class="product-item">
                                                            </a>
                                                            <form method="post"
                                                                action="/add-book-to-cart/${book.getId()}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit" class="add-to-cart"
                                                                    data-product-tile="add-to-cart">Add to
                                                                    Cart</button>
                                                            </form>
                                                        </figure>
                                                        <figcaption>
                                                            <h3>
                                                                <a href="/book/${book.getId()}">${book.getName()}</a>
                                                            </h3>
                                                            </h3>
                                                            <span>Author: ${book.getAuthorName()}</span>
                                                            <div class="item-price">
                                                                <fmt:formatNumber value="${book.getPrice()}"
                                                                    type="number" /> VND
                                                            </div>
                                                        </figcaption>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <nav aria-label="Page navigation example" class="mt-5">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
                                                        <a class="page-link"
                                                            href="/books?page=${currentPage-1}${queryString}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPages}" varStatus="status">
                                                        <li
                                                            class="page-item ${currentPage eq status.index ? 'active' : ''}">
                                                            <a class="page-link"
                                                                href="/books?page=${status.index}${queryString}">${status.index}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li
                                                        class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
                                                        <a class="page-link"
                                                            href="/books?page=${currentPage+1}${queryString}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div><!--ft-books-slider-->
                                    </div><!--grid-->

                                </div><!--inner-content-->
                            </div>
                        </div>
                    </section>

                    <jsp:include page="../layout/footer.jsp" />

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="/client/js/jquery-1.11.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                        crossorigin="anonymous"></script>
                    <script src="/client/js/plugins.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>