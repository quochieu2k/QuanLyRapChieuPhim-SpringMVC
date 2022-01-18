<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<section class="login first grey">
	<div class="container">
		<!-- Nested Row within Card Body -->
		<div class="row">
			<div class="col-lg-12 d-none d-lg-block bg-register-image"></div>
			<div class="col-lg-12">
				<div class="text-center">
					<div class="line top">
						<div>Đổi Mật Khẩu</div>
					</div>
				</div>
				<p style="color: red">${message}</p>
				<br>
				<form action="" method="POST">
					<div class="form-group row">
						<div class="form-group col-sm-8">
							<label class="fw">Mật khẩu Cũ</label> <input type="password"
								name="old_password" class="form-control" required>
						</div>
						<div class="form-group col-sm-8">
							<label class="fw">Mật khẩu Mới</label> <input type="password"
								name="new_password" class="form-control" required>
						</div>
						<div class="form-group col-sm-8">
							<label class="fw">Mật khẩu xác nhận</label> <input
								type="password" name="confirm_password" class="form-control"
								required>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Lưu</button>
				</form>
			</div>
		</div>
	</div>
</section>
