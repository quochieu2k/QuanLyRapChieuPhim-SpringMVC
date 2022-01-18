<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Sửa Thông Tin Phim</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="phim" enctype="multipart/form-data">
                <div class="form-group">
                    <form:input path="ten" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Tên Phim..." aria_describedby = "emailHelp" />
                	<form:errors path = "ten" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="ngaycongchieu" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Ngày Công Chiếu..." type = "text" onfocus = "(this.type='date')" aria_describedby = "emailHelp" />
                	<form:errors path = "ngaycongchieu" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <!--div class="upload-btn-wrapper"-->
                    <label>Chọn Ảnh Poster: </label>
                    <input type="file" name="PosterImage" aria-describedby="emailHelp" /><br />
                    <form:input path="poster" type="hidden" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Poster..." aria_describedby = "emailHelp" />
                    <form:errors path = "poster" cssClass = "text-danger" />
                    <!--/div-->
                </div>
                <div class="form-group">
                    <form:input path="trailer" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Trailer Phim..." aria_describedby = "emailHelp" />
                	<form:errors path = "trailer" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="thoiluong" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Thời Lượng Phim..." aria_describedby = "emailHelp" />
                	<form:errors path = "thoiluong" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="daodien" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Đạo Diễn..." aria_describedby = "emailHelp" />
                	<form:errors path = "daodien" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="dienvien" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Diễn Viên..." aria_describedby = "emailHelp" />
                	<form:errors path = "dienvien" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="theloai" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Thể Loại..." aria_describedby = "emailHelp" />
                	<form:errors path = "theloai" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:textarea path="noidungphim" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Nội Dung Phim..." aria_describedby = "emailHelp" />
                	<form:errors path = "noidungphim" cssClass = "text-danger" />
                </div>
                <input type="submit" class="btn btn-primary" value="Lưu">
            </form:form>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/phim/"/>">Quay lại</a>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->