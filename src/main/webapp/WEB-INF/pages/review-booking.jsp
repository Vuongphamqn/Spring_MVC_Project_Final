<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC - Booking</title>
    </head>
    <body>
        <jsp:include page="include/user/header.jsp" />
        <br><br><br><br>
        <div class="container">
            <div class="container ">
                <div class="row">

                    <form method="get" action="<c:url value="/research-roomType" />">
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
                                <label for="exampleFormControlSelect1">Room Type</label>
                                <select class="form-control" id="exampleFormControlSelect1" name="roomTypeId">
                                    <c:forEach items="${roomTypes}" var="roomType">
                                        <option value="${roomType.id}">${roomType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </form>
                </div><!-- End row -->

                <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <button type="button" class="btn btn-danger" 
                                    onclick="location.href = '<c:url value="/cancelBooking?bookingId=${booking.id}" />'">Cancel Booking</button>
                        </div>
                    </div>
                </div>

            </div><!-- End row --> 
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-12 col-lg-12">
                        <br><h4><b>Your Booking:</b></h4>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12 col-md-12 col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-hover">
                                <tr>
                                    <th>Room's Name</th>
                                    <th>Price/night</th>
                                    <th>Nights</th>
                                    <th>Discount</th>
                                    <th>Service</th>
                                    <th>Unit Price</th>
                                    <!--<th>Action</th>--> 
                                </tr>
                                <c:forEach items="${booking.bookingDetails}" var="bookingDetail" >
                                    <tr>
                                        <td>${bookingDetail.room.roomType.name} ${bookingDetail.room.roomNumber}</td>
                                        <td>$ ${bookingDetail.room.price}</td>
                                        <td>${nights}</td>
                                        <td>${bookingDetail.discount} %</td>
                                        <td>
                                            <c:forEach items="${bookingDetail.serviceBookings}" var="serviceBooking" >
                                                <div>${serviceBooking.service.name}:  $ ${serviceBooking.price}</div>
                                            </c:forEach>
                                        </td>
                                        <td>$ ${bookingDetail.unitPrice}</td>
<!--                                        <td>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-danger" 
                                                        onclick="location.href = '<c:url value="/remove-BookingDetail?roomId=${bookingDetail.room.id}" />'">Remove</button>
                                            </div>
                                            <div class="form-group">
                                                <button type="button" class="btn btn-success" 
                                                        onclick="location.href = '<c:url value="/view-ServiceBookings?roomId=${bookingDetail.room.id}" />'">Add Service</button>
                                            </div>

                                        </td>-->
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-12 col-md-12 col-lg-12">
                        <h4>Total Price: $ ${booking.totalPrice}</h4>
                    </div>
                </div>
<!--                <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div class="form-group">
                            <button type="button" class="btn btn-success" onclick="location.href = '<c:url value="/confirm" />'">Confirm Booking</button>
                        </div>
                    </div>

                </div>-->
            </div>
        </div><!-- End container -->

        <jsp:include page="include/user/footer.jsp" />
        <div id="toTop"></div>
        <jsp:include page="include/user/js.jsp" /> 
    </body>
</html>