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

                <jsp:include page="../layout/header.jsp" />

                <section class="bg-sand padding-medium">
                    <div class="container">
                        <div class="row">

                            <div class="col-md-5">
                                <a href="#" class="product-image"><img
                                        src="/images/bookImages/${book.getImageLink()}"></a>
                            </div>

                            <div class="col-md-7 pl-5">
                                <div class="product-detail">
                                    <span>${book.getCategory()}</span>
                                    <h1>${book.getName()}</h1>

                                    <p>
                                        Author: <br>
                                        <strong>${book.getAuthorName()}</strong>
                                    </p>
                                    <p>
                                        Short description: <br>
                                        ${book.getShortDesc()}
                                    </p>

                                    <p>
                                        <span class="price colored fs-4">
                                            <fmt:formatNumber type="number" value="${book.getPrice()}" /> VND
                                        </span>
                                    </p>

                                    <div class="d-flex gap-3">
                                        <input type="number" name="age" id="age" class="m-0 text-center" min="1"
                                            max="12" step="1" value="1">
                                        <button type="submit" name="add-to-cart" value="27545" class="button m-0"
                                            style="background-color: #daa556;">Add to
                                            cart</button>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <section class="product-tabs mt-5">
                    <div class="container">
                        <div class="row">
                            <div class="tabs-listing">
                                <nav>
                                    <div class="nav nav-tabs d-flex justify-content-center" id="nav-tab" role="tablist">
                                        <button class="nav-link active text-uppercase px-5 py-3" id="nav-home-tab"
                                            data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab"
                                            aria-controls="nav-home" aria-selected="true">Description</button>
                                    </div>
                                </nav>
                                <div class="tab-content py-5" id="nav-tabContent">
                                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel"
                                        aria-labelledby="nav-home-tab">
                                        <p>
                                            ${book.getDetailDesc()}
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <jsp:include page="../layout/footer.jsp" />

                <script src="/client/js/jquery-1.11.0.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                    crossorigin="anonymous"></script>
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/script.js"></script>

            </body>

            </html>