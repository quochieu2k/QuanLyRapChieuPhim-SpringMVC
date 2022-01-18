<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Đồ Ăn</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="food" enctype="multipart/form-data">
                <div class="form-group">
                	<form:input path="tenmon" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Tên Món..." aria_describedby = "emailHelp" />
                	<form:errors path = "tenmon" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:textarea path="mota" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Mô Tả..." aria_describedby = "emailHelp" />
                	<form:errors path = "mota" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="gia" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Giá Tiền (VNĐ)..." onfocus = "(this.value='')" aria_describedby = "emailHelp" />
                	<form:errors path = "gia" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <!--div class="upload-btn-wrapper"-->
                    <label>Chọn Ảnh Món Ăn: </label>
                    <input type="file" name="FoodImage" aria-describedby="emailHelp" /><br />
                    <form:errors path="image" cssClass="text-danger" />
                    <!--/div-->
                </div>
                <input type="submit" class="btn btn-primary" value="Lưu">
            </form:form>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/food/"/>">Quay lại</a>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
