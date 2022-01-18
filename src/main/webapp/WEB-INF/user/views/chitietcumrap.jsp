<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<section class="best-of-the-week">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <div class="block">
                    <div class="line top">
                        <div>THEATER</div>
                    </div>
                    <div class="page-title theater-title">
                        <h3>${cumrap.tencum}</h3>
                    </div>
                    <div class="page-title theater-title">
                        <h3>Địa chỉ: ${cumrap.diachi}</h3>
                    </div>
                    <div>
                    	<img style="width:100%;margin-left:auto;margin-right:auto" src="<c:url value="/Assets/images/theater.jpg" />" />
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

<section class="maps">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <iframe src="${cumrap.maps}"
                        width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</section>

