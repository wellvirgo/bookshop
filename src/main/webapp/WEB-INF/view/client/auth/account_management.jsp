<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <title>Account management</title>
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

                <!--JQuery handle upload avatar file-->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatar = $("#avatarFile");
                        avatar.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

                <!--My css-->
                <style>
                    #avatar {
                        width: 100px;
                        height: 100px;
                        background-image: url('/images/avatars/${user.getAvatarLink()}');
                        background-repeat: no-repeat;
                        background-size: cover;
                        background-position: center;
                        clip-path: circle();
                    }
                </style>

            </head>

            <body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">

                <jsp:include page="../layout/header.jsp" />

                <div class="container">

                    <div class="row">
                        <div class="col-md-8">
                            <div class="title align-center">
                                <h2>Account's information</h2>
                            </div>
                            <form:form method="post" action="/account/update" modelAttribute="user"
                                enctype="multipart/form-data">
                                <div class="mb-3" style="display: none;">
                                    <form:input type="text" path="id" class="form-control" readonly="true" />
                                </div>
                                <div class="mb-3">
                                    <div id="avatar"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input id="email" type="email" path="email" class="form-control"
                                        readonly="true" />
                                </div>
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Full name</label>
                                    <form:input id="fullName" type="text" path="fullName" class="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Address</label>
                                    <form:input id="address" type="text" path="address" class="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Phone</label>
                                    <form:input id="phone" type="text" path="phone" class="form-control" />
                                </div>
                                <div class="mb-3">
                                    <label for="changeAvatar" class="form-label">Change avatar</label>
                                    <div class="input-group">
                                        <input type="file" class="form-control" id="avatarFile" name="avatarFile"
                                            accept=".png, .jpg, .jpeg">
                                        <label class="input-group-text" for="avatarFile">Upload</label>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label" style="color: rgb(249, 75, 75);">Avatar preview</label>
                                    <c:if test="${user.getAvatarLink()!=null}">
                                        <img alt="Avatar preview" id="avatarPreview"
                                            style="width: 100px; height: auto; display: block;"
                                            src="/images/avatars/${user.getAvatarLink()}" />
                                    </c:if>
                                    <img alt="Avatar preview" style="width: 250px; height: auto; display: none; "
                                        id="avatarPreview" />
                                </div>

                                <button type="submit" class="btn btn-warning btn-pill">Update</button>
                                <button class="btn btn-dark btn-pill"><a href="/">Back</a></button>
                            </form:form>
                        </div>

                    </div>


                </div>


                <jsp:include page="../layout/footer.jsp" />

                <script src="/client/js/jquery-1.11.0.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                    crossorigin="anonymous"></script>
                <script src="/client/js/plugins.js"></script>
                <script src="/client/js/script.js"></script>

            </body>

            </html>