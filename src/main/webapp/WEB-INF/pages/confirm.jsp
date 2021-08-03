<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC  - Confirm</title>
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
                <div class="row">
                    <div class="col-xs-12 col-md-12 col-lg-12">
                        <h4><b>Your Booking:</b></h4>
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
                                </tr>
                                <c:forEach items="${booking.bookingDetails}" var="bookingDetail" >
                                    <tr>
                                        <td>${bookingDetail.room.roomType.name} ${bookingDetail.room.roomNumber}</td>
                                        <td>$ ${bookingDetail.room.price}</td>
                                        <td>${nights}</td>
                                        <td>${bookingDetail.discount} %</td>
                                        <td>
                                            <c:forEach items="${bookingDetail.serviceBookings}" var="serviceBooking" >
                                                <div>${serviceBooking.service.name}: $ ${serviceBooking.service.price}</div>
                                            </c:forEach>
                                        </td>
                                        <td>$ ${bookingDetail.unitPrice}</td>
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
            </div>
                    
            <div class="container">
                <mvc:form action="${pageContext.request.contextPath}/result"    
                          method="POST" modelAttribute="guest"> 
                    <div class="row">
                        <div class="col-md-7 col-sm-7">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <h4><b>Customer's Information:</b></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Full Name <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="fullName" id="full_name" placeholder="Name and Last name"
                                               value="${guest.fullName}"/>
                                        <span style="color: red"><mvc:errors path="fullName" /></span>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Email <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="email" id="email_booking" placeholder="Email"
                                               value="${guest.email}"/>
                                        <span style="color: red"><mvc:errors path="email" /></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Phone Number <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="phoneNumber" id="phone_number" placeholder="Phone number"
                                               value="${guest.phoneNumber}"/>
                                        <span style="color: red"><mvc:errors path="phoneNumber" /></span>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Address <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="address" id="address" placeholder="Address"
                                               value="${guest.address}"/>
                                        <span style="color: red"><mvc:errors path="address" /></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <select name="gender" id="gender" class= "form-control ">
                                            <option value="MALE">Male</option>
                                            <option value="FEMALE">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>BirthDate <span style="color: red">(*)</span></label>
                                        <input type="date" id="birthDateId"
                                               class="form-control" name="birthDate"
                                               value="${guest.birthDate}"/>
                                        <span style="color: red"><mvc:errors path="birthDate" /></span>
                                    </div>
                                </div>
<!--                                
                                
                                
                                
                                
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>ID/ Passport Number</label>
                                        <input type="text" class="form-control" name="id_passport" id="id_passport" placeholder="ID/ Passport Number"/>
                                    </div>
                                </div>-->
                            </div>
<!--                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Additional request (optional)</label>
                                        <textarea type="text" class="form-control" name="additional_request" id="additional_request" placeholder="Additional request"></textarea>
                                    </div>
                                </div>
                            </div>-->
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <button type="submit" 
                                        class="btn btn-success">Submit</button>
                            </div>
                        </div>
                    </div>
                </mvc:form>
            </div>
        </div><!-- End container -->

        <jsp:include page="include/user/footer.jsp" />
        <div id="toTop"></div>
        <jsp:include page="include/user/js.jsp" /> 
    </body>
</html>