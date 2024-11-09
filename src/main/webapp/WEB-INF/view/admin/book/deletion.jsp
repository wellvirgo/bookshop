<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Delete book ${id}</title>
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
                            <form:form method="post" action="/admin/book/delete/${id}">
                                <div class="py-3 bg-danger text-center rounded-pill opacity-75">
                                    <h5 style="color: white;">Are you sure you want to delete book ${id}?</h5>
                                </div>
                                <button type="submit" class="btn btn-danger mt-2">Delete</button>
                                <a href="/admin/book" class="btn btn-secondary mt-2">Cancel</a>
                            </form:form>
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