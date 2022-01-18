<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="xemphim.model.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><tiles:insertAttribute name="title" /></title>
    <!-- Custom fonts for this template -->
    <link href="<c:url value = "/Assets/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value = "/Assets/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link href="<c:url value = "/Assets/css/sb-admin-2.css"/>" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="<c:url value = "/Assets/vendor/datatables/dataTables.bootstrap4.min.css"/>" rel="stylesheet">
</head>
<body id="page-top">
    <div class="fullfooter">
    </div>
    <!-- Page Wrapper -->
    <div id="wrapper">
        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value = "/admin/"/>">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-video"></i>
                </div>
                <div class="sidebar-brand-text mx-3">ADMINISTRATOR</div>
            </a>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">
            <!-- Nav Item - Tables -->
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/phim/"/>">
                    <i class="fas fa-film"></i>
                    <span>Phim</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/cumrap/"/>">
                    <i class="fas fa-warehouse"></i>
                    <span>Cụm Rạp</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/rap/"/>">
                    <i class="fas fa-map-marked-alt"></i>
                    <span>Rạp</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/suatchieu/"/>">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Suất Chiếu</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/food/"/>">
                    <i class="fas fa-hamburger"></i>
                    <span>Đồ Ăn</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/ve/"/>">
                    <i class="fas fa-ticket-alt"></i>
                    <span>Quản Lý Vé</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/nguoidung/"/>">
                    <i class="fas fa-users"></i>
                    <span>Người Dùng</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value = "/admin/quangcao/"/>">
                    <i class="fas fa-money-bill"></i>
                    <span>Quảng cáo</span>
                </a>
            </li>
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
            <!-- Main Content -->
            <div id="content">
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <!-- Topbar Search -->
                    <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                   aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <!-- Nav Item - Alerts -->
                        <!-- Nav Item - Messages -->
                        <div class="topbar-divider d-none d-sm-block"></div>
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                               data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= ((Nguoidung)session.getAttribute("user")).getName() %></span>
                                <img class="img-profile rounded-circle" src="<c:url value = "/Assets/images/admin.png"/>">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                 aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Thông tin cá nhân
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Đăng xuất
                                </a>
                            </div>
                        </li>
                    </ul>
                </nav>
                <!-- End of Topbar -->
                <!-- Begin Page Content -->
                <tiles:insertAttribute name="body" />
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Cinema</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
            </div>
            <!-- End of Content Wrapper -->
        </div>
        <div class="fullfooter">
        </div>
        <!-- End of Page Wrapper -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bạn muốn thoát khỏi trang?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Bạn có muốn đăng xuất không</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="<c:url value = "/logout"/>">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="<c:url value = "/Assets/vendor/jquery/jquery.min.js"/>"></script>
        <script src="<c:url value = "/Assets/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <!-- Core plugin JavaScript-->
        <script src="<c:url value = "/Assets/vendor/jquery-easing/jquery.easing.min.js"/>"></script>
        <!-- Custom scripts for all pages-->
        <script src="<c:url value = "/Assets/js/sb-admin-2.min.js"/>"></script>
        <!-- Page level plugins -->
        <script src="<c:url value = "/Assets/vendor/datatables/jquery.dataTables.min.js"/>"></script>
        <script src="<c:url value = "/Assets/vendor/datatables/dataTables.bootstrap4.min.js"/>"></script>
        <script src="<c:url value = "/Assets/vendor/chart.js/Chart.min.js"/>"></script>
        <!-- Page level custom scripts -->
        <script src="<c:url value = "/Assets/js/demo/datatables-demo.js"/>"></script>
        <script src="<c:url value = "/Assets/js/demo/chart-area-demo.js"/>"></script>
</body>
</html>