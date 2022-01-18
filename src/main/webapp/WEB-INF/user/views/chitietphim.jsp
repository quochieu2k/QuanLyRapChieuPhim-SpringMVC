<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<section class="best-of-the-week">
    <div class="container">
        <div class="row">
            <div class="line">
                <div>TraiLer</div>
            </div>
            <div class="col-md-6 col-xs-6 col-sm-6">
                <iframe width="560" height="315" src="${fn:replace(phim.trailer,'watch?v=','embed/')}?autoplay=1" 
                frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
            <div class="col-md-6 col-xs-6 col-sm-6">
                <span class="tt"><b>${phim.ten}</b></span>
                <hr>
                <span class="tt"><b>Đạo diễn:</b>&nbsp;&nbsp;&nbsp;&nbsp;${phim.daodien}</span>
                <span class="tt"><b>Diễn viên:</b>&nbsp;&nbsp;&nbsp;&nbsp;${phim.dienvien}</span>
                <span class="tt"><b>Thể loại:</b>&nbsp;&nbsp;&nbsp;&nbsp;${phim.theloai}</span>
                <span class="tt"><b>Khởi chiếu:</b>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${phim.ngaycongchieu}" pattern="dd/MM/yyyy"/></span>
                <span class="tt"><b>Thời Lượng:</b>&nbsp;&nbsp;&nbsp;&nbsp;${phim.thoiluong}&nbsp;&nbsp;Phút</span>
                <footer>
                    <a href="#" class="love">
                        <i class="ion-android-favorite-outline ok"></i>
                        <div>10</div>
                    </a>
                    <a class="btn btn-primary more ok1" href="<c:url value="/phim/lichchieu?id=${phim.id }"/>">
                        <div>Mua vé</div>
                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                    </a>
                </footer>
            </div>
        </div>
        <div class="line">
        	<div>Nội Dung Phim</div>
        </div>
        <div class="col-md-12 col-xs-12 col-sm-12">
        	<span class="tt">${phim.noidungphim}</span>
        </div>
    </div>
</section>