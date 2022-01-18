<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">
	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">
		Suất Chiếu <a href="<c:url value="/admin/suatchieu/create"/>"
			class="btn btn-success btn-circle pull-left">+</a>
	</h1>
	<div class="text-danger">
		<!-- Error messages -->
	</div>
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<thead>
						<tr>
							<th>Phim</th>
							<th>Ngày</th>
							<th>Giờ Bắt Đầu</th>
							<th>Giờ Kết Thúc</th>
							<th>Rạp</th>
							<th>Giá Vé</th>
							<th></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Phim</th>
							<th>Ngày</th>
							<th>Giờ Bắt Đầu</th>
							<th>Giờ Kết Thúc</th>
							<th>Rạp</th>
							<th>Giá Vé</th>
							<th></th>
						</tr>
					</tfoot>
					<tbody>
						<c:forEach var="suatchieu" items="${listSuatChieu}">
							<tr>
								<td>${suatchieu.phim.ten}</td>
								<td><fmt:formatDate value="${suatchieu.ngay}" pattern="dd/MM/yyyy"/></td>
								<td><fmt:formatDate value="${suatchieu.thoidiembatdau}" pattern="HH:mm"/></td>
								<td><fmt:formatDate value="${suatchieu.thoidiemketthuc}" pattern="HH:mm"/></td>
								<td>${suatchieu.rap.tenrap}</td>
								<td>${suatchieu.giave}đ</td>
								<td>
									<a href="<c:url value="/admin/suatchieu/edit?id=${suatchieu.id}"/>" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button onclick="Xoa(${suatchieu.id})" class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
</div>
<!-- End of Main Content -->
<!-- Modal Alert Xóa -->
<link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>
<script>
function Xoa(id) {
	  xdialog.confirm('Bạn có chắc chắn muốn xóa không?', function() {
	    // do work here if ok/yes selected...
		window.location.href = '<c:url value="/admin/suatchieu/delete?id="/>'+id;
	  }, {
	    style: 'width:420px;font-size:0.8rem;',
	    buttons: {
	      ok: 'Có',
	      cancel: 'Không'
	    },
	    oncancel: function() {
	      
	    }
	  });
	}
</script>