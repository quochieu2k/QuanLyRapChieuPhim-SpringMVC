<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<section class="best-of-the-week">
        <div class="container">
            <div class="line top">
                <div>Danh sách cụm rạp</div>
            </div>
            <div id="menu-list">
                <div class="row">
                    <ul class="nav-list">
                        <c:forEach items="${cumrap}" var="item">
                                <div class="col-md-4">
                                    <div class="maps ">
                                        <h4><a href="<c:url value="/cumrap/chitiet?id=${item.id}" />" class="id_Detail" id="id_Detail" style="cursor: pointer;">${item.tencum}</a></h4>
                                    </div>
                                </div>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
</section>