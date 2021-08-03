<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="default-header">
    <div class="menutop-wrap">
        <div class="menu-top container">
            <div class="d-flex justify-content-between align-items-center">
                <ul class="list">
                    <li><a href="tel:+12312-3-1209">+12312-3-1209</a></li>
                    <li><a href="mailto:support@colorlib.com">support@colorlib.com</a></li>								
                </ul>
                <ul class="list">
                    <li><a href="#">login</a></li>
                </ul>
            </div>
        </div>					
    </div>
    <nav class="navbar navbar-expand-lg  navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="<c:url value="/resources/img/logo.png"/>" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#catagory">Category</a></li>
                    <li><a href="#men">Men</a></li>
                    <li><a href="#women">Women</a></li>
                    <li><a href="#latest">latest</a></li>
                    <!-- Dropdown -->
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            Pages
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="category.html">Category</a>
                            <a class="dropdown-item" href="single.html">Single</a>
                            <a class="dropdown-item" href="cart.html">Cart</a>
                            <a class="dropdown-item" href="checkout.html">Checkout</a>
                            <a class="dropdown-item" href="confermation.html">Confermation</a>
                            <a class="dropdown-item" href="login.html">Login</a>
                            <a class="dropdown-item" href="tracking.html">Tracking</a>
                            <a class="dropdown-item" href="generic.html">Generic</a>
                            <a class="dropdown-item" href="elements.html">Elements</a>
                        </div>
                    </li>									
                </ul>
            </div>						
        </div>
    </nav>
</header>