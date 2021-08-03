<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC - Add Service Bookings</title>
    </head>
    <body>
        <%--<jsp:include page="include/user/preloader.jsp" />--%>
        <jsp:include page="include/user/header.jsp" />
        <br><br><br><br>
        <div class="container">
            <div class="container ">
                <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Arrival date</label>
                            <input class= "form-control " type="text" readonly id="check_in" name="checkIn" value="${checkIn}">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Departure date</label>
                            <input class=" form-control " type="text" readonly  id="check_out" name="checkOut" value="${checkOut}">
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <label>Room</label>
                            <input class=" form-control " type="text" readonly  id="room" name="room" value="${room.roomType.name} ${room.roomNumber}">
                        </div>
                    </div>
                </div><!-- End row -->
                <div class="row">
                    <div class="col-md-2 col-sm-2">
                        <div class="form-group">
                            <button type="button" class="btn btn-success" 
                                    onclick="location.href = '<c:url value="/view-booking" />'">Back</button>
                        </div>
                    </div>
                </div>
            </div><!-- End row --> 
            <div class="container">
                <c:if test = "${serviceBookings != null && serviceBookings.size()>0}">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <h4>Services Booking</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total Price</th>
                                        <th>Action</th> 
                                    </tr>
                                    <c:forEach items="${serviceBookings}" var="serviceBooking" >
                                        <tr>
                                            <td>${serviceBooking.service.name}</td>
                                            <td>$ ${serviceBooking.service.price}</td>
                                            <td>
                                                <form method="get" action="<c:url value="/updateQuantity/${room.id}/${serviceBooking.service.id}" />">
                                                    <div class="col-xs-6 col-md-6 col-lg-6">
                                                        <input class= "form-control " type="number" id="quantityId" name="quantity" value="${serviceBooking.quantity}">
                                                    </div>
                                                    <input type="submit" value="Update" class="btn btn-success" id="submit-booking1sd1">
                                                </form>

                                            </td>
                                            <td>$ ${serviceBooking.price}</td>
                                            <td>
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-danger" 
                                                            onclick="location.href = '<c:url value="/remove-ServiceBooking?roomId=${room.id}&serviceId=${serviceBooking.service.id}" />'">Remove</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <button type="button" class="btn btn-success" 
                                        onclick="location.href = '<c:url value="/add-service-bookings?roomId=${room.id}" />'">Add to Booking detail</button>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
            <div class="container ">
                <c:if test = "${services != null && services.size() >0}">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <h4>Add new Service</h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <th>Name</th>
                                        <th>Price</th>
                                        <th>Open Time</th>
                                        <th>Action</th> 
                                    </tr>

                                    <c:forEach items="${services}" var="service" >
                                        <tr>
                                            <td>${service.name}</td>
                                            <td>$ ${service.price}</td> 
                                            <td>${service.openTime}</td>
                                            <td>
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-success" 
                                                            onclick="location.href = '<c:url value="/addService?roomId=${room.id}&serviceId=${service.id}" />'">Add Service</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div><!-- End container -->

        <jsp:include page="include/user/footer.jsp" />
        <div id="toTop"></div>
        <jsp:include page="include/user/js.jsp" /> 
    </body>
</html>