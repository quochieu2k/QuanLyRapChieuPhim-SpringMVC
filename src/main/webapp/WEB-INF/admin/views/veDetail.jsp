<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="xemphim.model.*" %>
<%@ page import="java.util.List" %>

<!-- Begin Page Content -->
<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Chi Tiết Vé</h1>
    <div class="row justify-content-center">
        <div class="col-xl-8 col-lg-12 col-md-9">
            <dl class="dl-horizontal">
                <div class="form-group">
                    <dt>
                        Mã Đặt Vé
                    </dt>

                    <dd>
                        ${ve.id }
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Người Đặt
                    </dt>

                    <dd>
                        ${ve.nguoidung.name}
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Phim
                    </dt>

                    <dd>
                        ${ve.suatchieu.phim.ten}
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Suất Chiếu
                    </dt>

                    <dd>
                    	<fmt:formatDate value="${ve.suatchieu.ngay}" pattern="dd/MM/yyyy"/> - <fmt:formatDate value="${ve.suatchieu.thoidiembatdau}" pattern="HH:mm"/>
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Ghế
                    </dt>

                    <dd>
                    	${ve.ghe}
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Đồ Ăn và Thức Uống
                    </dt>

                    <dd>
                    <c:forEach items="${listVeFood}" var="food">  
   						<c:out value="${food.fastfood.tenmon}"/> - <c:out value="${food.soluong}"/><br>
					</c:forEach>
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Thời gian đặt vé
                    </dt>

                    <dd>
                        <fmt:formatDate value="${ve.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                    </dd>
                </div>
                <div class="form-group">
                    <dt>
                        Tổng tiền
                    </dt>

                    <dd>
                    <%
                    	List<VeFood> listVeFood = (List<VeFood>) request.getAttribute("listVeFood");
                    	Ve ve = (Ve) request.getAttribute("ve");
                    	int tong=ve.getSuatchieu().getGiave();
                    	
                    	for(VeFood vefood : listVeFood){
                    		tong += vefood.getFastfood().getGia();
                    	}
                    	out.print(tong+"đ");
                    %>
                    </dd>
                </div>
            </dl>
                <div class="form-actions no-color">
                	<button onclick="Xoa(${ve.id})" class="btn btn-danger">Xóa</button> |
                    <a href="<c:url value="/admin/ve/"/>">Quay lại</a>
                </div>
        </div>
    </div>

    <!-- Page Heading -->
    <!-- DataTales Example -->

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