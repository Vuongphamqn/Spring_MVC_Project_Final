<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC Recom - Rooms</title>
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
            <c:if test="${statusrequire=='search'}">
                <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Arrival date</label>
                            <input class= "form-control " type="text"  readonly id="check_in" name="check_in" value="${checkIn}">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Departure date</label>
                            <input class=" form-control " type="text" " readonly  id="check_out" name="check_out" value="${checkOut}">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Room Type</label>
                            <input class= "form-control " type="text"  readonly id="room_type" name="room_type" value="${roomType}">
                        </div>
                    </div>
                </div><!-- End row -->
            </c:if>

            <c:if test="${status == 'exist'}">
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href = '<c:url value="/view-booking" />'">Your Booking</button>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="row">
                <div class="col-lg-9 col-md-8">
                    <c:forEach items="${rooms}" var="room" >
                        <div class="row">
                            <div class="room_desc clearfix">
                                <div class="col-md-7">
                                    <figure><img src="<c:url value="resources/img/${room.roomNumber}.jpg"/>" alt="" class="img-responsive"></figure>
                                </div>
                                <div class="col-md-5 room_list_desc">
                                    <h3>${room.roomType.name} ${room.roomNumber}</h3>
                                    <c:if test="${discount!=0&&statusrequire=='search'}">
                                        <h4>Discount ${discount} %</h4>
                                    </c:if>
                                    <p>${room.roomType.description}</p>
                                    <ul>
                                        <c:forEach items="${room.roomType.getConvenients()}" var="convenient" >
                                            <li>
                                                <div class="tooltip_styled tooltip-effect-4">
                                                    <span class="tooltip-item"><i class="${convenient.description}"></i></span>
                                                    <div class="tooltip-content">${convenient.content}</div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <c:choose>
                                        <c:when test="${statusrequire=='search'}">
                                            <div class="form-group">
                                                <ul>
                                                    <c:choose>
                                                        <c:when test="${discount!=0}">
                                                            <li style="text-decoration: line-through coral; color: coral "><small>$${room.price }</small></li><br>
                                                            <li><strong>$${room.price*(100-discount)/100 }</strong></li>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <li>$${room.price }</li><br>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </ul>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="form-group">
                                                <ul>
                                                    <li><strong>$${room.price }</strong></li><br>
                                                </ul>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:if test="${statusrequire=='search'}">
                                        <div class="form-group">
                                            <button type="button" class="btn btn-success" onclick="location.href = '<c:url value="/add-bookingDetail?roomId=${room.id}" />'">Book now</button>
                                        </div>
                                    </c:if>
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