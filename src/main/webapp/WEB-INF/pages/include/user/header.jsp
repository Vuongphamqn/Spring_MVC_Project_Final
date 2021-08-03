<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div class="container">
        <div class="row">
            <div class="col--md-3 col-sm-3 col-xs-3">
                <a href="<c:url value="/" />" id="logo">
                    <img src="<c:url value="/resources/img/logo.png" />" width="190" height="23" alt="" data-retina="true">
                </a>
            </div>
            <nav class="col--md-9 col-sm-9 col-xs-9">
                <!--<a class="cmn-toggle-switch cmn-toggle-switch__htx open_close" href="javascript:void(0);"><span>Menu mobile</span></a>-->
                <ul id="lang_top">
                    <li><a href="<c:url value="" />" class="active">EN</a></li>
                    <li><a href="<c:url value="" />">VN</a></li>
                    <li><a href="<c:url value="" />">FR</a></li>
                </ul>
                <div class="main-menu">
                    <ul>
                        <li class="submenu">
                            <a href="<c:url value="/room-type-list" />" class="show-submenu">Room Type<i class="icon-down-open-mini"></i></a>
                            <ul>
                                <c:forEach items="${roomTypeHeaders}" var="roomType">
                                    <li><a href="<c:url value="/room-type-detail/${roomType.id}" />">${roomType.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="<c:url value="/room-list" />" class="show-submenu">Room<i class="icon-down-open-mini"></i></a>
                            <ul>
                                <c:forEach items="${roomHeaders}" var="room">
                                    <li><a href="<c:url value="/room-detail/${room.id}" />">${room.roomType.name} ${room.roomNumber}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li><a href="<c:url value="/contacts" />">Contacts</a></li>
                        <li><a href="<c:url value="/aboutus" />">About Us</a></li>
                        <li><a href="<c:url value="/admin/home.jsp" />">Login</a></li>
                    </ul>
                </div>
            </nav>`
        </div>
    </div>
</header>