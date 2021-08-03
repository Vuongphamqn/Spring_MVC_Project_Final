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
                    <div class="col-md-2 col-sm-2">
                        <div class="form-group">
                            <button type="button" class="btn btn-success" 
                                    onclick="location.href = '<c:url value="/confirm" />'">Back</button>
                        </div>
                    </div>
                </div>
            </div><!-- End row --> 
            <div class="container">
                <mvc:form action="${pageContext.request.contextPath}/payment"    
                          method="POST" modelAttribute="creditCard"> 
                    <div class="row">
                        <div class="col-md-7 col-sm-7">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <h4><b>Customer's Credit Card:</b></h4>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>User Name <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="name" id="name" placeholder="Name"
                                               value="${creditCard.name}">
                                        <span style="color: red"><mvc:errors path="name" /></span>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Card Number <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="cardNumber" id="cardNumber" placeholder="Card Number"
                                               value="${creditCard.cardNumber}">
                                        <span style="color: red"><mvc:errors path="cardNumber" /></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6">

                                    <div class="form-group">
                                        <label>Date of Expire <span style="color: red">(*)</span></label>
                                        <input type="date" id="expDateId"
                                               class="form-control" name="expDate"
                                               value="${creditCard.expDate}"/>
                                        <span style="color: red"><mvc:errors path="expDate" /></span>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="form-group">
                                        <label>Cvc Code <span style="color: red">(*)</span></label>
                                        <input type="text" class="form-control" name="cvcCode" id="cvcCode" placeholder="Cvc Code"
                                               value="${creditCard.cvcCode}">
                                        <span style="color: red"><mvc:errors path="cvcCode" /></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="form-group">
                                <button type="submit" 
                                        class="btn btn-success">Payment</button>
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