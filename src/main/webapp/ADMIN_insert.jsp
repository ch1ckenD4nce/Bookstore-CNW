<%@page import="model.BEAN.TACGIA"%>
<%@page import="model.BEAN.THELOAI"%>
<%@page import="model.BEAN.SACH"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.StringTokenizer" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>USER_index</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
	<link rel="stylesheet" type="text/css" href="css/vendor.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<style>
		/* Thêm CSS dưới đây */
		
		body {
		    background-color: #F3F2EC; /* Chọn màu nền cho trang */
		}
		
		.table {
		    border-collapse: collapse;
		    width: 100%;
		    margin-top: 20px; /* Điều chỉnh khoảng cách giữa table và các phần khác của trang nếu cần */
		}
		
		.table th,
		.table td {
		    border: 2px solid #C5A992; /* Chọn màu của đường biên giữa các ô */
		    padding: 8px; /* Điều chỉnh khoảng cách giữa nội dung và đường biên của ô */
		}
		
		.table th {
		    background-color: #495057; /* Chọn màu nền cho ô header */
		    color: #ffffff; /* Chọn màu chữ cho ô header */
		}
		
		.table tbody tr:nth-child(odd) {
		    background-color: #C5A992; /* Chọn màu nền cho các hàng chẵn */
		}
		
		.table tbody tr:nth-child(even) {
		    background-color: #ffffff; /* Chọn màu nền cho các hàng lẻ */
		}
	</style>
	<script>
        function updateAndSubmit(comboBoxId, cbbName, eventType) {
            var selectedValue = document.getElementById(comboBoxId).value;
            document.getElementById('selectedValue').value = selectedValue;
            document.getElementById('selectedCbb').value = cbbName;
            document.getElementById('eventType').value = eventType;
            document.getElementById('myForm').submit();
        }

        function searchInputKeyDown(event) {
            // Kiểm tra xem phím nhấn có phải là phím Enter không
            if (event.key === "Enter") {
                // Gọi hàm xử lý tìm kiếm
                updateAndSubmit('txt_search', 'txt_search', 'search');
            }
        }
    </script>
</head>

