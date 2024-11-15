<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Order ${book.getId()}</title>
                    <!--link to bootstrap-->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet"
                        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                        crossorigin="anonymous">
                    <!--css custom-->
                    <link href="/css/style.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                    <!--My css-->
                    <style>
                        td,
                        th {
                            vertical-align: middle;
                        }
                    </style>
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
                                                <h2 style="color: burlywood;">Order ${order.getId()}</h2>
                                                <form:form method="post" action="/admin/export-pdf/${order.getId()}">
                                                    <button class="btn btn-primary">Export PDF</button>
                                                </form:form>
                                            </div>
                                            <table class="table table-bordered">
                                                <tr class="table-info">
                                                    <td><strong>ID:</strong> ${order.getId()}</td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>User:</strong> ${order.getUser().getEmail()}</td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Total:</strong>
                                                        <fmt:formatNumber value="${order.getTotal()}" type="number" />
                                                        VND
                                                    </td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Status:</strong> ${order.getStatus()}</td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Receiver's name:</strong> ${order.getReceiverName()}
                                                    </td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Receiver's address:</strong>
                                                        ${order.getReceiverAddress()}
                                                    </td>
                                                </tr>
                                                <tr class="table-info">
                                                    <td><strong>Receiver's phone:</strong> ${order.getReceiverPhone()}
                                                    </td>
                                                </tr>
                                            </table>

                                            <div class="mt-5">
                                                <h3 class="text-info">Order details</h3>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">Book Id</th>
                                                            <th scope="col">Book</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Price</th>
                                                            <th scope="col">Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="orderDetail" items="${order.getOrderDetails()}">
                                                            <tr>
                                                                <th scope="row">${orderDetail.getBook().getId()}</th>
                                                                <td>
                                                                    <img src="/images/bookImages/${orderDetail.getBook().getImageLink()}"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 80px; height: 80px;" alt="">
                                                                </td>
                                                                <td>${orderDetail.getBook().getName()}</td>
                                                                <td>${orderDetail.getQuantity()}</td>
                                                                <td>
                                                                    <fmt:formatNumber
                                                                        value="${orderDetail.getBook().getPrice()}"
                                                                        type="number" />
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber value="${orderDetail.getTotal()}"
                                                                        type="number" />
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>

                                            </div>
                                            <a href="/admin/order" class="btn btn-dark mt-5">Back</a>
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