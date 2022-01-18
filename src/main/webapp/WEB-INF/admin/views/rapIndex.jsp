<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">
        Rạp <a href="<c:url value="/admin/rap/create"/>" class = "btn btn-success btn-circle pull-left">+</a>
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
                            <th>Tên Rạp</th>
                            <th>Loại Rạp</th>
                            <th>Kích thước ngang</th>
                            <th>Kích thước dọc</th>
                            <th>Tên Cụm</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Tên Rạp</th>
                            <th>Loại Rạp</th>
                            <th>Kích thước ngang</th>
                            <th>Kích thước dọc</th>
                            <th>Tên Cụm</th>
                            <th></th>
                        </tr>

                    </tfoot>
                    <tbody>
                        <c:forEach var="rap" items="${listRap}">
                            <tr>
                                <td>${rap.tenrap}</td>
                                <td>${rap.loairap}</td>
                                <td>${rap.ktngang}</td>
                                <td>${rap.ktdoc}</td>
                                <td>${rap.cumrap.tencum}</td>
                                <td>
                                    <a href="<c:url value="/admin/rap/edit?id=${rap.id}"/>" class="btn btn-success btn-circle btn-sm">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <button onclick="Xoa(${rap.id})" class="btn btn-danger btn-circle btn-sm">
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
		window.location.href = '<c:url value="/admin/rap/delete?id="/>'+id;
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