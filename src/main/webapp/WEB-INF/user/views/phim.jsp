<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<section class="best-of-the-week">
    <div class="container">
        <div class="row">
            <c:forEach items="${listPhim}" var="phim">
            <div class="col-md-3 col-xs-3 col-sm-3">
                <article class="article">
                    <div class="inner">
                        <figure id="imgpost">
                            <a href="<c:url value="/phim/chitiet?id=${phim.id}" />">
                                <img src="<c:url value="/Assets/upload/poster/${phim.poster}" />" alt="Sample Article">
                            </a>
                        </figure>
                        <div class="padding">
                            <div class="padding">
                                <div class="tenphim">
                                    <h2><span id="spantenphim">${phim.ten}</span></h2>
                                </div>
                                <ul id="ulthongtin">
                                    <li><span class="saptt">Thể loại:</span>&nbsp;&nbsp;${phim.theloai}</li>
                                    <li>
                                        <span class="saptt">Thời lượng</span>&nbsp;&nbsp;${phim.thoiluong}&nbsp;&nbsp;Phút
                                    </li>
                                    <li><span class="saptt">Khởi chiếu:</span>&nbsp;&nbsp;<fmt:formatDate value="${phim.ngaycongchieu}" pattern="dd/MM/yyyy"/></li>
                                </ul>
                                <footer>
                                    <a href="#" class="love">
                                        <i class="ion-android-favorite-outline"></i>
                                        <div>10</div>
                                    </a>
                                    <a class="btn btn-primary more" href="<c:url value="/phim/lichchieu?id=${phim.id}" />">
                                        <div>Mua vé</div>
                                        <div><i class="ion-ios-arrow-thin-right"></i></div>
                                    </a>
                                </footer>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
                
            </c:forEach>
        </div>
    </div>
</section>