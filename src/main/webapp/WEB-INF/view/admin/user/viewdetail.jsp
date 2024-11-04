<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User detail ${user.getId()}</title>
        <!--link to bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
                        <h2 style="color: burlywood;">User ${user.getId()}</h2>
                        <table class="table table-bordered">
                            <tr class="table-info">
                                <td><strong>ID:</strong> ${user.getId()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Email:</strong> ${user.getEmail()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Password:</strong> ${user.getPassword()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Full name:</strong> ${user.getFullName()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Address:</strong> ${user.getAddress()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Phone:</strong> ${user.getPhone()}</td>
                            </tr>
                            <tr class="table-info">
                                <td><strong>Role:</strong> ${user.getRole().getRoleName()}</td>
                            </tr>
                        </table>
                        <a href="/admin/user" class="btn btn-dark mt-2">Back</a>
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