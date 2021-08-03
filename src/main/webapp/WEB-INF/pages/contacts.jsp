<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />

        <jsp:include page="include/user/css.jsp" />

        <title>FC Recom - About Us</title>
    </head>
    <body>
        <jsp:include page="include/user/preloader.jsp" />

        <jsp:include page="include/user/header.jsp" />

        <!-- SubHeader =============================================== -->
        <section class="parallax-window" id="short" data-parallax="scroll" data-image-src="<c:url value="resources/img/sub_header_short_2.jpg" />" data-natural-width="1400" data-natural-height="350">
            <div id="subheader">
                <h1>Contact Us</h1>
            </div><!-- End subheader -->
        </section><!-- End section -->
        <!-- End SubHeader ============================================ -->


        <div class="container margin_60_35">
            <h2 class="main_title"><em></em>Welcome to Recom <span>Hotel and Bed&amp;Breakfast</span></h2>
            <div class="row add_top_20">

                <div class="col-md-4">
                    <div class="box_style_1">
                        <div class="box_contact">
                            <i class="icon_set_1_icon-41"></i>
                            <h4>Address</h4>
                            <p>Route de Sablet 1023, Marseille<br>France 01923<br><a href="tel://004542344599">+45 423 445 99</a></p>
                        </div>
                        <div class="box_contact">
                            <i class="icon_set_1_icon-37"></i>
                            <h4>Get directions</h4>
                            <form action="http://maps.google.com/maps" method="get" target="_blank">
                                <div class="form-group">
                                    <input type="text" name="saddr" placeholder="Enter your starting point" class="form-control" />
                                    <input type="hidden" name="daddr" value="New York, NY 11430"/><!-- Write here your end point -->
                                </div>
                                <div class="form-group">
                                    <button class="btn_1" type="submit" value="Get directions">Get directions</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>   

                <div class="col-md-7 col-md-offset-1">

                    <div id="message-contact"></div>
                    <form method="post" action="assets/contact.php" id="contactform">
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input type="text" class="form-control" id="name_contact" name="name_contact" placeholder="Enter Name">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input type="text" class="form-control" id="lastname_contact" name="lastname_contact" placeholder="Enter Last Name">
                                </div>
                            </div>
                        </div>
                        <!-- End row -->
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" id="email_contact" name="email_contact" class="form-control" placeholder="Enter Email">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <input type="text" id="phone_contact" name="phone_contact" class="form-control" placeholder="Enter Phone number">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Message</label>
                                    <textarea id="message_contact" name="message_contact" class="form-control" placeholder="Write your message" style="height:150px;"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row add_bottom_30">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Human verification</label>
                                    <input type="text" id="verify_contact" class="form-control add_bottom_30" placeholder="Are you human? 3 + 1 =">
                                </div>
                                <input type="submit" value="Submit" class="btn_1" id="submit-contact">
                            </div>
                        </div>
                    </form>               
                </div><!-- End col-md-8 -->    
            </div><!-- End row -->
        </div><!-- End Container -->
        
        <jsp:include page="include/user/footer.jsp" />

        <jsp:include page="include/user/js.jsp" /> 
    </body>
</html>