<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="parallax-window" id="booking" data-parallax="scroll" data-image-src="<c:url value="resources/img/sub_header_home.jpg" />" data-natural-width="1400" data-natural-height="550">
    <div id="subheader_home">
        <div id="sub_content">
            <div id="book_container">
                <form method="get" action="<c:url value="/search" />">
                    <div id="group_1">
                        <div id="container_1">
                            <label>Arrival date</label>
                            <input class="startDate1 form-control datepick" type="text" data-field="date" data-startend="start" data-startendelem=".endDate1" readonly placeholder="Arrival" id="check_in" name="checkIn">
                            <span class="input-icon"><i class="icon-calendar-7"></i></span>
                        </div>
                        <div id="container_2">
                            <label>Departure date</label>
                            <input class="endDate1 form-control datepick" type="text" data-field="date" data-startend="end" data-startendelem=".startDate1" readonly placeholder="Departure" id="check_out" name="checkOut" >
                            <span class="input-icon"><i class="icon-calendar-7"></i></span>
                        </div>
                    </div>
                    <div id="group_3">
                        <div id="container_5">
                            <label for="exampleFormControlSelect1">Room Type</label>
                            <select class="form-control" id="exampleFormControlSelect1" name="roomTypeId">
                                <c:forEach items="${roomTypeHeaders}" var="roomType">
                                    <option value="${roomType.id}">${roomType.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div id="container_7">
                        <input type="submit" value="Check availability" class="btn_1" id="submit-booking11">
                    </div>
                </form>
                <div id="message-booking"></div>
            </div>
        </div>
    </div>
</div>
