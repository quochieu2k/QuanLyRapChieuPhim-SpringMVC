<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ page import="xemphim.model.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%!
public String convertDayVN(String dayEnglish){
	switch(dayEnglish.toLowerCase()){
		case "monday":
			return "THỨ HAI";
		case "tuesday":
			return "THỨ BA";
		case "wednesday":
			return "THỨ TƯ";
		case "thursday":
			return "THỨ NĂM";
		case "friday":
			return "THỨ SÁU";
		case "saturday":
			return "THỨ BẢY";
		case "sunday":
			return "CHỦ NHẬT";
		default:
			return dayEnglish.toLowerCase();
	}
}
%>
<section class="best-of-the-week">
    <nav class="menu">
        <div class="container">
            <div class="line top">
                <div>${phim.ten}</div>
            </div>
            <div class="col-md-3 col-xs-3 col-sm-3">
                <img align="right" height="270" width="180" src="${pageContext.request.contextPath}/Assets/upload/poster/${phim.poster}"/>
            </div>
            <div class="col-md-9 col-xs-9 col-sm-9">
                <span class="tt">${phim.ten}</span>
                <hr>
                <span class="tt">${phim.noidungphim}</span>
                <footer>
                    <a href="#" class="love">
                        <i class="ion-android-favorite-outline ok"></i>
                        <div>10</div>
                    </a>
                    <a class="btn btn-primary more ok1" href="<c:url value="/phim/chitiet?id=${phim.id}" />">
                        <div>Xem Trailer</div>
                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                    </a>
                </footer>
            </div>

            <div class="line top">
                <div>LỊCH CHIẾU</div>
            </div>
            <div id="menu-list">
                <ul class="nav-list">
                    <% 
                        int i = 1;
                        for (LocalDate date = LocalDate.now(); i < 10; date = date.plusDays(1))
                        {
                    %>
                            <li class="dropdown magz-dropdown magz-dropdown-megamenu" onclick="getShowTime('<%= date %>',${phim.id})" >
                                <a href="#">
                                    <%= convertDayVN(date.getDayOfWeek().toString()) %><br /><%= date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy")) %><i class="ion-ios-arrow-right"></i>
                                </a>
                            </li>
                    <%
                            i++;
                        }
                    %>
                </ul>
                <p id="showtime"></p>
            </div>
</nav>
</section>
<script>
    function getShowTime(date, id) {
        $.ajax({
            url: "<c:url value="/phim/api/showtime" />",
            method: "GET",
            data: { date: date, idPhim: id },
            success: function (data) {
                $("#showtime").html(data);
            }
        })
    }
</script>