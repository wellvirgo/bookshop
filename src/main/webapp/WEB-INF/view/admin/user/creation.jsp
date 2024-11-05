<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Create user</title>
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
                    const avatarFile = $("#avatarFile");
                    avatarFile.change(function (e) {
                        const imgURL = URL.createObjectURL(e.target.files[0]);
                        $("#avatarPreview").attr("src", imgURL);
                        $("#avatarPreview").css({ "display": "block" });
                        $("#avatarPreviewContainer").css({ "display": "block" });
                    });
                });
            </script>
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
                            <div class="col-8 mx-auto">
                                <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                    enctype='multipart/form-data'>
                                    <h2 class="mb-3" style="color: burlywood;">Create new user</h2>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="text" path="email" id="email" name="email"
                                            class="form-control" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="password" class="form-label">Password</label>
                                        <form:input type="text" path="password" id="password" name="password"
                                            class="form-control" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="fullName" class="form-label">Full name</label>
                                        <form:input type="text" path="fullName" id="fullName" name="fullName"
                                            class="form-control" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="address" class="form-label">Address</label>
                                        <form:input type="text" path="address" id="address" name="address"
                                            class="form-control" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="phone" class="form-label">Phone</label>
                                        <form:input type="text" path="phone" id="phone" name="phone"
                                            class="form-control" />
                                    </div>

                                    <div class="mb-3">
                                        <label for="role" class="form-label">Role</label>
                                        <form:select class="form-select" path="role.roleName" id="role">
                                            <form:option value="ADMIN">Admin</form:option>
                                            <form:option value="USER">User</form:option>
                                        </form:select>
                                    </div>

                                    <div class="mb-3">
                                        <label for="avatarFile" class="form-label">Avatar</label>
                                        <div class="input-group">
                                            <input type="file" class="form-control" id="avatarFile" name="avatarFile"
                                                accept=".png, .jpg, .jpeg">
                                            <label class="input-group-text" for="avatarFile">Upload</label>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="avatarPreview" class="form-label">Avatar preview</label>
                                        <div id="avatarPreviewContainer"
                                            style="overflow: hidden; width: 200px; height: 200px; border-radius: 50%; display: none;">
                                            <img alt="Avatar preview" style="width: auto; height: 100%; display: none;"
                                                id="avatarPreview" />
                                        </div>
                                    </div>

                                    <button class="btn btn-warning" type="submit">Create</button>
                                    <a href="/admin/user" class="btn btn-dark">Back</a>
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