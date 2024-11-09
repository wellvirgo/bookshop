<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <html lang=" en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Book</title>
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
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">MANAGE BOOKS</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Book</li>
                            </ol>
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Table books</h3>
                                            <a class="btn btn-primary" href="/admin/book/create">Create new book</a>
                                        </div>
                                        <hr>
                                        <table class="table table-hover table-bordered">
                                            <thead>
                                                <tr class="text-center">
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Category</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Author name</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="book" items="${books}">
                                                    <tr>
                                                        <th class="text-center align-middle">${book.getId()}</th>
                                                        <td class="align-middle">${book.getName()}</td>
                                                        <td class="align-middle">${book.getCategory()}</td>
                                                        <td class="align-middle">${book.getQuantity()}</td>
                                                        <td class="align-middle">${book.getAuthorName()}</td>
                                                        <td class="align-middle">
                                                            <a class="btn btn-success"
                                                                href="/admin/book/view-detail/${book.getId()}">View</a>
                                                            <a class="btn btn-warning"
                                                                href="/admin/book/update/${book.getId()}">Update</a>
                                                            <a class="btn btn-danger"
                                                                href="/admin/book/delete/${book.getId()}">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
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