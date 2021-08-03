<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />
        <jsp:include page="include/user/css.jsp" />
        <title>FC Recom - Hotel and Bed&amp;Breakfast</title>
    </head>

    <body>
        <%--<jsp:include page="include/user/preloader.jsp" />--%>
        <jsp:include page="include/user/header.jsp" />
        <!-- Set up your HTML -->
        <div class="carousel_in">
            <div><img src="<c:url value="/resources/img/room_detail_1.jpg" />" alt=""><div class="caption"><h3>Fantastic bed room</h3></div></div>
            <div><img src="<c:url value="/resources/img/room_detail_2.jpg" />" alt=""><div class="caption"><h3>Equiped bathroom</h3></div></div>
            <div><img src="<c:url value="/resources/img/room_detail_3.jpg" />" alt=""><div class="caption"><h3>Equiped bathroom</h3></div></div>
            <div><img src="<c:url value="/resources/img/room_detail_4.jpg" />" alt=""><div class="caption"><h3>Nice outdoor</h3></div></div>
            <div><img src="<c:url value="/resources/img/room_detail_5.jpg" />" alt=""><div class="caption"><h3>Swimming pool</h3></div></div>
        </div>

        <h1 class="main_title_in">${room.roomType.name} ${room.roomNumber}</h1>
        <div class="container add_bottom_60">

            <div class="row">
                <div class="col-md-8" id="room_detail_desc">
                    <div id="single_room_feat">
                        <ul>
                            <c:forEach items="${room.roomType.getConvenients()}" var="convenient">
                                <li><i class="${convenient.description}"></i>${convenient.content}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Description</h3>
                        </div>
                        <div class="col-md-9">
                            <p>${room.roomType.description}</p>
                            <h4>Room facilities</h4>
                            <p>
                                Lorem ipsum dolor sit amet, at omnes deseruisse pri. Quo aeterno legimus insolens ad. Sit cu detraxit constituam, an mel iudico constituto efficiendi.
                            </p>
                            <div class="row">
                                <div class="col-md-4 col-sm-4">
                                    <ul class="list_ok">
                                        <li>Coffee machine</li>
                                        <li>Wifi</li>
                                        <li>Microwave</li>
                                        <li>Oven</li>
                                    </ul>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <ul class="list_ok">
                                        <li>Fridge</li>
                                        <li>Hairdryer</li>
                                        <li>Towels</li>
                                        <li>Toiletries</li>
                                    </ul>
                                </div>
                                <div class="col-md-4 col-sm-4">
                                    <ul class="list_ok">
                                        <li>DVD player</li>
                                        <li>Air-conditioning</li>
                                        <li>Tv</li>
                                        <li>Freezer</li>
                                    </ul>
                                </div>
                            </div><!-- End row  -->
                            <h4>Room Prices</h4>
                            <!-- start pricing table -->
                            <table class="table table-striped">
                                <tbody>
                                    <tr>
                                        <td>Low (from 23/03 to 31/05)</td>
                                        <td>140$</td>
                                    </tr>
                                    <tr>
                                        <td>Middle (from 23/03 to 31/05)</td>
                                        <td>180$</td>
                                    </tr>
                                    <tr>
                                        <td>High (from 23/03 to 31/05)</td>
                                        <td>200$</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- End col-md-9  -->
                    </div><!-- End row  -->

                    <hr>

                    <div class="row">
                        <div class="col-md-3">
                            <h3>Reviews</h3>
                            <a href="#" class="btn_1 add_bottom_15" data-toggle="modal" data-target="#myReview">Leave a review</a>
                        </div>
                        <div class="col-md-9">
                            <div id="score_detail"><span>7.5</span>Good <small>(Based on 34 reviews)</small></div><!-- End general_rating -->
                            <div class="row" id="rating_summary">
                                <div class="col-md-6">
                                    <ul>
                                        <li>Position
                                            <div class="rating">
                                                <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i><i class="icon-star-empty"></i>
                                            </div>
                                        </li>
                                        <li>Comfort
                                            <div class="rating">
                                                <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul>
                                        <li>Price
                                            <div class="rating">
                                                <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i><i class="icon-star-empty"></i>
                                            </div>
                                        </li>
                                        <li>Quality
                                            <div class="rating">
                                                <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div><!-- End row -->

                            <hr>
                            <div class="review_strip_single">
                                <img src="<c:url value="/resources/img/avatar1.jpg" />" alt="" class="img-circle">
                                <small> - 10 March 2015 -</small>
                                <h4>Jhon Doe</h4>
                                <p>
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus."
                                </p>
                                <div class="rating">
                                    <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i><i class="icon-star-empty"></i>
                                </div>
                            </div><!-- End review strip -->

                            <div class="review_strip_single">
                                <img src="<c:url value="/resources/img/avatar2.jpg" />" alt="" class="img-circle">
                                <small> - 10 March 2015 -</small>
                                <h4>Jhon Doe</h4>
                                <p>
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus."
                                </p>
                                <div class="rating">
                                    <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i><i class="icon-star-empty"></i>
                                </div>
                            </div><!-- End review strip -->

                            <div class="review_strip_single last">
                                <img src="<c:url value="/resources/img/avatar3.jpg" />" alt="" class="img-circle">
                                <small> - 10 March 2015 -</small>
                                <h4>Jhon Doe</h4>
                                <p>
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed a lorem quis neque interdum consequat ut sed sem. Duis quis tempor nunc. Interdum et malesuada fames ac ante ipsum primis in faucibus."
                                </p>
                                <div class="rating">
                                    <i class="icon-star"></i><i class="icon-star"></i><i class="icon-star"></i><i class="icon-star-empty"></i><i class="icon-star-empty"></i>
                                </div>
                            </div><!-- End review strip -->

                        </div>
                    </div>  
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <h3>Policies</h3>
                        </div>
                        <div class="col-md-9">
                            <ul id="policies">
                                <li><i class="icon_set_1_icon-83"></i><h5>Check-in and check-out.</h5>
                                    <p>Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.</p>
                                </li>
                                <li><i class="icon_set_1_icon-54"></i><h5>Cancellation</h5>
                                    <p>Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.</p>
                                </li>
                                <li><i class="icon_set_1_icon-47"></i><h5>Smoking</h5>
                                    <p>Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.</p>
                                </li>
                                <li><i class="icon_set_1_icon-35"></i><h5>Payments</h5>
                                    <p>Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.</p>
                                </li>
                                <li><i class="icon_set_1_icon-13"></i><h5>Disable</h5>
                                    <p>Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.</p>
                                </li>                    
                            </ul>
                        </div>
                    </div>
                </div><!-- End col -->

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
        <script>
            $('.carousel_in').owlCarousel({
                center: true,
                items: 1,
                loop: true,
                autoplay: true,
                navText: ['', ''],
                addClassActive: true,
                margin: 5,
                responsive: {
                    600: {
                        items: 1
                    },
                    1000: {
                        items: 2,
                        nav: true,
                    }
                }
            });
        </script>
        <script src="<c:url value="/resources/js/theia-sticky-sidebar.js" />"></script>
        <script>
            jQuery('#sidebar').theiaStickySidebar({
                additionalMarginTop: 80
            });
        </script>
    </body>
</html>