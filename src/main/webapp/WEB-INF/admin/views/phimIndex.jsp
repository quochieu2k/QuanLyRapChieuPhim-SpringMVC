<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">
        Phim
        <a href="<c:url value="/admin/phim/create"/>" class = "btn btn-success btn-circle pull-left">+</a>
    </h1>
    <div class="text-danger">
        <!-- Error messages -->
    </div>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Tên Phim</th>
                            <th>Thể Loại</th>
                            <th>Ngày Công Chiếu</th>
                            <th>Poster</th>
                            <th>Thời Lượng</th>
                            <th></th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                            <th>Tên Phim</th>
                            <th>Thể Loại</th>
                            <th>Ngày Công Chiếu</th>
                            <th>Poster</th>
                            <th>Thời Lượng</th>
                            <th></th>
                        </tr>
                    </tfoot>

                    <tbody>
                        <c:forEach var="phim" items="${listPhim}">
                                <tr>
                                    <td>${phim.ten}</td>
                                    <td>${phim.theloai}</td>
                                    <td><fmt:formatDate value="${phim.ngaycongchieu}" pattern="dd/MM/yyyy"/></td>
                                    <td><img src="${pageContext.request.contextPath}/Assets/upload/poster/${phim.poster}" height="150" /></td>
                                    <td>${phim.thoiluong} phút</td>
                                    <td>
                                        <a href="<c:url value="/admin/phim/edit?id=${phim.id}"/>" class="btn btn-success btn-circle btn-sm">
                                        	<i class="fas fa-edit"></i>
                                    	</a>
                                    	<button onclick="Xoa(${phim.id})" class="btn btn-danger btn-circle btn-sm">
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
<link href="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.css" rel="stylesheet"/>
<script src="https://cdn.jsdelivr.net/gh/xxjapp/xdialog@3/xdialog.min.js"></script>
<script>
function Xoa(id) {
	  xdialog.confirm('Bạn có chắc chắn muốn xóa không?', function() {
	    // do work here if ok/yes selected...
		window.location.href = '<c:url value="/admin/phim/delete?id="/>'+id;
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