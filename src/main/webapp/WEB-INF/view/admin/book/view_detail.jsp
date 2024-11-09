<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Book detail ${book.getId()}</title>
            <!--link to bootstrap-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <!--css custom-->
            <link href="/css/style.css" rel="stylesheet" />
            <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        </head>

        <body class="sb-nav-fixed">
            <!--header-->
            <jsp:include page="../layout/header.jsp" />
            <!--header-->

            <div id="layoutSidenav">
                <!--sidebar-->
                <jsp:include page="../layout/sidebar.jsp" />
                <!--sidebar-->
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4 mt-5">
                            <div class="row">
                                <div class="col-8">
                                    <div class="d-flex justify-content-between align-items-end mb-2">
                                        <h2 style="color: burlywood;">Book ${book.getId()}</h2>
                                    </div>
                                    <table class="table table-bordered">
                                        <tr class="table-info">
                                            <td><strong>ID:</strong> ${book.getId()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Name:</strong> ${book.getName()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Short description:</strong> ${book.getShortDesc()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Detail description:</strong> ${book.getDetailDesc()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Quantity:</strong> ${book.getQuantity()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Price:</strong>
                                                <fmt:formatNumber value="${book.getPrice()}" type="number" /> VND
                                            </td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Year of publication:</strong> ${book.getYearOfPublication()}
                                            </td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Author name:</strong> ${book.getAuthorName()}</td>
                                        </tr>
                                        <tr class="table-info">
                                            <td><strong>Category:</strong> ${book.getCategory()}</td>
                                        </tr>
                                    </table>
                                    <a href="/admin/book" class="btn btn-dark mt-2">Back</a>
                                </div>
                                <div class="col-4">
                                    <img alt="Book image" style="width: 250px; height: auto;" id="book"
                                        src="/images/bookImages/${book.getImageLink()}" />
                                </div>
                            </div>
                        </div>
                    </main>
                    <!--footer-->
                    <jsp:include page="../layout/footer.jsp" />
                    <!--footer-->
                </div>
            </div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
            <script src="/js/scripts.js"></script>
        </body>

        </html>