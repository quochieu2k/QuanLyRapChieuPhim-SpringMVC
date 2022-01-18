<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ page import="xemphim.model.*" %>
<%@ page import="java.util.List" %>

<section class="login first grey">
	<div class="container">
		<!-- Nested Row within Card Body -->
		<div class="row">
			<div class="col-lg-12 d-none d-lg-block bg-register-image"></div>
			<div class="col-lg-12">
				<div class="text-center">
					<div class="line top">
						<div>Thông tin cá nhân</div>
					</div>
					<c:if test="${not empty message}">
						<div class="alert alert-success" role="alert">${message}</div>
					</c:if>
				</div>
				<form:form method="post" modelAttribute="user">
					<form:input path="id" type="hidden" />
					<form:input path="pass" type="hidden" />
					<form:input path="permission" type="hidden" />
					<div class="form-group row">
						<div class="col-sm-6 mb-6 mb-sm-0">
							<label for="">Tên Của Bạn</label>
							<form:input path="name" class="form-control form-control-user"
								placeholder="Tên..." />
							<form:errors path="name" cssClass="text-danger" />
						</div>
						<div class="col-sm-6">
							<label for="">Số Điện Thoại</label>
							<form:input path="phone" class="form-control form-control-user"
								placeholder="Số Điện Thoại..." />
							<form:errors path="phone" cssClass="text-danger" />
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="">Email</label>
								<form:input path="email" class="form-control form-control-user"
									placeholder="Email..." />
								<form:errors path="email" cssClass="text-danger" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="">Ngày Sinh</label>
								<form:input path="birthday" type="date"
									class="form-control form-control-user" />
								<form:errors path="birthday" cssClass="text-danger" />
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="">Giới Tính: </label><br />
								<form:radiobutton path="gender" value="Nam" />
								Nam
								<form:radiobutton path="gender" value="Nữ" />
								Nữ
								<form:errors path="gender" cssClass="text-danger" />
							</div>
						</div>
						<div class="col-sm-6">
							<!-- <div class="form-group"> -->
							<br> <label for=""><h2>
									<a href="<c:url value="/member/changepassword"/>">Đổi mật
										khẩu</a>
								</h2></label>
							<!-- </div> -->
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Lưu</button>
				</form:form>
				<hr>
				<div class="line top">
					<div>Lịch sử đặt vé</div>
				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Ngày Giờ</th>
							<th scope="col">Phim</th>
							<th scope="col">Rạp</th>
							<th scope="col">Cụm Rạp</th>
							<th scope="col">Ghế</th>
							<th scope="col">Mã QR</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${user.ves}" var="ve">
							<c:if test="${ve.xoa == 0 }">
								<tr>
									<td><fmt:formatDate value="${ve.suatchieu.ngay}"
											pattern="dd/MM/yyyy" /> - <fmt:formatDate
											value="${ve.suatchieu.thoidiembatdau}" pattern="HH:mm" /></td>
									<td>${ve.suatchieu.phim.ten}</td>
									<td>${ve.suatchieu.rap.tenrap}</td>
									<td>${ve.suatchieu.rap.cumrap.tencum}</td>
									<td>${ve.ghe}</td>
									<td><button onclick="qrcode(${ve.id})" class="btn btn-primary">Nhấn để quét mã</button></td>
									
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<script>
function qrcode(id){
	swal({
        title: 'QR Code',
        text: '<img src="${pageContext.request.contextPath}/member/ve/'+id+'" width="300" height="300"/>',
        html: true
    });
}
</script>