<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Cụm Rạp</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="cumrap">
                <div class="form-group">
                	<form:input path="tencum" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Tên Cụm Rạp..." aria_describedby = "emailHelp" />
                	<form:errors path = "tencum" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="diachi" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Địa Chỉ..." aria_describedby = "emailHelp" />
                	<form:errors path = "diachi" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="maps" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Maps (Bản đồ)..." aria_describedby = "emailHelp" />
                	<form:errors path = "maps" cssClass = "text-danger" />
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form:form>
            </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/cumrap/"/>">Quay lại</a>

</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
