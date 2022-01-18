<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ page import="xemphim.model.*" %>
<%@ page import="java.util.*" %>
<style>
td {
	padding: 8px;
}
td:first-child { 
	color: #cc0066;
	font-weight: bold;
}
table tr:nth-child(odd){
    background: #eeeeee;
}
</style>
<section class="best-of-the-week">
	<div class="container">
		<div class="row">
			<div id="alert" class="alert alert-success" role="alert"
						style="text-align: center; font-family: Arial; font-weight: bold; font-size: 20px">
			Mua vé online thành công! Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!
			</div>
			<div class="line top">
						<div>Xác Nhận Thông Tin</div>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<p><img height="320" width="200" src="${pageContext.request.contextPath}/Assets/upload/poster/${suatchieu.phim.poster}" /></p>
			</div>
			<div class="col-md-6 col-xs-12 col-sm-12">
				<div class="block">
					<table
						style="margin-left: auto; margin-right: auto;  text-align: left;  font-size: medium">
						<tr>
							<td>Người Đặt Vé:</td>
							<td>${nguoidung.name}</td>
						</tr>
						<tr>
							<td>Email:</td>
							<td>${nguoidung.email}</td>
						</tr>
						<tr>
							<td>Số điện thoại:</td>
							<td>${nguoidung.phone}</td>
						</tr>
						<tr>
							<td>Rạp:</td>
							<td>${suatchieu.rap.cumrap.tencum} - ${suatchieu.rap.tenrap}</td>
						</tr>
						<tr>
							<td>Tên Phim:</td>
							<td>${suatchieu.phim.ten}</td>
						</tr>
						<tr>
							<td>Suất Chiếu:</td>
							<td><label><fmt:formatDate
										value="${suatchieu.thoidiembatdau}" pattern="HH:mm" /> - <fmt:formatDate
										value="${suatchieu.ngay}" pattern="dd/MM/yyyy" /></label></td>
						</tr>
						<% 
							List<Ve> listVe = (List<Ve>) request.getAttribute("listVe");
						%>
						<tr>
							<td>Số Ghế: <%= listVe.size() %></td>
							<td>
							<%
								int tongGhe = 0;
								for(Ve ve : listVe){
									tongGhe += ve.getSuatchieu().getGiave();
									out.print("<label>"+ve.getGhe()+"</label>  ");
								}
							%>
							</td>
						</tr>
						<% 
							List<VeFood> listVeFood = listVe.get(0).getVeFoods();
						%>
						<tr>
							<td>Số Lượng Combo: <%= listVeFood == null ? "0" : listVeFood.size() %></td>
							<td></td>
						</tr>
							<%
								int tongCombo = 0;
								if(listVeFood != null){
									for(VeFood vefood : listVeFood){
										tongCombo += vefood.getSoluong()*vefood.getFastfood().getGia();
									}
								}
								if(tongCombo != 0){
									out.print("<tr><td>Tổng Tiền Combo: "+tongCombo+"đ</td><td></td></tr>");
								}
							%>
								
						<tr>
							<td>Tổng cộng:</td>
							<td><label><%= tongGhe+tongCombo %></label></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<%
					for(Ve ve : listVe){
						out.print("<p><img height=\"100\" width=\"100\" src=\""+request.getContextPath()+"/member/ve/"+ve.getId()+"\" />"+
									"<br><b><lable style=\"color: #cc0066;\">Ghế: </lable>"+ve.getGhe()+"</b></p>");
						
					}
				%>
			</div>
		</div>
	</div>
</section>