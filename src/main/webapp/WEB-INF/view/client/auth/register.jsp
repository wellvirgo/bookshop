<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Register</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
                integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
                crossorigin="anonymous"></script>
            <!--My css-->
            <style>
                .invalid {
                    color: red;
                }
            </style>
            <style>
                .divider:after,
                .divider:before {
                    content: "";
                    flex: 1;
                    height: 1px;
                    background: #74642F;
                }

                .h-custom {
                    height: calc(100% - 73px);
                }

                @media (max-width: 450px) {
                    .h-custom {
                        height: 100%;
                    }
                }
            </style>
        </head>

        <body style="background-color: #f3f2ec;">
            <section class="vh-100">
                <div class="container-fluid h-custom">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-md-9 col-lg-6 col-xl-5">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                                class="img-fluid" alt="Sample image">
                        </div>
                        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                            <form:form method="post" action="/register" modelAttribute="registerUser">

                                <c:set var="errEmail">
                                    <form:errors path="email" cssClass="invalid" />
                                </c:set>
                                <c:set var="errPassword">
                                    <form:errors path="password" cssClass="invalid" />
                                </c:set>
                                <c:set var="errConfirmPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid" />
                                </c:set>

                                <div
                                    class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
                                    <p class="lead fw-normal mb-0 me-3">Sign up</p>
                                </div>

                                <div class="divider d-flex align-items-center my-4">
                                </div>


                                <!-- Email input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="username">Email address</label>
                                    <form:input type="email" id="username" name="username" path="email"
                                        class="form-control form-control-lg"
                                        placeholder="Enter a valid email address" />
                                    ${errEmail}
                                </div>

                                <div class="row">
                                    <!-- First name input -->
                                    <div class="col-md-6 col-12">
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <label class="form-label" for="firstName">First name</label>
                                            <form:input type="text" id="firstName" name="firstName" path="firstName"
                                                class="form-control form-control-lg" placeholder="First name" />
                                        </div>
                                    </div>

                                    <!-- Last name input -->
                                    <div class="col-md-6 col-12">
                                        <div data-mdb-input-init class="form-outline mb-4">
                                            <label class="form-label" for="lastName">Last name</label>
                                            <form:input type="text" id="lastName" name="lastName" path="lastName"
                                                class="form-control form-control-lg" placeholder="Last name" />
                                        </div>
                                    </div>
                                </div>

                                <!-- Phone input -->
                                <div data-mdb-input-init class="form-outline mb-4">
                                    <label class="form-label" for="phone">Phone</label>
                                    <form:input type="text" id="phone" name="phone" path="phone"
                                        class="form-control form-control-lg" placeholder="Phone number" />
                                </div>

                                <!-- Password input -->
                                <div data-mdb-input-init class="form-outline mb-3">
                                    <label class="form-label" for="password">Password</label>
                                    <form:input type="password" id="password" name="password" path="password"
                                        class="form-control form-control-lg" placeholder="Enter password" />
                                    ${errPassword}
                                </div>

                                <!-- Confirm password input -->
                                <div data-mdb-input-init class="form-outline mb-3">
                                    <label class="form-label" for="confirmPassword">Confirm password</label>
                                    <form:input type="password" id="confirmPassword" name="confirmPassword"
                                        path="confirmPassword" class="form-control form-control-lg"
                                        placeholder="Enter confirm password" />
                                    ${errConfirmPassword}
                                </div>


                                <div class="text-center text-lg-start mt-4 pt-2">
                                    <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-lg"
                                        style="padding-left: 2.5rem; padding-right: 2.5rem; background-color: #7c6f44; color: white;">
                                        Sign up</button>

                                    <p class="small fw-bold mt-2 pt-1 mb-0">Do you have an account? <a href="/login"
                                            class="link-danger">Login</a></p>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
                <div
                    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5">
                    <!-- Copyright -->
                    <div class="mb-3 mb-md-0">
                        Copyright &copy 2020. All rights reserved.
                    </div>
                    <!-- Copyright -->

                    <!-- Right -->
                    <div>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#!" class="text-white me-4">
                            <i class="fab fa-google"></i>
                        </a>
                        <a href="#!" class="text-white">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                    </div>
                    <!-- Right -->
                </div>
            </section>
        </body>

        </html>