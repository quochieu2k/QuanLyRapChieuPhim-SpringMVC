<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">
        Vé Đã Đặt
    </h1>
    <div class="text-danger">
        <!--  Error message -->
    </div>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Người Đặt</th>
                            <th>Suất Chiếu</th>
                            <th>Phim</th>
                            <th>Rạp</th>
                            <th>Thời Gian Đặt</th>
                            <th></th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Người Đặt</th>
                            <th>Suất Chiếu</th>
                            <th>Phim</th>
                            <th>Rạp</th>
                            <th>Thời Gian Đặt</th>
                            <th></th>
                        </tr>
                    </tfoot>

                    <tbody>
                        <c:forEach var="ve" items="${listVe}">
                                <tr>
                                    <td>${ve.id}</td>
                                    <td>${ve.nguoidung.name}</td>
                                    <td><fmt:formatDate value="${ve.suatchieu.ngay}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${ve.suatchieu.thoidiembatdau}" pattern="HH:mm"/></td>
                                    <td>${ve.suatchieu.phim.ten}</td>
                                    <td>${ve.suatchieu.rap.tenrap}</td>
                                    <td><fmt:formatDate value="${ve.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                                    <td>
                                        <a href="<c:url value="/admin/ve/detail?id=${ve.id}"/>" class="btn btn-info btn-circle btn-sm">
                                            <i class="fas fa-info"></i>
                                        </a>
                                        <button onclick="Xoa(${ve.id})" class="btn btn-danger btn-circle btn-sm">
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
</table>
<!-- Modal Alert Xóa -->
<link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>
<script>
function Xoa(id) {
	  xdialog.confirm('Bạn có chắc chắn muốn xóa không?', function() {
	    // do work here if ok/yes selected...
		window.location.href = '<c:url value="/admin/ve/delete?id="/>'+id;
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