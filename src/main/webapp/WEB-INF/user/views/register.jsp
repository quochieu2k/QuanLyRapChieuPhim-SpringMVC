<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<section class="login first grey">
    <div class="container">
        <div class="box-wrapper">
            <div class="box box-border">
                <div class="box-body">
                    <h4>Đăng ký thành viên</h4>
                    <form:form method="post" modelAttribute="user">
                    	<form:errors path = "*" cssClass = "text-danger" />
                    <div class="form-group">

                        <p style="color:red">${message}</p> <br>

                        <label>Tên</label>
                        <form:input path="name" class="form-control" />
                        <form:errors path = "name" cssClass = "text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <form:input path="email" type="email" class="form-control" />
                        <form:errors path = "email" cssClass = "text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Số điện thoại</label>
                        <form:input path="phone" class="form-control" />
                        <form:errors path = "phone" cssClass = "text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Ngày sinh</label>
                        <form:input path="birthday" type="date" class="form-control" />
                        <form:errors path = "birthday" cssClass = "text-danger" />
                    </div>
                    <div class="form-group">
                        <label>Giới Tính: </label>
                        <form:radiobutton path="gender" value="Nam"/> Nam
                    	<form:radiobutton path="gender" value="Nữ"/> Nữ
                        <form:errors path = "gender" cssClass = "text-danger" />
                    </div>
                    <div class="form-group">
                        <label class="fw">Mật khẩu</label>                        
                        <input type="password" name="pass" class="form-control">
                        <form:errors path = "pass" cssClass = "text-danger" />
                    </div>
                        <div class="form-group">
                            <label class="fw">Xác nhận mật khẩu</label>
                            <input type="password" name="passConfirm" class="form-control">
                        </div>
                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-primary btn-block">Đăng ký</button>
                        </div>
                        <div class="form-group text-center">
                            <span class="text-muted">Đã có tài khoản ?</span> <a href="<c:url value="/login"/>">Đăng nhập</a>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>
