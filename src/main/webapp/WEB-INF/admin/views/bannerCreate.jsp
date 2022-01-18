<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>


<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Quảng Cáo</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="banner" enctype="multipart/form-data">
                <div class="form-group">
                    <!--div class="upload-btn-wrapper"-->
                    <label>Chọn Ảnh Banner: </label>
                    <input type="file" name="BannerImage" aria-describedby="emailHelp" /><br />
                    <form:errors path="image" cssClass="text-danger" />
                    <!--/div-->
                </div>
                <div class="form-group">
                	<form:input path="link" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Liên Kết..." aria_describedby = "emailHelp" />
                	<form:errors path = "link" cssClass = "text-danger" />
                </div>
                <input type="submit" class="btn btn-primary" value="Lưu">
            </form:form>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/banner/"/>">Quay lại</a>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->

