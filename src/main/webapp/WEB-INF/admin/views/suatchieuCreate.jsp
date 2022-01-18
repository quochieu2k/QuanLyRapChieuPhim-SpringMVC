<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Thêm Suất Chiếu</h1>
    <div class="row justify-content-center">
        <div class="col-xl-8 col-lg-12 col-md-9">
            <form:form method="post" modelAttribute="suatchieu">
                <div class="form-group">
                	<form:input path="ngay" class="form-control form-control-user" id="exampleInputEmail" placeholder="Ngày Chiếu..." type ="text" onfocus="(this.type='date')" aria_describedby="emailHelp"/>
                	<form:errors path="ngay" cssClass="text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="thoidiembatdau" class="form-control form-control-user" id="exampleInputEmail" placeholder="Thời Điểm Bắt Đầu (HH:mm)..." type="time"  aria_describedby="emailHelp"/>
                	<form:errors path="thoidiembatdau" cssClass="text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="thoidiemketthuc" class="form-control form-control-user" id="exampleInputEmail" placeholder="Thời Điểm Kết Thúc (HH:mm)..." type="time"  aria_describedby="emailHelp"/>
                	<form:errors path="thoidiemketthuc" cssClass="text-danger" />
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Chọn Phim</label>
                    <form:select path="phim.id" class = "form-control">
					    <form:options items="${phimList}" itemLabel="ten" itemValue="id" ></form:options>
					</form:select>
					<form:errors path = "phim.id" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Chọn Rạp</label>
                    <form:select path="rap.id" class = "form-control">
					    <form:options items="${rapList}" itemLabel="tenrap" itemValue="id" ></form:options>
					</form:select>
					<form:errors path = "rap.id" cssClass = "text-danger" />
                </div>
                <div class="form-group">
                	<form:input path="giave" class="form-control form-control-user" id="exampleInputEmail" placeholder="Giá Vé..." type="text" onfocus = "(this.value='')" aria_describedby="emailHelp"/>
                	<form:errors path="giave" cssClass="text-danger" />
                </div>
                <button type="submit" class="btn btn-primary">Lưu</button>
            </form:form>
        </div>
    </div>
    <!-- Page Heading -->
    <!-- DataTales Example -->
    <a href="<c:url value="/admin/suatchieu/"/>">Quay lại</a>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->