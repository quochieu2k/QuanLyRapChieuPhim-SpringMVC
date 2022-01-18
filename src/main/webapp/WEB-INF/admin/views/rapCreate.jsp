<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Rạp</h1>
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="rap">
                <div class="form-group">
                	<form:input path="tenrap" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Tên Rạp..." aria_describedby = "emailHelp" />
                	<form:errors path = "tenrap" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="loairap" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Loại Rạp..." aria_describedby = "emailHelp" />
                	<form:errors path = "loairap" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="ktngang" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Kích thước ngang..." aria_describedby = "emailHelp" onfocus = "(this.value='')"/>
                	<form:errors path = "ktngang" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <form:input path="ktdoc" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Kích thước dọc..." aria_describedby = "emailHelp"  onfocus = "(this.value='')"/>
                	<form:errors path = "ktdoc" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Chọn Cụm Rạp</label>
                    <form:select path="cumrap.id" class = "form-control form-control-user" id = "exampleInputEmail" placeholder = "Chọn Cụm Rạp..." aria_describedby = "emailHelp">
					    <form:options items="${cumrapList}" itemLabel="tencum" itemValue="id" ></form:options>
					</form:select>
					<form:errors path = "cumrap.id" cssClass = "text-danger" />
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form:form>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/rap/"/>">Quay lại</a>


</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
