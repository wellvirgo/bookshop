<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div id="header-wrap">

        <div class="top-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6">
                        <div class="social-links">
                            <ul>
                                <li class="top-content-li">
                                    <a href="#"><i class="icon icon-facebook"></i></a>
                                </li>
                                <li class="top-content-li">
                                    <a href="#"><i class="icon icon-twitter"></i></a>
                                </li>
                                <li class="top-content-li">
                                    <a href="#"><i class="icon icon-youtube-play"></i></a>
                                </li>
                                <li class="top-content-li">
                                    <a href="#"><i class="icon icon-behance-square"></i></a>
                                </li>
                            </ul>
                        </div><!--social-links-->
                    </div>
                    <div class="col-md-6">
                        <div class="right-element">

                            <div class="action-menu">
                                <div class="search-bar">
                                    <a href="#" class="search-button search-toggle" data-selector="#header-wrap">
                                        <i class="icon icon-search"></i>
                                    </a>
                                    <form role="search" method="get" class="search-box">
                                        <input class="search-field text search-input" placeholder="Search"
                                            type="search">
                                    </form>
                                </div>
                            </div>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" style="margin-left: 10px;"><strong>Login</strong></a>
                            </c:if>
                            <c:if test="${not empty pageContext.request.userPrincipal}">
                                <a href="/cart" class="cart for-buy"><i class="icon icon-clipboard"></i>
                                    <span>Cart(${sessionScope.sumInCart})</span></a>
                                <button class="dropdown-toggle btn" type="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    <i class="icon icon-user"></i>
                                </button>
                                <ul class="dropdown-menu" style="background-color: #efe3a1;">
                                    <li><a href="#" class="dropdown-item">Account management</a></li>
                                    <li><a href="/purchase-history" class="dropdown-item">Purchase history</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li>
                                        <form method="post" action="/logout" style="margin-bottom: 0px;">
                                            <input class="form-control" type="hidden" name="${_csrf.parameterName}"
                                                value="${_csrf.token}" />
                                            <button style="color: #dca556; text-align: center;"
                                                class="btn btn-pill dropdown-item my-0" type="submit">
                                                Logout</button>
                                        </form>
                                    </li>
                                </ul>
                            </c:if>
                        </div>
                    </div><!--top-right-->
                </div>

            </div>
        </div>
    </div><!--top-content-->

    <header id="header-wrap">
        <div class="container-fluid">
            <div class="row">

                <div class="col-md-2">
                    <div class="main-logo">
                        <a href="/">
                            <h1>BookShop</h1>
                        </a>
                    </div>

                </div>

                <div class="col-md-10">

                    <nav id="navbar">
                        <div class="main-menu stellarnav">
                            <ul class="menu-list">
                                <li class="menu-item active"><a href="/">Home</a></li>
                                <li class="menu-item has-sub">
                                    <a href="#pages" class="nav-link">Category</a>

                                    <ul>
                                        <li><a href="index.html">Novel</a></li>
                                        <li><a href="index.html">History</a></li>
                                        <li><a href="index.html">Detective</a></li>
                                        <li><a href="index.html">Science fiction</a></li>
                                        <li><a href="index.html">Short story</a></li>
                                    </ul>

                                </li>
                                <li class="menu-item"><a href="/books" class="nav-link">Books</a></li>
                            </ul>

                            <div class="hamburger">
                                <span class="bar"></span>
                                <span class="bar"></span>
                                <span class="bar"></span>
                            </div>

                        </div>
                    </nav>

                </div>

            </div>
        </div>
    </header>