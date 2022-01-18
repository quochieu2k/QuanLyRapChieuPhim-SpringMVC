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
                        <div>Bước 1: Chọn Ghế</div>
                    </div>
                    
                    <form id="form-chonghe" action="" method="POST">
                        <div class="block-body">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-2 col-xs-12 col-sm-12">
                                        <h3>${suatchieu.phim.ten}</h3>
                                        <p><img align="left" height="160" width="140" src="${pageContext.request.contextPath}/Assets/upload/poster/${suatchieu.phim.poster}" /></p>
                                        <p><label>${suatchieu.rap.cumrap.tencum}</label></p>
                                        <p>Ngày: <label><fmt:formatDate value="${suatchieu.ngay}" pattern="dd/MM/yyyy"/></label></p>
                                        <p>Suất chiếu: <label><fmt:formatDate value="${suatchieu.thoidiembatdau}" pattern="HH:mm"/></label></p>
                                        <p>Rạp: <label>${suatchieu.rap.tenrap}</label></p>
                                        <p>Đơn giá: <label>${suatchieu.giave} đ</label></p>
                                    </div>
                                    <div class="col-md-8 col-xs-12 col-sm-12">
                                        <div>
                                            <p style="text-align:center;color:gray;font-weight:bold;font-size:x-large">Màn hình</p>
                                            <p style="width:360px;background-color:gray;height:5px;margin: 0 auto;margin-bottom:10px"></p>
                                        </div>
                                        <ul class="social trp">
                                            <div class="ad" style="padding-left:inherit">
                                            <% 
                                            	Suatchieu sc = (Suatchieu)request.getAttribute("suatchieu");
                                            	List<String> listGheDaDat = (List<String>)request.getAttribute("listGheDaDat");
                                            	for(int i = 65; i < (65 + sc.getRap().getKtdoc()) ; i++) {
                                            	%>
                                            	<div class="clearfix row" style="position: relative;display: flex;justify-content: center;">
                                            	<%
                                            		for(int j = 1; j < sc.getRap().getKtngang() ; j++){
                                            			String ghe = ((char)i)+""+j;
                                            			if(listGheDaDat.contains(ghe)){
                                            	%>
                                            			<label onclick="onClickSelect(this,<%= sc.getGiave() %>,'<%= ghe %>',false)" style="margin:3px;width:35px;height:35px;background:#ffd800;color:#fff;text-align:center;float:right;font-size: 4;line-height:35px;letter-spacing: 2px;cursor: pointer;">
                                                           <%= ghe %>
                                                        </label>
                                                <%
                                            			}else{
                                                %>
                                                		<label style="margin:3px;width:35px;height:35px;background:#278ac7;color:#fff;text-align:center;float:right;font-size: 4;line-height:35px;letter-spacing: 2px;cursor: pointer;">
                                                        	<input type="checkbox" readonly name="seat" value="<%= ghe %>" onclick="onClickSelect(this,<%= sc.getGiave() %>,'<%= ghe %>',true)" class="hide" />
                                                            <%= ghe %>
                                                        </label>
                                                		
                                            	<%
                                            			}
                                            		}
                                            	%>
                                            	</div>
                                            	<%
                                            	}
                                            %>
                                            </div>
                                        </ul>
                                    </div>
                                    <div class="col-md-2 col-xs-12 col-sm-12">
                                        <table style="border:1px solid black;">
                                            <tr>
                                                <td align="center" colspan="2"><label>Chú thích</label></td>
                                            </tr>
                                            <tr>
                                                <td><p style="width:20px;height:20px;background-color:#278ac7"></p></td>
                                                <td><label>Ghế đơn</label></td>
                                            </tr>
                                            <tr>
                                                <td><p style="width:20px;height:20px;background-color:#ffd800"></p></td>
                                                <td><label>Ghế đã bán</label></td>
                                            </tr>
                                            <tr>
                                                <td><p style="width:20px;height:20px;background-color:red"></p></td>
                                                <td><label>Ghế đang chọn</label></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div><br>
                        <div class="clearfix"></div>
                        <section class="container" style="box-shadow: 0px 0px 5px 1px #333;padding-top:20px;padding-bottom:40px;margin-bottom:20px;background-color:#333">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="col-lg-12">
                                            <h5 style="text-align:left;color: #fff;">Danh sách ghế đã chọn</h5>
                                            <div class="note-color">
                                                <div class="note-col"><p id="total_ticket" style="letter-spacing: 3px;font-size: 17px;color: #fff;">Chưa chọn ghế</p></div>
                                            </div>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <h5 style="text-align:left;color: #fff;">Giá vé</h5>
                                            <div class="note-color">
                                                <div class="note-col"><p id="total_money" style="letter-spacing: 3px;font-size: 17px;color: #fff;">0</p></div>
                                            </div>
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
                    </form>
                    <div class="form-group">
                            <button onclick="submit()" class="btn btn-primary btn-block btndatve">Tiếp Theo <i class="ion-ios-arrow-right"></i></button>
                    </div>
                    <script>
                        var countSeat = 0;
                        var giaVe = 0;
                        var seats = [];
                        var foods = new Map();
                        var total = 0;
                        //event onclick select seat
                        function onClickSelect(elm, price, name, isEmpty) {
                            if (!isEmpty) {
                            	sweetAlert('Ghế này đã có người đặt');
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
                        //event onclick food
                        function selectFood(elm, id, price, name) {
                            var soluong = parseInt($("#" + id).val());
                            var tenMon = "";
                            if ($(elm).html() == "+") {
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

                            $("#" + id).val(soluong);

                            if (soluong == 0)
                                foods.delete(name);
                            else
                                foods.set(name, soluong);


                            foods.forEach((value, key) => {
                                tenMon += "<p>" + key + " - " + value + "</p>";
                            });

                            //hiển thị tên món
                            $("#total_food").html(tenMon);
                            //hiển thị tổng tiền
                            $("#total_pay").html(total + "đ");
                        }
                        //submit form đặt vé
                        function submit(){
                        	var form = document.getElementById("form-chonghe");
                        	if(seats.length == 0){
                        		sweetAlert('Vui lòng chọn ghế cần đặt');
                        		return;
                        	}
                        	form.submit();
                        }
                		//sweetModal
                		function sweetAlert(msg) {
                			$.sweetModal({
                				content : msg,
                				title : '',
                				icon : $.sweetModal.ICON_WARNING,
                				theme : $.sweetModal.THEME_MIXED,
                				buttons : {
                					'OK' : {
                						classes : 'redB'
                					}
                				}
                			});
                		}
                    </script>
                </div>
                </div>
            </div>
    </div>
</section>