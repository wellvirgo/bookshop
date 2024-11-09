<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
                    crossorigin="anonymous">

                <link rel="stylesheet" type="text/css" href="/client/css/normalize.css">
                <link rel="stylesheet" type="text/css" href="/client/icomoon/icomoon.css">
                <link rel="stylesheet" type="text/css" href="/client/css/vendor.css">
                <link rel="stylesheet" type="text/css" href="/client/css/style.css">

            </head>

            <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">

                <jsp:include page="./layout/header.jsp" />

                <section id="billboard">

                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <button class="prev slick-arrow">
                                    <i class="icon icon-arrow-left"></i>
                                </button>

                                <div class="main-slider pattern-overlay">
                                    <div class="slider-item">
                                        <div class="banner-content">
                                            <h2 class="banner-title">Life of the Wild</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat
                                                amet,
                                                libero
                                                ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend.
                                                Amet,
                                                quis
                                                urna, a eu.</p>
                                            <div class="btn-wrap">
                                                <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                                        class="icon icon-ns-arrow-right"></i></a>
                                            </div>
                                        </div><!--banner-content-->
                                        <img src="/client/images/main-banner1.jpg" alt="banner" class="banner-image">
                                    </div><!--slider-item-->

                                    <div class="slider-item">
                                        <div class="banner-content">
                                            <h2 class="banner-title">Birds gonna be Happy</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu feugiat
                                                amet,
                                                libero
                                                ipsum enim pharetra hac. Urna commodo, lacus ut magna velit eleifend.
                                                Amet,
                                                quis
                                                urna, a eu.</p>
                                            <div class="btn-wrap">
                                                <a href="#" class="btn btn-outline-accent btn-accent-arrow">Read More<i
                                                        class="icon icon-ns-arrow-right"></i></a>
                                            </div>
                                        </div><!--banner-content-->
                                        <img src="/client/images/main-banner2.jpg" alt="banner" class="banner-image">
                                    </div><!--slider-item-->

                                </div><!--slider-->

                                <button class="next slick-arrow">
                                    <i class="icon icon-arrow-right"></i>
                                </button>

                            </div>
                        </div>
                    </div>

                </section>

                <section id="client-holder" data-aos="fade-up">
                    <div class="container">
                        <div class="row">
                            <div class="inner-content">
                                <div class="logo-wrap">
                                    <div class="grid">
                                        <a href="#"><img src="/client/images/client-image1.png" alt="client"></a>
                                        <a href="#"><img src="/client/images/client-image2.png" alt="client"></a>
                                        <a href="#"><img src="/client/images/client-image3.png" alt="client"></a>
                                        <a href="#"><img src="/client/images/client-image4.png" alt="client"></a>
                                        <a href="#"><img src="/client/images/client-image5.png" alt="client"></a>
                                    </div>
                                </div><!--image-holder-->
                            </div>
                        </div>
                    </div>
                </section>

                <section id="featured-books" class="py-5 my-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">

                                <div class="section-header align-center">
                                    <div class="title">
                                        <span>Some quality items</span>
                                    </div>
                                    <h2 class="section-title">Featured Books</h2>
                                </div>

                                <div class="product-list" data-aos="fade-up">
                                    <div class="row">

                                        <c:forEach var="book" begin="0" end="3" items="${books}">
                                            <div class="col-md-3">
                                                <div class="product-item">
                                                    <figure class="product-style">
                                                        <a href="/book/${book.getId()}">
                                                            <img src="/images/bookImages/${book.getImageLink()}"
                                                                alt="Books" class="product-item">
                                                        </a>
                                                        <button type="button" class="add-to-cart"
                                                            data-product-tile="add-to-cart">Add to
                                                            Cart</button>
                                                    </figure>
                                                    <figcaption>
                                                        <h3>
                                                            <a href="/book/${book.getId()}">${book.getName()}</a>
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

                                    </div><!--ft-books-slider-->
                                </div><!--grid-->


                            </div><!--inner-content-->
                        </div>

                        <div class="row">
                            <div class="col-md-12">

                                <div class="btn-wrap align-right">
                                    <a href="/books" class="btn-accent-arrow">View all products <i
                                            class="icon icon-ns-arrow-right"></i></a>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>

                <jsp:include page="./layout/footer.jsp" />

                <script src="/client/js/jquery-1.11.0.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                    crossorigin="anonymous"></script>
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/script.js"></script>

            </body>

            </html>