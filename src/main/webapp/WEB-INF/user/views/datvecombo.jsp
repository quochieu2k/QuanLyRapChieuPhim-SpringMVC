<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>

<%@ page import="xemphim.model.*" %>
<%@ page import="java.util.List" %>

<link rel="stylesheet" type="text/css" href="<c:url value="/Assets/css/datve.css" />" media="all" />
<section class="best-of-the-week">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12 col-sm-12">
                <div class="block">
                    <div class="line top">
                        <div>Bước 2: Chọn Bắp Nước</div>
                    </div>
                    
                    
                        <div class="block-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 col-xs-12 col-sm-12">
                                        <ol class="products-list" id="products-list">
                                        <%
                                        	List<Fastfood> foods = (List<Fastfood>)request.getAttribute("listFood");
                                        	int i = 0;
                                        	String first;
                                        	for(Fastfood food : foods){
                                        		if(i % 2 == 0){
                                        			first = "item first";
                                        		}else{
                                        			first = "item last";
                                        		}
                                        		i++;
                                        %>
                                        
                                        		<li class="<%= first %>">
                                                    <img src="${pageContext.request.contextPath}/Assets/upload/food/<%= food.getImage() %>" alt="<%= food.getTenmon() %>" class="product-image" height="250">

                                                    <div class="product-shop">
                                                        <div class="f-fix">
                                                            <div class="product-primary"><h3><%= food.getTenmon() %></h3></div>
                                                            <div class="desc std">
                                                                <%= food.getMota() %>
                                                            </div>

                                                            <div class="desc">
                                                                <div class="price-box">
                                                                    <span class="label" style="color:black;">Giá:</span>
                                                                    <span class="price"><%= food.getGia() %>&nbsp;₫</span>
                                                                </div>
                                                                <div class="action">
                                                                    <div class="button fml103123" onclick="selectFood(this,<%= food.getId() %>,<%= food.getGia() %>,'<%= food.getTenmon() %>')">-</div>
                                                                    <input type="number" id="<%= food.getId() %>" class="input-text qty button" style="color:black" value="0" min="0" max="99" readonly />
                                                                    <div class="button fml103123" onclick="selectFood(this,<%= food.getId() %>,<%= food.getGia() %>,'<%= food.getTenmon() %>')">+</div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li> 
                                        
                                        <%
                                        	}
                                        %>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <section class="container" style="box-shadow: 0px 0px 5px 1px #333;padding-top:20px;padding-bottom:40px;margin-bottom:20px;background-color:#333">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <h5 style="text-align:left;color: #fff;">Combo Đã Chọn</h5>
                                        <div class="note-color">
                                            <div class="note-col" id="total_food" style="font-size: 17px;color: #fff;"></div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <h5 style="text-align:left;color: #fff;">Thành tiền</h5>
                                        <div class="note-color">
                                            <div class="note-col" id="total_pay" style="font-size: 17px;color: #fff;">0</div>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="form-group">
                            <a href="<c:url value="/datve/confirm"/>" class="btn btn-primary btn-block btndatve">Thanh Toán</a>
                        </div>
                    <script>
                        var countSeat = 0;
                        var giaVe = 0;
                        var seats = [];
                        var foods = new Map();
                        var total = 0;
                        function onClickSelect(elm, price, name, isEmpty) {
                            if (!isEmpty) {
                                alert("Ghế này đã có người đặt!");
                                return false;
                            }
                            //nếu người dùng bỏ chọn ghế này thì chuyển màu và loại bỏ khỏi mảng seats
                            if (seats.includes(name)) {
                                elm.removeAttribute("checked");
                                //xóa khỏi mảng
                                seats.splice(seats.indexOf(name), 1);
                                //cập nhật biến đếm và biến giá vé
                                countSeat--;
                                giaVe -= price;
                                total -= price;
                                //đổi màu
                                $(elm).parent().css("background-color", "#278ac7");
                            } else {
                                elm.setAttribute("checked", "checked");
                                seats.push(name);
                                countSeat++;
                                giaVe += price;
                                total += price;
                                $(elm).parent().css("background-color", "red");
                            }

                            if (countSeat == 0) {
                                $("#total_ticket").html("Chưa chọn ghế");
                            } else {
                                $("#total_ticket").html(seats.toString());
                            }
                            $("#total_money").html(giaVe + "đ");
                            $("#total_pay").html(total + "đ");
                        }
                        function selectFood(elm, id, price, name) {
                            var soluong = parseInt($("#" + id).val());
                            var tenMon = "";
                            var operation = $(elm).html();
                            if (operation == "+") {
                                //cập nhật số lượng
                                if (soluong + 1 <= 99) {
                                    soluong++;
                                    total += price;
                                }
                            }
                            else {
                                if (soluong - 1 >= 0) {
                                    soluong--;
                                    total -= price;
                                }
                            }
							AjaxCapNhatCombo(id, soluong); //gửi thông tin combo phía backend
                            $("#" + id).val(soluong);

                            if (soluong == 0)
                                foods.delete(name);
                            else
                                foods.set(name, soluong);


                            foods.forEach((value, key) => {
                                tenMon += "<p>" + key + " x " + value + "</p>";
                            });

                            //hiển thị tên món
                            $("#total_food").html(tenMon);
                            //hiển thị tổng tiền
                            $("#total_pay").html(total + "đ");
                        }
                        
                        function AjaxCapNhatCombo(id, num){
                        	
                        	$.ajax({
                                url: "<c:url value="/datve/api/combo" />",
                                method: "POST",
                                data: { id: id, quantity: num },
                                success: function (data) {
                                    $("#showtime").html(data);
                                }
                            })
                        }
                    </script>
                </div>
                </div>
            </div>
    </div>
</section>