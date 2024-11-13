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

                    <!--My css-->
                    <style>
                        td,
                        th {
                            vertical-align: middle;
                            background-color: #f3f2ec !important;
                        }

                        .fs-18,
                        h5,
                        table span {
                            font-size: 18px;
                        }

                        .fixed-width-input {
                            width: 8ch;
                        }
                    </style>

                </head>

                <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">

                    <jsp:include page="../layout/header.jsp" />

                    <div class="my-5">
                        <h1 style="text-align: center;">Purchase history</h1>
                    </div>

                    <c:if test="${orders.size()==0}">
                        <div class="text-center mt-5">
                            <h1>Purchase history is empty</h1>
                        </div>
                    </c:if>

                    <c:if test="${orders.size()>0}">
                        <div class="container">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Receiver's name</th>
                                        <th scope="col">Receiver's address</th>
                                        <th scope="col">Receiver's phone</th>
                                        <th scope="col">Total</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="order" items="${orders}">
                                        <tr class="order">
                                            <th scope="row">
                                                <span> ${order.getId()}</span>
                                            </th>
                                            <td>
                                                <span>${order.getReceiverName()}</span>
                                            </td>
                                            <td>
                                                <span>${order.getReceiverAddress()}</span>
                                            </td>
                                            <td>
                                                <span>${order.getReceiverPhone()}</span>
                                            </td>
                                            <td>
                                                <span>
                                                    <fmt:formatNumber value="${order.getTotal()}" type="number" />
                                                </span>
                                            </td>
                                            <td>
                                                <span>${order.getStatus()}</span>
                                            </td>

                                        </tr>

                                        <tr>
                                            <td><i>Book</i></td>
                                            <td><i>Name</i></td>
                                            <td><i>Quantity</i></td>
                                            <td><i>Price</i></td>
                                            <td><i>Total</i></td>
                                        </tr>

                                        <c:forEach var="orderDetail" items="${order.getOrderDetails()}">
                                            <tr>
                                                <td style="background-color: white !important;">
                                                    <img src="/images/bookImages/${orderDetail.getBook().getImageLink()}"
                                                        class="img-fluid me-5 rounded-circle"
                                                        style="width: 80px; height: 80px;" alt="">
                                                </td>
                                                <td style="background-color: white !important;">
                                                    <span>${orderDetail.getBook().getName()}</span>
                                                </td>
                                                <td style="background-color: white !important;">
                                                    <span>${orderDetail.getQuantity()}</span>
                                                </td>
                                                <td style="background-color: white !important;">
                                                    <span>
                                                        <fmt:formatNumber value="${orderDetail.getBook().getPrice()}"
                                                            type="number" />
                                                    </span>
                                                </td>
                                                <td style="background-color: white !important;">
                                                    <span>
                                                        <fmt:formatNumber value="${orderDetail.getTotal()}"
                                                            type="number" />
                                                    </span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:if>

                    <jsp:include page="../layout/footer.jsp" />

                    <script src="/client/js/jquery-1.11.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                        crossorigin="anonymous"></script>
                    <script src="/client/js/plugins.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>