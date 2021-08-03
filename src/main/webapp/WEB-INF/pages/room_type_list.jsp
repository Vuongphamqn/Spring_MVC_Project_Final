<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC Recom - Room Type List</title>
    </head>
    <body>
        <%--<jsp:include page="include/user/preloader.jsp" />--%>
        <jsp:include page="include/user/header.jsp" />
        <!-- SubHeader =============================================== -->
        <section class="parallax-window" id="short" data-parallax="scroll" data-image-src="<c:url value="resources/img/sub_view.jpg"/>" data-natural-width="1400" data-natural-height="350">
            <div id="subheader">
                <h1>Our Wonderfull Rooms</h1>
            </div>
        </section>
        <!-- End SubHeader ============================================ -->

        <div class="container margin_60">
            <div class="row">
                <div class="col-lg-9 col-md-8">
                    <c:forEach items="${roomTypes}" var="roomType" >
                        <div class="row">
                            <div class="room_desc clearfix" onclick="location.href = '<c:url value="room-type-detail/${roomType.id}"/>';">
                                <div class="col-md-7">
                                    <figure><img src="<c:url value="resources/img/${roomType.name}.jpg"/>" alt="" class="img-responsive"></figure>
                                </div>
                                <div class="col-md-5 room_list_desc">
                                    <h3>${roomType.name}</h3>
                                    <p>${roomType.description}</p>
                                    <ul>
                                        <c:forEach items="${roomType.getConvenients()}" var="c" >
                                            <li>
                                                <div class="tooltip_styled tooltip-effect-4">
                                                    <span class="tooltip-item"><i class="${c.description}"></i></span>
                                                    <div class="tooltip-content">${c.content}</div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <div class="price">from <strong>$${roomType.price }</strong> /night<small>Breakafst included</small></div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="col-lg-3 col-md-4 sidebar">

                    <div class="theiaStickySidebar">
                        <div class="box_style_3" id="general_facilities">
                            <h3>General facilities</h3>
                            <ul>
                                <li><i class="icon_set_1_icon-86"></i>Free Wifi</li>
                                <li><i class="icon_set_2_icon-103"></i>Loundry service</li>
                                <li><i class="icon_set_2_icon-110"></i>Swimming pool</li>
                                <li><i class="icon_set_1_icon-58"></i>Restaurant</li>
                                <li><i class="icon_set_1_icon-27"></i>Parking</li>
                            </ul>
                        </div>
                        <div class="box_style_2">
                            <i class="icon_set_1_icon-90"></i>
                            <h4>Need help? Call us</h4>
                            <a href="<c:url value="tel://039079099"/>" class="phone">+45 039 079 099</a>
                            <small>Monday to Friday 9.00am - 7.30pm</small>
                        </div>

                    </div>
                </div>

            </div><!-- End row -->        
        </div><!-- End container -->

        <jsp:include page="include/user/footer.jsp" />
        <div id="toTop"></div>
        <jsp:include page="include/user/js.jsp" /> 

    </body>
</html>