<body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
	<%
        request.setCharacterEncoding("UTF-8");
        ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
		String nameUser = (String) session.getAttribute("nameUser");
    %>
	<div id="header-wrap">
		
		<div class="top-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						
					</div>
					<div class="col-md-6">
						<div class="right-element">
							<a href="#" class="user-account for-buy"><i
									class="icon icon-user"></i><span><%= nameUser %></span></a>
							<a href="CONTROLLER_USER?modget=logout" class=""><i class=""></i><span>Logout
									</span></a>

							
						</div><!--top-right-->
					</div>

				</div>
			</div>
		</div><!--top-content-->
		<form id="myForm" action="CONTROLLER_ADMIN?modpost=select" method="POST" accept-charset="UTF-8">
			<header id="header">
				<div class="container-fluid">
					<div class="row">
	
						<div class="col-md-2">
							<div class="main-logo">
								
								<a href="CONTROLLER_USER?modget=home"><img src="images/logo.png" alt="logo"></a>
							</div>
	
						</div>
	
						<div class="col-md-10">
							<nav id="navbar">
								<div class="main-menu stellarnav">
									<ul class="menu-list">
										<li class="menu-item has-sub">
												<select class ="ccb-timkiem" id="ccb-timkiem" onchange="updateAndSubmit('ccb-timkiem', 'ccb-timkiem', 'cbb')">
													<option value="">Chọn thể loại</option>
	                								<option value="">Tất cả</option>
													<% for (int i = 0; i < listTheloai.size(); i++) { %>
									                	<option class="btn-wrap" value="<%= listTheloai.get(i).getIdtheloai() %>"><%= listTheloai.get(i).getTentheloai() %></option>
									                <% } %>
												</select>
										</li>
										<li class="action-menu">
											<div class="search-bar">
												<a href="#" class="search-button search-toggle" data-selector="#header-wrap">
													<i class="icon icon-search"></i>
												</a>
												
												<input name="txt_search" id="txt_search" class="search-field text search-input" placeholder="Search" type="text" style=" margin: 0; background: #efeee8; border: 0;" onkeydown="searchInputKeyDown(event)">
												
											</div>
										</li>							
										<li class="menu-item active"><a href="CONTROLLER_ADMIN?modget=home">Book</a></li>
										
										<li class="menu-item"><a href="CONTROLLER_ADMIN?modget=order" class="nav-link">Order</a></li>
										
									</ul>
	
									<div class="hamburger">
										<span class="bar"></span>
										<span class="bar"></span>
										<span class="bar"></span>
									</div>
	
								</div>
							</nav>
	
						</div>
	
						<input type="hidden" name="selectedValue" id="selectedValue" value="" />
				        <input type="hidden" name="selectedCbb" id="selectedCbb" value="" />
				        <input type="hidden" name="eventType" id="eventType" value="" />
					</div>
				</div>
			</header>
		</form>
	</div><!--header-wrap-->
	
	<section id="billboard">
        <div class="container">
            <form action="CONTROLLER_ADMIN?modpost=themsach" method="POST" enctype="multipart/form-data">
        <table>
            <tr>
                <td><p>MÃ SÁCH</p></td>
                <td><input type="text" name="masach" required></td>
            </tr>
            <tr>
                <td><p>TÊN SÁCH</p></td>
                <td><input type="text" name="tensach" required></td>
            </tr>
            <tr>
                <td><p>TÁC GIẢ</p></td>
                <td><input type="text" name="tacgia" required></td>
            </tr>
            <tr>
                <td><p>NXB</p></td>
                <td><input type="text" name="nxb" required></td>
            </tr>
            <tr>
                <td><p>THỂ LOẠI</p></td>
                <td>
                    <select class="ccb-timkiem" id="idtheloai" name="idtheloai">
                        <% for (int i = 0; i < listTheloai.size(); i++) { %>
                            <option class="btn-wrap" value="<%= listTheloai.get(i).getIdtheloai() %>"><%= listTheloai.get(i).getTentheloai() %></option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td><p>GIÁ BÁN</p></td>
                <td><input type="text" name="giaban" required></td>
            </tr>
            <tr>
                <td><p>SỐ LƯỢNG TỔNG</p></td>
                <td><input type="text" name="soluongtong" required></td>
            </tr>
            <tr>
                <td><p>GIẢM GIÁ</p></td>
                <td><input type="text" name="giamgia" required></td>
            </tr>
            <tr>
                <td><p>MÔ TẢ</p></td>
                <td><input type="text" name="mota" required></td>
            </tr>
            <tr>
                <td><p>ẢNH</p></td>
                <td><input type="file" name="fileanh" id="fileanh" accept="image/*" required></td>
            </tr>
            
            <tr>
                <td></td>
                <td colspan="2">
                    <input type="submit" value="Lưu lại">
                    <button><a href="../Controller/C_QLNSPB.jsp?updateView=1" style="text-decoration: none;color:black">Hủy</a></button>
                </td>
            </tr>
        </table>
    </form>
        </div>
    </section>

	

	<footer id="footer">
		<div class="container">
			<div class="row">

				<div class="col-md-4">

					<div class="footer-item">
						<div class="company-brand">
						
							<img src="images/logo.png" alt="logo" class="footer-logo">
					
						</div>
					</div>

				</div>

				<div class="col-md-2">

					<div class="footer-menu">
						<h5>About Us</h5>
						
					</div>

				</div>
				<div class="col-md-2">

					<div class="footer-menu">
						<h5>Discover</h5>
						<ul class="menu-list">
							<li class="menu-item">
								<a href="#">Home</a>
							</li>
							<li class="menu-item">
								<a href="#">Books</a>
							</li>
							<li class="menu-item">
								<a href="#">Authors</a>
							</li>
							
						</ul>
					</div>

				</div>
				<div class="col-md-2">

					<div class="footer-menu">
						<h5>My account</h5>
						<ul class="menu-list">
							<li class="menu-item">
								<a href="#">Sign In</a>
							</li>
							<li class="menu-item">
								<a href="#">View Cart</a>
							</li>
							
						</ul>
					</div>

				</div>
				<div class="col-md-2">

					<div class="footer-menu">
						<h5>Help</h5>
						<ul class="menu-list">
							<li class="menu-item">
								<a href="#">Help center</a>
							</li>
							
							<li class="menu-item">
								<a href="#">Contact us</a>
							</li>
						</ul>
					</div>

				</div>

			</div>
			<!-- / row -->

		</div>
	</footer>
	
<!-- Modal INSERT -->
<div class="modal fade" id="INSERT_ModalToggle" aria-hidden="true" aria-labelledby="login_ModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-sm ">
    <div class="modal-content border-0 ">
      <div class="modal-header border-0">
        <h1 class="login-card-description text-center w-100 " id="login_ModalToggleLabel" style="margin:0;">Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding:22px;">
      <form action="CONTROLLER_ADMIN?modpost=themsach" method="post" enctype="multipart/form-data">
        <div class="form-group mb-4">
	        <label for="masach" class="sr-only">MÃ SÁCH</label>
	        <input type="text" name="masach" id="masach" class="form-control" placeholder="Username" style="height: 45px;">
        </div>
        
        <div class="form-group mb-2">
          	<label for="tensach" class="sr-only">TÊN SÁCH</label>
        	<input type="text" name="tensach" id="tensach" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="tacgia" class="sr-only">TÁC GIẢ</label>
        	<input type="text" name="tacgia" id="tacgia" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="nxb" class="sr-only">NXB</label>
        	<input type="text" name="nxb" id="nxb" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="password_login" class="sr-only">THỂ LOẠI</label>
          	<select class="ccb-timkiem" id="idtheloai" name="idtheloai">
                <% for (int i = 0; i < listTheloai.size(); i++) { %>
                    <option class="btn-wrap" value="<%= listTheloai.get(i).getIdtheloai() %>"><%= listTheloai.get(i).getTentheloai() %></option>
                <% } %>
            </select>
        </div>
        
         <div class="form-group mb-2">
          	<label for="giaban" class="sr-only"GIÁ BÁN></label>
        	<input type="text" name="giaban" id="giaban" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="soluongtong" class="sr-only">SỐ LƯỢNG TỔNG</label>
        	<input type="text" name="soluongtong" id="soluongtong" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="giamgia" class="sr-only">GIẢM GIÁ</label>
        	<input type="text" name="giamgia" id="giamgia" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="mota" class="sr-only">MÔ TẢ</label>
        	<input type="text" name="mota" id="mota" class="form-control" placeholder="Password" style="height: 45px;">
        </div>
        
         <div class="form-group mb-2">
          	<label for="fileanh" class="sr-only">ẢNH</label>
        	<input type="file" name="fileanh" id="fileanh" class="form-control" accept="image/*">
        </div>
        
        
        
        
        
        
       <button type="submit" name ="login" class="btn btn-primary d-block mx-auto mb-0" style=" border-radius: 18px; width: -webkit-fill-available; height: 45px; ">Login</button>
      </form>
      </div>
      <div class="modal-footer border-0"  style=" padding-top: 0; padding:22px;">
        <p class="login-card-footer-text mb-0">Don't have an account? <a href="#" data-bs-target="#signup_ModalToggle" data-bs-toggle="modal" class="text-reset">Register here</a></p>
      </div>
    </div>
  </div>
</div>




	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>

</html>