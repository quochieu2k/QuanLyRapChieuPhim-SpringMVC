<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="xemphim.model.*"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Shareable -->

<title><tiles:insertAttribute name="title" /></title>
<!-- Custom fonts for this template -->
<link
	href="<c:url value="/Assets/vendor/fontawesome-free/css/all.min.css" />"
	rel="stylesheet" type="text/css">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/bootstrap/bootstrap.min.css" />">
<!-- IonIcons -->
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/ionicons/css/ionicons.min.css" />">
<!-- Toast -->
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/toast/jquery.toast.min.css"/>">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/owlcarousel/dist/assets/owl.carousel.min.css" />">
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/owlcarousel/dist/assets/owl.theme.default.min.css" />">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/magnific-popup/dist/magnific-popup.css" />">
<link rel="stylesheet"
	href="<c:url value="/Assets/scripts/sweetalert/dist/sweetalert.css" />">
<!-- Custom style -->
<link rel="stylesheet" href="<c:url value="/Assets/css/style.css" />">
<link rel="stylesheet"
	href="<c:url value="/Assets/css/skins/all.css" />">
<link rel="stylesheet" href="<c:url value="/Assets/css/demo.css" />">

<!-- JS -->
<script src="<c:url value="/Assets/js/jquery.js"/>"></script>
<script src="<c:url value="/Assets/js/jquery.migrate.js"/>"></script>
<script
	src="<c:url value="/Assets/scripts/bootstrap/bootstrap.min.js"/>"></script>
<script>
	var $target_end = $(".best-of-the-week");
</script>
<script
	src="<c:url value="/Assets/scripts/jquery-number/jquery.number.min.js"/>"></script>
<script
	src="<c:url value="/Assets/scripts/owlcarousel/dist/owl.carousel.min.js"/>"></script>
<script
	src="<c:url value="/Assets/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"/>"></script>
<script
	src="<c:url value="/Assets/scripts/easescroll/jquery.easeScroll.js"/>"></script>
<script
	src="<c:url value="/Assets/scripts/sweetalert/dist/sweetalert.min.js"/>"></script>
<script src="<c:url value="/Assets/scripts/toast/jquery.toast.min.js"/>"></script>
<script src="<c:url value="/Assets/js/demo.js"/>"></script>
<script src="<c:url value="/Assets/js/e-magz.js"/>"></script>

<!-- Sweet Modal -->
<link rel="stylesheet"
	href="<c:url value="/Assets/sweetModel/jquery.sweet-modal.min.css" />" />
<script
	src="<c:url value="/Assets/sweetModel/jquery.sweet-modal.min.js" />"></script>
</head>

<body class="skin-orange">

	<header class="primary">
		<div class="fullfooter"></div>
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<a href="<c:url value="/" />"> <img
								src="<c:url value="/Assets/images/cgvlogo.png" />"
								alt="Magz Logo" id="logo">
							</a>
						</div>
					</div>
					<div class="col-md-5 col-sm-12">
						<form class="search" autocomplete="off"
							action="<c:url value="/phim/timkiem" />">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="query" class="form-control"
										placeholder="Tìm kiếm tên phim, đạo diễn, diễn viên,...">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-4 col-sm-12 text-right">
						<ul class="nav-icons">
							<%
							if (session.getAttribute("user") != null) {
								Nguoidung nguoidung = (Nguoidung) session.getAttribute("user");
							%>
							<li><a href="<c:url value="/member" />"> <i
									class="ion-person"></i>
									<div><%=nguoidung.getName()%></div>

							</a></li>
							<li><a href="<c:url value="/logout" />"> <i
									class="ion-person-delete"></i>
									<div>Đăng xuất</div>
							</a></li>

							<%
							} else {
							%>
							<li><a href="<c:url value="/register" />"> <i
									class="ion-person-add"></i>
									<div>Đăng ký</div>
							</a></li>
							<li><a href="<c:url value="/login" />"> <i
									class="ion-person"></i>
									<div>Đăng nhập</div>
							</a></li>
							<%
							}
							%>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu hello">
			<div class="container">
				<div class="brand">
					<a href="<c:url value="/" />"> <img
						src="<c:url value="/Assets/images/cgvlogo.png"/>" alt="Magz Logo">
					</a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
				<div id="menu-list">
					<ul class="nav-list">
						<li class="for-tablet nav-title"><a>Menu</a></li>
						<li class="dropdown"><a href="<c:url value="/phim"/>">PHIM<i
								class="ion-ios-arrow-right"></i></a></li>
						<li class="dropdown"><a href="<c:url value="/cumrap" />">RẠP
								CGV<i class="ion-ios-arrow-right"></i>
						</a></li>
						<li class="dropdown magz-dropdown"><a href="#">THÀNH VIÊN<i
								class="ion-ios-arrow-right"></i></a>
							<ul class="dropdown-menu">
								<%
								if (session.getAttribute("user") == null) {
								%>
								<li><a href="<c:url value="/register" />"><i
										class="icon ion-heart"></i> Đăng ký</a></li>
								<%
								} else {
								%>
								<li><a href="<c:url value="/member/changepassword" />">
										<i class="icon ion-key"></i> Đổi mật khẩu
								</a></li>
								<li><a href="<c:url value="/member" />"> <i
										class="icon ion-person"></i> Tài khoản của tôi
								</a></li>
								<%
								}
								%>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>

	<tiles:insertAttribute name="body" />

	<!-- Start footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-xs-12 col-sm-6">
					<div class="block-body">
						<ul class="social trp">
							<li><a href="#" class="facebook"> <svg>
                                        <rect width="0" height="0" />
                                    </svg> <i class="ion-social-facebook"></i>
							</a></li>
							<li><a href="#" class="twitter"> <svg>
                                        <rect width="0" height="0" />
                                    </svg> <i
									class="ion-social-twitter-outline"></i>
							</a></li>
							<li><a href="#" class="instagram"> <svg>
                                        <rect width="0" height="0" />
                                    </svg> <i
									class="ion-social-instagram-outline"></i>
							</a></li>
							<li><a href="#" class="linkedin"> <svg>
                                        <rect width="0" height="0" />
                                    </svg> <i class="ion-social-linkedin"></i>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="logo-footer-cgv">&nbsp;</div>
					<div class="text-cgv-address">
						<h3>CGV CINEMAS</h3>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="fullfooter"></div>
	<!-- End Footer -->

	
</body>

</html>

