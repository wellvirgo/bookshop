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
                        <h1 style="text-align: center;">Your cart</h1>
                    </div>

                    <div class="container">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Book</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Total</th>
                                    <th scope="col">Handle</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${cartDetails.size()>0}">
                                    <c:forEach var="cartDetail" items="${cartDetails}">
                                        <tr>
                                            <th scope="row">
                                                <img src="/images/bookImages/${cartDetail.getBook().getImageLink()}"
                                                    class="img-fluid me-5 rounded-circle"
                                                    style="width: 80px; height: 80px;" alt="">
                                            </th>
                                            <td>
                                                <span>${cartDetail.getBook().getName()}</span>
                                            </td>
                                            <td>
                                                <input type="number" class="fixed-width-input"
                                                    id="quantity${cartDetail.getId()}"
                                                    value="${cartDetail.getQuantity()}"
                                                    onchange="changeQuantity('${cartDetail.getId()}')">
                                            </td>
                                            <td>
                                                <span id="price${cartDetail.getId()}">
                                                    <fmt:formatNumber type="number"
                                                        value="${cartDetail.getBook().getPrice()}" />
                                                </span>
                                            </td>
                                            <td>
                                                <span id="total${cartDetail.getId()}" class="cartDetailTotal">
                                                    <fmt:formatNumber type="number" value="${cartDetail.getTotal()}" />
                                                </span>
                                            </td>
                                            <td>
                                                <form action="/cart/delete/cartDetail/${cartDetail.getId()}"
                                                    method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <button type="submit" class="btn btn-pill"
                                                        style="background-color:#f3f2ec; color: tomato;">
                                                        Delete
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
                        <c:if test="${cartDetails.size()==0}">
                            <div>
                                <h3 style="text-align: center; border-bottom: 1px solid #E0E0E0; padding: 20px;">You
                                    don't have any
                                    cart details</h3>
                            </div>
                        </c:if>

                        <c:if test="${cartDetails.size()>0}">
                            <div class="mt-5 row g-4 justify-content-start"
                                style="border-bottom: 1px solid #E0E0E0; padding-bottom: 100px;">
                                <div class="col-sm-8 col-md-8 col-12">
                                    <div class="bg-light rounded"
                                        style="border: 10px dotted #dca556; border-radius: 10% !important;">
                                        <div class="p-4">
                                            <h1 class="display-6 mb-4">Cart <span class="fw-normal">Total</span>
                                            </h1>
                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="mb-0 me-4">Subtotal:</h5>
                                                <p class="mb-0 fs-18" data-cart-total="${cartTotal}" id="subTotal">
                                                    <fmt:formatNumber type="number" value="${cartTotal}" /> VND
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <h5 class="mb-0 me-4">Shipping</h5>
                                                <div class="">
                                                    <p class="mb-0"></p>
                                                </div>
                                            </div>
                                            <p class="mb-0 text-end"></p>
                                        </div>
                                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                            <h5 class="mb-0 ps-4 me-4">Total</h5>
                                            <p class="mb-0 pe-4 fs-18" data-cart-total="${cartTotal}" id="cartTotal">
                                                <fmt:formatNumber type="number" value="${cartTotal}" /> VND
                                            </p>
                                        </div>

                                        <form:form method="post" action="/confirm-checkout" modelAttribute="cart"
                                            style="margin-bottom: 0px;">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <form:input type="hidden" path="id" />
                                            <c:forEach var="cartDetail" items="${cartDetails}" varStatus="status">
                                                <div style="display: none;">
                                                    <form:input type="text" path="cartDetails[${status.index}].id" />
                                                    <form:input type="text" id="quantityToServer${cartDetail.getId()}"
                                                        path="cartDetails[${status.index}].quantity" />
                                                    <form:input type="text" id="totalToServer${cartDetail.getId()}"
                                                        path="cartDetails[${status.index}].total" />
                                                </div>
                                            </c:forEach>
                                            <button
                                                class="btn border-secondary rounded-pill px-4 py-3  text-uppercase mb-4 ms-4"
                                                type="submit"
                                                style="background-color: #dca556; color: black !important;">Proceed
                                                Checkout
                                            </button>
                                        </form:form>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />

                    <!--My js-->
                    <script>
                        function changeQuantity(id) {
                            const quantity = document.getElementById(`quantity` + id).value;
                            let price = document.getElementById(`price` + id).innerText.trim().replace(/[^0-9.-]+/g, "");
                            let totalOfCartDetail = document.getElementById(`total` + id);

                            if (!isNaN(+quantity) && !isNaN(+price)) {
                                // Reset total of cart detail
                                totalOfCartDetail.innerText = formatNumber((+quantity) * (+price));

                                // Set quantity of book and total to send to Server
                                document.getElementById('quantityToServer' + id).value = quantity;
                                document.getElementById('totalToServer' + id).value = (+quantity) * (+price);

                                // Reset subTotal and cartTotal
                                let totalOfCartDetails = Array.from(document.querySelectorAll(".cartDetailTotal"));
                                let newSubTotal = 0;
                                totalOfCartDetails.forEach(function (item) {
                                    const totalItem = item.innerText.trim().replace(/[^0-9.-]+/g, "");
                                    newSubTotal += (+totalItem);
                                });
                                document.getElementById("subTotal").innerText = formatNumber(newSubTotal) + " VND";
                                document.getElementById("cartTotal").innerText = formatNumber(newSubTotal) + " VND";
                            }
                        }

                        // Format number to iii,iii
                        function formatNumber(number) {
                            return number.toLocaleString('en-US')
                        }
                    </script>

                    <script src="/client/js/jquery-1.11.0.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                        crossorigin="anonymous"></script>
                    <script src="/client/js/plugins.js"></script>
                    <script src="/client/js/script.js"></script>

                </body>

                </html>