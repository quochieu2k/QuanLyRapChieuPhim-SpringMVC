<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Người Dùng</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="user">
                <div class="form-group">
                	<form:input path="email" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Email..." aria_describedby = "emailHelp" />
                	<form:errors path = "email" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="pass" type="password" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Mật Khẩu..." aria_describedby = "emailHelp" />
                	<form:errors path = "pass" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="name" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Họ Và Tên..." aria_describedby = "emailHelp" />
                	<form:errors path = "name" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2">Giới Tính: </label>
                    <form:radiobutton path="gender" value="Nam"/>   Nam
                    <form:radiobutton path="gender" value="Nữ"/>   Nữ
                    <br/><form:errors path = "gender" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="birthday" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Ngày Sinh..." type = "text" onfocus = "(this.type='date')" aria_describedby = "emailHelp" />
                	<form:errors path = "birthday" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="phone" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Số Điện Thoại...." aria_describedby = "emailHelp" />
                	<form:errors path = "phone" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<label class="control-label col-md-3">Quyền: </label>
                	<form:select path="permission" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Chọn Quyền..." aria_describedby = "emailHelp">  
        				<form:option value="user" label="Người Dùng"/>  
        				<form:option value="admin" label="Quản Trị Viên"/>
        			</form:select>  
                    <form:errors path = "permission" cssClass = "text-danger" />
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form:form>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/nguoidung/"/>">Quay lại</a>


</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
