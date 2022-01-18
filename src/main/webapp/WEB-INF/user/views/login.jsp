<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<section class="login first grey">
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>Đăng nhập</h4>
                    <p style="color:red"> ${message}</p> <br>
                    <form:form method="post" modelAttribute="loginform">
                        <form:errors path = "*" cssClass = "text-danger" />
                        <div class="form-group">
                            <label>Email</label>
                            <form:input path="email" type="email" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="fw">
                                Mật khẩu
                            </label>
                            <form:input path="pass" type="password" class="form-control" />
                        </div>
                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">Không có tài khoản ?</span> <a href="<c:url value="/register" />">Tạo mới</a>
                        </div>
                        <div class="title-line">
                            hoặc
                        </div>
                        <a href="#" class="btn btn-social btn-block facebook">
                            <i class="ion-social-facebook"></i> Đăng nhập với facebook
                        </a>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
