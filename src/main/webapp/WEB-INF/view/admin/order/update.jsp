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
                                            </div>

                                            <div>
                                                <form:form method="post" action="/admin/order/update"
                                                    modelAttribute="order">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <form:input type="text" path="id" style="display: none;" />
                                                    <div class="form-floating">
                                                        <form:select id="status" class="form-select" path="status">
                                                            <form:option value="PENDING">PENDING</form:option>
                                                            <form:option value="SHIPPING">SHIPPING</form:option>
                                                            <form:option value="COMPLETE">COMPLETE</form:option>
                                                        </form:select>
                                                        <label for="status">Update status of order</label>
                                                    </div>
                                                    <button class="btn btn-warning mt-2" type="submit">Update</button>
                                                    <a href="/admin/order" class="btn btn-dark mt-2">Back</a>
                                                </form:form>
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