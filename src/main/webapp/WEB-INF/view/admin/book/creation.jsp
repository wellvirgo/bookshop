<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Create book</title>
                <!--link to bootstrap-->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                    crossorigin="anonymous">
                <!--css custom-->
                <link href="/css/style.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <!--JQuery handle upload avatar file-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const imgFile = $("#imgFile");
                        imgFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#imagePreview").attr("src", imgURL);
                            $("#imagePreview").css({ "display": "block" });
                        });
                    });
                </script>
                <!--My css-->
                <style>
                    .label {
                        color: rgb(233, 150, 42);
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
                        <div class="container mt-5">
                            <div class="row">
                                <div class="col-12 mx-auto">
                                    <form:form method="post" action="/admin/book/create" modelAttribute="newBook"
                                        enctype='multipart/form-data'>
                                        <h2 class="mb-3" style="color: burlywood;">Create new book</h2>

                                        <!--Get error if have when validate-->
                                        <c:set var="errName">
                                            <form:errors path="name" />
                                        </c:set>
                                        <c:set var="errPrice">
                                            <form:errors path="price" />
                                        </c:set>
                                        <c:set var="errQuantity">
                                            <form:errors path="quantity" />
                                        </c:set>
                                        <c:set var="errYOP">
                                            <form:errors path="yearOfPublication" />
                                        </c:set>
                                        <div class="row">
                                            <div class="mb-3 col-6">
                                                <label for="name" class="form-label label">Name</label>
                                                <form:input type="text" path="name" id="name" name="name"
                                                    class="form-control ${not empty errName?'is-invalid':''}" />
                                                <form:errors path="name" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="category" class="form-label label">Category</label>
                                                <form:select class="form-select" path="category" id="category">
                                                    <form:option value="TRINH_THAM">Trinh thám</form:option>
                                                    <form:option value="TIEU_THUYET">Tiểu thuyết</form:option>
                                                    <form:option value="TRUYEN_NGAN">Truyện ngắn</form:option>
                                                    <form:option value="LICH_SU">Lịch sử</form:option>
                                                    <form:option value="KH_VT">Khoa học-viễn tưởng</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3 col-6">
                                                <label for="quantity" class="form-label label">Quantity</label>
                                                <form:input type="number" path="quantity" id="quantity" name="quantity"
                                                    class="form-control ${not empty errQuantity?'is-invalid':''}"
                                                    required="required" />
                                                <form:errors path="quantity" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="price" class="form-label label">Price</label>
                                                <form:input type="number" path="price" id="price" name="price"
                                                    class="form-control ${not empty errPrice?'is-invalid':''}"
                                                    required="required" />
                                                <form:errors path="price" cssClass="invalid-feedback" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="mb-3 col-6">
                                                <label for="author" class="form-label label">Author</label>
                                                <form:input type="text" path="authorName" id="author" name="author"
                                                    class="form-control" />
                                            </div>
                                            <div class="mb-3 col-6">
                                                <label for="yOP" class="form-label label">Year of publication</label>
                                                <form:input type="number" path="yearOfPublication" id="yOP" name="yOP"
                                                    class="form-control ${not empty errYOP?'is-invalid':''}"
                                                    required="required" />
                                                <form:errors path="yearOfPublication" cssClass="invalid-feedback" />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="shortDesc" class="form-label label">Short description </label>
                                            <form:input type="text" class="form-control" id="shortDesc" name="shortDesc"
                                                path="shortDesc" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="detailDesc" class="form-label label">Detail description </label>
                                            <form:textarea type="text" class="form-control" id="detailDesc"
                                                name="detailDesc" path="detailDesc" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="imgFile" class="form-label label">Image of book </label>
                                            <div class="input-group">
                                                <input type="file" class="form-control" id="imgFile" name="imgFile"
                                                    accept=".png, .jpg, .jpeg">
                                                <label class="input-group-text" for="imgFile">Upload</label>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label for="imagePreview" class="form-label"
                                                style="color: rgb(249, 75, 75);">Image
                                                preview</label>
                                            <img alt="Image preview" style="width: 250px; height: auto; display: none;"
                                                id="imagePreview" />
                                        </div>

                                        <button class="btn btn-warning" type="submit">Create</button>
                                        <a href="/admin/book" class="btn btn-dark">Back</a>
                                    </form:form>
                                </div>
                            </div>
                        </div>

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