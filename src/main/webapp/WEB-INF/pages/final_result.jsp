<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC  - Confirm</title>
    </head>
    <body>
        <jsp:include page="include/user/header.jsp" />
        <br><br><br><br>

        <div class="container">
            <div class="container ">
                <c:if test="${statuscredit == 'fail'}">
                    <div class="row">
                        <div class="col-md-2 col-sm-2">
                            <div class="form-group">
                                <button type="button" class="btn btn-success" onclick="location.href = '<c:url value="/creditCard" />'">Back</button>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="row">
                    <div class="col-md-6 col-sm-6">
                        <div class="form-group">
                            <h4 style="color: forestgreen">${messages}</h4><br><br><br><br><br>
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