<%@page import="model.BEAN.TACGIA"%>
<%@page import="model.BEAN.THELOAI"%>
<%@page import="model.BEAN.SACH"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>USER_bookgenre</title>
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
        function view(param) {
        	  window.location.href = 'CONTROLLER_USER?modget=view&masach=' + param;
        	}
    </script>
</head>

<body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
	<%
        request.setCharacterEncoding("UTF-8");
        ArrayList<SACH> listBook = (ArrayList<SACH>) request.getAttribute("listBook");
        ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
        ArrayList<TACGIA> listTacgia = (ArrayList<TACGIA>) request.getAttribute("listTacgia");
		String tentheloai = (String) session.getAttribute("tentheloai");
		String nameUser = (String) session.getAttribute("nameUser");
		int SoluongGioHang = (int) request.getAttribute("SoluongGioHang");
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
							<a href="CONTROLLER_USER?modget=logout" class="me-5"><i class=""></i><span>Logout
									</span></a>
							
						</div><!--top-right-->
					</div>

				</div>
			</div>
		</div><!--top-content-->
		<form id="myForm" action="CONTROLLER_USER?modpost=select" method="POST" accept-charset="UTF-8">
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
										<li class="menu-item active"><a href="CONTROLLER_USER?modget=home">Home</a></li>
									
										<li class="menu-item"><a href="CONTROLLER_USER?modget=home#featured-books" class="nav-link">Featured</a></li>
										<li class="menu-item"><a href="CONTROLLER_USER?modget=home#popular-books" class="nav-link">Popular</a></li>
										<li class="menu-item"><a href="CONTROLLER_USER?modget=home#special-offer" class="nav-link">Offer</a></li>
										<li class="menu-item"><a href="CONTROLLER_USER?modget=home#author" class="nav-link">Author</a></li>
											
										
										<li class="menu-item">
											<a href="CONTROLLER_USER?modpost=giohang" class="cart for-buy"><i class="bi-cart-fill me-1"><span><%= SoluongGioHang %></span></i></a>
										</li>
										
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

	

	


	<section id="popular-books" class="bookshelf py-5 my-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="section-header align-center">
						<div class="title">
							<span>Found items</span>
						</div>
						
					</div>


					<div class="tab-content">
						<h2 class="fw-bolder mb-4"><%= tentheloai%></h2>
						
						<% if( listBook.size() == 0) { %>
						<h4 class="fw-bolder mb-4">Result: Not Found Items!</h4>
						<% } %>
						<div id="all-genre" data-tab-content class="active">
							<div class="row">
								<% if(listBook != null) { %>
								<% for (int i = 0; i < listBook.size(); i++) { %>
									<div class="col-md-3">
										<div class="product-item">
											<figure class="product-style">
												<img src="image_book/<%= listBook.get(i).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
												
												<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= listBook.get(i).getMaSach()%>')">Add to Cart</button>
										
											</figure>
											<figcaption>
												<h3><a href="CONTROLLER_USER?modget=view&masach=<%= listBook.get(i).getMaSach()%>"><%= listBook.get(i).getTenSach()%></a></h3>
						
												<span><%= listBook.get(i).getTacGia() %></span>
												
												<% if(listBook.get(i).getGiamGia() != 0) { %>
												<div><span><b>Sale off <%= listBook.get(i).getGiamGia()%>%</b></span></div>
												<% } %>
												
												<% if(listBook.get(i).getGiaUuDai() == listBook.get(i).getGiaBan()) {%>
												<div class="item-price"><%= listBook.get(i).getGiaBan()%></div>
												<% } else { %>
												<div class="item-price"><span class="prev-price"><%= listBook.get(i).getGiaBan()%></span><%= listBook.get(i).getGiaUuDai()%></div>
												<% } %>
												
												
											</figcaption>
										</div>
									</div>
								 <% } %>
								 <% } %>
							</div>
						</div>
					</div>

				</div><!--inner-tabs-->

			</div>
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




	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>

</html>