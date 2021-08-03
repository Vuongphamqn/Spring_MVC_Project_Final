<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="include/user/meta.jsp" />

        <jsp:include page="include/user/css.jsp" />

        <title>FC Recom - Hotel</title>
    </head>
    <body>
        <jsp:include page="include/user/header.jsp" />

        <!-- SubHeader =============================================== -->
        <section class="parallax-window" id="short" data-parallax="scroll" data-image-src="<c:url value="resources/img/sub_header_short_2.jpg" />" data-natural-width="1400" data-natural-height="350">
            <div id="subheader">
                <h1>Our Wonderfull Rooms</h1>
            </div><!-- End subheader -->
        </section><!-- End section -->
        <!-- End SubHeader ============================================ -->

        <div class="container margin_60">
            <h2 class="main_title"><em></em>Welcome to Recom <span>Hotel and Bed&amp;Breakfast</span></h2>
            <p class="lead styled">
                Usu habeo equidem sanctus no. Suas summo id sed, erat erant oporteat cu pri. In eum omnes molestie. Sed ad debet scaevola, ne mel lorem legendos. Unum etiam cum te, an elit assueverit vix, falli aliquam complectitur ex ius.
            </p>

            <div class="row about">
                <div class="col-md-5 col-sm-6 col-md-offset-1">
                    <h3>A beatiful contest</h3>
                    <p>
                        Esse dicit accusam duo an. Modus simul ei nec. Sea et explicari pertinacia, <strong>cu vitae bonorum</strong> vocibus nec, corpora signiferumque no vim. Ad principes scriptorem duo, te omnium gubergren eam, et eam ancillae appareat dissentiet. Quando tantas animal vis ut, mandamus voluptatum duo ne, ne odio vidit commodo has.
                    </p>
                </div>
                <div class="col-md-4 col-sm-6 col-md-offset-1">
                    <img src="<c:url value="resources/img/about_1.jpg" />" alt="" class="img-responsive styled"> 
                </div>
            </div><!-- End row -->
            <div class="divider hidden-xs"></div>
            <div class="row about" >
                <div class="col-md-5 col-sm-6 col-md-offset-1 col-md-push-5">
                    <h3>Charming rooms</h3>
                    <p>
                        Esse dicit accusam duo an. Modus simul ei nec. Sea et explicari pertinacia, <strong>cu vitae bonorum</strong> vocibus nec, corpora signiferumque no vim. Ad principes scriptorem duo, te omnium gubergren eam, et eam ancillae appareat dissentiet. Quando tantas animal vis ut, mandamus voluptatum duo ne, ne odio vidit commodo has.
                    </p>
                </div>
                <div class="col-md-4 col-sm-6 col-md-offset-1 col-md-pull-6">
                    <img src="<c:url value="resources/img/about_2.jpg" />" alt="" class="img-responsive styled"> 
                </div>
            </div><!-- End row -->
            <div class="divider hidden-xs"></div>
            <div class="row about">
                <div class="col-md-5 col-sm-6 col-md-offset-1">
                    <h3>Enjoy and relax</h3>
                    <p>
                        Esse dicit accusam duo an. Modus simul ei nec. Sea et explicari pertinacia, <strong>cu vitae bonorum</strong> vocibus nec.
                    </p>
                    <ul class="list_ok">
                        <li>Spa and Sauna</li>
                        <li>Body treatments</li>
                        <li>Swimming pool</li>
                    </ul>
                </div>
                <div class="col-md-4 col-sm-6 col-md-offset-1">
                    <img src="<c:url value="resources/img/about_3.jpg" />" alt="" class="img-responsive styled"> 
                </div>
            </div><!-- End row -->
        </div><!-- End container -->

        <div class="container_styled_1">
            <div class="container margin_60">
                <h3 class="main_title">General facilities<span>Ad principes scriptorem duo, te omnium gubergren eam.</span></h3>
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_1_icon-8"></i>
                            <h4>Patio garden</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_1_icon-27"></i>
                            <h4>Parking</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_1_icon-14"></i>
                            <h4>Room service</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                </div><!-- End row -->
                <div class="row">
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_1_icon-22"></i>
                            <h4>Pet allowed</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_2_icon-103"></i>
                            <h4>Loundry service</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4">
                        <div class="box_feat">
                            <i class="icon_set_1_icon-13"></i>
                            <h4>Disable</h4>
                            <p>Ut postea legendos vim, usu an reque novum inimicus, cum aperiri molestiae splendide ea. Ad nam modus iudico rationibus.</p>
                        </div>
                    </div>
                </div><!-- End row -->
            </div><!-- End container -->
        </div><!-- End container_styled_1 -->

        <div class="grid">
            <ul class="magnific-gallery" style="margin-bottom:-5px;">
                <li>
                    <figure>
                        <img src="<c:url value="resources/img/gallery/pic_1.jpg" />" alt="">
                        <figcaption>
                            <div class="caption-content">
                                <a href="img/gallery/large/pic_1.jpg" title="Photo title">
                                    <i class="icon_set_1_icon-32"></i>
                                    <p>Your caption</p>
                                </a>
                            </div>
                        </figcaption>
                    </figure>
                </li>
                <li>
                    <figure>
                        <img src="<c:url value="resources/img/gallery/pic_2.jpg" />" alt="">
                        <figcaption>
                            <div class="caption-content">
                                <a href="img/gallery/large/pic_2.jpg" title="Photo title">
                                    <i class="icon_set_1_icon-32"></i>
                                    <p>Your caption</p>
                                </a>
                            </div>
                        </figcaption>
                    </figure>
                </li>
                <li>
                    <figure>
                        <img src="<c:url value="resources/img/gallery/pic_3.jpg" />" alt="">
                        <figcaption>
                            <div class="caption-content">
                                <a href="img/gallery/large/pic_3.jpg" title="Photo title">
                                    <i class="icon_set_1_icon-32"></i>
                                    <p>Your caption</p>
                                </a>
                            </div>
                        </figcaption>
                    </figure>
                </li>
                <li>
                    <figure>
                        <img src="<c:url value="resources/img/gallery/pic_4.jpg" />" alt="">
                        <figcaption>
                            <div class="caption-content">
                                <a href="<c:url value="resources/img/gallery/large/pic_4.jpg" />" title="Photo title">
                                    <i class="icon_set_1_icon-32"></i>
                                    <p>Your caption</p>
                                </a>
                            </div>
                        </figcaption>
                    </figure>
                </li>
            </ul>
        </div>


        <jsp:include page="include/user/footer.jsp" />

        <jsp:include page="include/user/js.jsp" />

    </body>
</html>