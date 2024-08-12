<%@page import="model.BEAN.SACH"%>
<%@page import="model.BEAN.THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.StringTokenizer" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>GUEST_index</title>
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
        function redirectToLink() {
            var linkElement = document.getElementById("redirectLink");
            var targetLink = document.querySelector('.add-to-cart').getAttribute('data-target-link') || "your_default_link";
            linkElement.setAttribute("href", targetLink);
            linkElement.click();
        }

        function validateForm() {
            var hoten = document.getElementById("hoten_signup").value;
            var gioitinh = document.querySelector('input[name="gioitinh_signup"]:checked');
            var ns_signup = document.getElementById("ns_signup").value;
            var diachi = document.getElementById("diachi_signup").value;
            var sdt = document.getElementById("sdt_signup").value;
            var email = document.getElementById("email_signup").value;
            var username = document.getElementById("username_signup").value;
            var password = document.getElementById("password_signup").value;
            var re_password = document.getElementById("re_password_signup").value;

            // Kiểm tra từng trường
            if (hoten === "" || gioitinh === null || ns_signup === "" || diachi === "" || sdt === "" || email === "" || username === "" || password === "" || re_password === "") {
              alert("Vui lòng điền đầy đủ thông tin");
              return false;
            } else if (password != re_password) {
            	alert("Xác nhận mật khẩu chưa đúng");
                return false;
            }

            // Kiểm tra trường khác theo nhu cầu

            return true;
          }
    </script>
	
	
</head>

<body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
	<%
		ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
		ArrayList<SACH> listBookBanner = (ArrayList<SACH>) request.getAttribute("listBookBanner");
		ArrayList<SACH> listBookFeatured = (ArrayList<SACH>) request.getAttribute("listBookFeatured");
		ArrayList<SACH> listBookOffer = (ArrayList<SACH>) request.getAttribute("listBookOffer");
		ArrayList<SACH> listBookNewAuthor = (ArrayList<SACH>) request.getAttribute("listBookNewAuthor");
		SACH bookBestSelling = (SACH) request.getAttribute("bookBestSelling");
		String error = (String) session.getAttribute("error");
		String user_login = (String) session.getAttribute("username_login");
		String pass_login = (String) session.getAttribute("password_login");
	%>
	<div id="header-wrap">

		<div class="top-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						
					</div>
					<div class="col-md-6">
						<div class="right-element">
							
						  
							
							<a href="#" class="user-account for-buy" data-bs-target="#login_ModalToggle" data-bs-toggle="modal" ><i
									class="icon icon-user"></i><span> Account</span></a>
							
						</div><!--top-right-->
					</div>

				</div>
			</div>
		</div><!--top-content-->
		<form id="myForm" action="CONTROLLER_GUEST?modpost=select" method="POST" accept-charset="UTF-8">
			<header id="header">
				<div class="container-fluid">
					<div class="row">
	
						<div class="col-md-2">
							<div class="main-logo">
								
								<a href="CONTROLLER_GUEST?modget=index"><img src="images/logo.png" alt="logo"></a>
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
										<li class="menu-item active"><a href="CONTROLLER_GUEST?modget=index">Home</a></li>
										
										<li class="menu-item"><a href="#featured-books" class="nav-link">Featured</a></li>
										<li class="menu-item"><a href="#popular-books" class="nav-link">Popular</a></li>
										<li class="menu-item"><a href="#special-offer" class="nav-link">Offer</a></li>
										<li class="menu-item"><a href="#author" class="nav-link">Author</a></li>
										
										<li class="menu-item">
										<a href="#"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal"
										 class="cart for-buy"><i class="bi-cart-fill me-1"></i></a>
										
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

	<section id="billboard">

		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<button class="prev slick-arrow">
						<i class="icon icon-arrow-left"></i>
					</button>

					<div class="main-slider leaf-pattern-overlay">
						<% for(int i = 0; i < listBookBanner.size(); i++) {%>
							<div class="slider-item">
								<div class="banner-content">
									<h2 class="banner-title"><%= listBookBanner.get(i).getTenSach()%></h2>
									<p>
					                    <% 
					                        String moTa = listBookBanner.get(i).getMoTa();
					                        int maxWords = 30;
					                        StringTokenizer tokenizer = new StringTokenizer(moTa, " ");
					                        int wordCount = tokenizer.countTokens();
					
					                        for (int j = 0; j < Math.min(wordCount, maxWords); j++) {
					                            out.print(tokenizer.nextToken() + " ");
					                        }
					
					                        if (wordCount > maxWords) {
					                            out.print("...");
					                        }
					                    %>
					                </p>
									<div class="btn-wrap">
										<a href="#" class="btn btn-outline-accent btn-accent-arrow"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal" >Shop it now<i
												class="icon icon-ns-arrow-right"></i></a>
									</div>
								</div><!--banner-content-->
								<img src="image_book/<%= listBookBanner.get(i).getTenAnh()%>" alt="banner" class="banner-image" style="width: 450px; height: 550px;">
							</div><!--slider-item-->
						<% } %>
					</div><!--slider-->

					<button class="next slick-arrow">
						<i class="icon icon-arrow-right"></i>
					</button>

				</div>
			</div>
		</div>

	</section>

	

	<section id="featured-books" class="py-5 my-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="section-header align-center">
						<div class="title">
							<span>Some quality items</span>
						</div>
						<h2 class="section-title">Featured Books</h2>
					</div>

					<div class="product-list" data-aos="fade-up">
						<div class="row">
							<% for(int i = 0; i < listBookFeatured.size(); i++) { %>
								<div class="col-md-3">
									<div class="product-item">
										<figure class="product-style">
											<img src="image_book/<%= listBookFeatured.get(i).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
											<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal">Add to Cart</button>
										</figure>
										<figcaption>
											<h3><a href="CONTROLLER_GUEST?modget=view&masach=<%= listBookFeatured.get(i).getMaSach()%>"><%= listBookFeatured.get(i).getTenSach()%></a></h3>
											<span><%= listBookFeatured.get(i).getTacGia()%></span>
											
											<% if(listBookFeatured.get(i).getGiamGia() != 0) { %>
											<div><span><b>Sale off <%= listBookFeatured.get(i).getGiamGia()%>%</b></span></div>
											<% } %>
											
											<% if(listBookFeatured.get(i).getGiaUuDai() == listBookFeatured.get(i).getGiaBan()) {%>
											<div class="item-price"><%= listBookFeatured.get(i).getGiaBan()%></div>
											<% } else { %>
											<div class="item-price"><span class="prev-price"><%= listBookFeatured.get(i).getGiaBan()%></span><%= listBookOffer.get(i).getGiaUuDai()%></div>
											<% } %>
										</figcaption>
									</div>
								</div>
							<% } %>

						</div><!--ft-books-slider-->
					</div><!--grid-->


				</div><!--inner-content-->
			</div>

			<div class="row">
				<div class="col-md-12">

					<div class="btn-wrap align-right">
						<a href="CONTROLLER_GUEST?modget=viewall" class="btn-accent-arrow">View all products <i
								class="icon icon-ns-arrow-right"></i></a>
					</div>

				</div>
			</div>
		</div>
	</section>

	<section id="best-selling" class="leaf-pattern-overlay">
		<div class="corner-pattern-overlay"></div>
		<div class="container">
			<div class="row justify-content-center">

				<div class="col-md-8">

					<div class="row">

						<div class="col-md-6">
							<figure class="products-thumb">
								<img src="image_book/<%= bookBestSelling.getTenAnh()%>" alt="book" class="single-image">
							</figure>
						</div>

						<div class="col-md-6">
							<div class="product-entry">
								<h2 class="section-title divider">Best Selling Book</h2>

								<div class="products-content">
									<div class="author-name">By <%= bookBestSelling.getTacGia()%></div>
									<h3 class="item-title"><%= bookBestSelling.getTenSach()%></h3>
									<p>
										<% 
					                        String moTa = bookBestSelling.getMoTa();
					                        int maxWords = 30;
					                        StringTokenizer tokenizer = new StringTokenizer(moTa, " ");
					                        int wordCount = tokenizer.countTokens();
					
					                        for (int j = 0; j < Math.min(wordCount, maxWords); j++) {
					                            out.print(tokenizer.nextToken() + " ");
					                        }
					
					                        if (wordCount > maxWords) {
					                            out.print("...");
					                        }
					                    %>
									</p>
									
									<% if(bookBestSelling.getGiamGia() != 0) { %>
									<div><span><b>Sale off <%= bookBestSelling.getGiamGia()%>%</b></span></div>
									<% } %>
									
									<% if(bookBestSelling.getGiaUuDai() == bookBestSelling.getGiaBan()) {%>
									<div class="item-price"><%= bookBestSelling.getGiaBan()%></div>
									<% } else { %>
									<div class="item-price"><span class="prev-price"><%= bookBestSelling.getGiaBan()%></span><%= bookBestSelling.getGiaUuDai()%></div>
									<% } %>
									
									<div class="btn-wrap">
										<a href="#" class="btn-accent-arrow"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal">shop it now <i
												class="icon icon-ns-arrow-right"></i></a>
									</div>
								</div>

							</div>
						</div>

					</div>
					<!-- / row -->

				</div>

			</div>
		</div>
	</section>

	<section id="popular-books" class="bookshelf py-5 my-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="section-header align-center">
						<div class="title">
							<span>Some quality items</span>
						</div>
						<h2 class="section-title">Popular Books</h2>
					</div>
					
						<ul class="tabs">
								<li data-tab-target="#g<%= listTheloai.get(0).getIdtheloai()%>" class="active tab"><%= listTheloai.get(0).getTentheloai() %></li>
								
								<% for(int i = 1; i < listTheloai.size(); i++) {%>
								<li data-tab-target="#g<%= listTheloai.get(i).getIdtheloai()%>" class="tab"><%= listTheloai.get(i).getTentheloai() %></li>
								<% } %>
						</ul>
						
						<div class="tab-content">
							<div id="g<%= listTheloai.get(0).getIdtheloai()%>" data-tab-content class="active">
								<div class="row">
									<%
										String name0 = "listBook_" + listTheloai.get(0).getTentheloai();
										ArrayList<SACH> list0 = (ArrayList<SACH>) request.getAttribute(name0);
									%>
									<% for(int j = 0; j < list0.size(); j++) { %>
										<div class="col-md-3">
											<div class="product-item">
												<figure class="product-style">
													<img src="image_book/<%= list0.get(j).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
													<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal">Add to
														Cart</button>
														<a href=""></a>
												</figure>
												<figcaption>
													<h3><a href="CONTROLLER_GUEST?modget=view&masach=<%= list0.get(j).getMaSach()%>"><%= list0.get(j).getTenSach()%></a></h3>
													<span><%= list0.get(j).getTacGia()%></span>
													
													<% if(list0.get(j).getGiamGia() != 0) { %>
													<div><span><b>Sale off <%= list0.get(j).getGiamGia()%>%</b></span></div>
													<% } %>
													
													<% if(list0.get(j).getGiaUuDai() == list0.get(j).getGiaBan()) {%>
													<div class="item-price"><%= list0.get(j).getGiaBan()%></div>
													<% } else { %>
													<div class="item-price"><span class="prev-price"><%= list0.get(j).getGiaBan()%></span><%= list0.get(j).getGiaUuDai()%></div>
													<% } %>
													
												</figcaption>
											</div>
										</div>
									<% } %>
								</div>
							</div>
						
							<% for(int i = 1; i < listTheloai.size(); i++) {%>
								<div id="g<%= listTheloai.get(i).getIdtheloai()%>" data-tab-content>
									<div class="row">
										<%
											String name = "listBook_" + listTheloai.get(i).getTentheloai();
											ArrayList<SACH> list = (ArrayList<SACH>) request.getAttribute(name);
										%>
										<% for(int j = 0; j < list.size(); j++) { %>
											<div class="col-md-3">
												<div class="product-item">
													<figure class="product-style">
														<img src="image_book/<%= list.get(j).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
														<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal">Add to
															Cart</button>
													</figure>
													<figcaption>
														<h3><a href="CONTROLLER_GUEST?modget=view&masach=<%= list.get(j).getMaSach()%>"><%= list.get(j).getTenSach()%></a></h3>
														<span><%= list.get(j).getTacGia()%></span>
														
														<% if(list.get(j).getGiamGia() != 0) { %>
														<div><span><b>Sale off <%= list.get(j).getGiamGia()%>%</b></span></div>
														<% } %>
														
														<% if(list.get(j).getGiaUuDai() == list.get(j).getGiaBan()) {%>
														<div class="item-price"><%= list.get(j).getGiaBan()%></div>
														<% } else { %>
														<div class="item-price"><span class="prev-price"><%= list.get(j).getGiaBan()%></span><%= list.get(j).getGiaUuDai()%></div>
														<% } %>
														
													</figcaption>
												</div>
											</div>
										<% } %>
									</div>
								</div>
							<% } %>
						</div>
						
				</div><!--inner-tabs-->

			</div>
		</div>
	</section>

	

	<section id="special-offer" class="bookshelf pb-5 mb-5">

		<div class="section-header align-center">
			<div class="title">
				<span>Grab your opportunity</span>
			</div>
			<h2 class="section-title">Books with offer</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="inner-content">
					<div class="product-list" data-aos="fade-up">
						<div class="grid product-grid">
							<% for(int i = 0; i < listBookOffer.size(); i++) { %>
							<div class="product-item">
								<figure class="product-style">
									<img src="image_book/<%= listBookOffer.get(i).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
									<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  data-bs-target="#login_ModalToggle" data-bs-toggle="modal">Add to
										Cart</button>
								</figure>
								<figcaption>
									<h3><a href="CONTROLLER_GUEST?modget=view&masach=<%= listBookOffer.get(i).getMaSach()%>"><%= listBookOffer.get(i).getTenSach()%></a></h3>
									<span><%= listBookOffer.get(i).getTacGia()%></span>
									<% if(listBookOffer.get(i).getGiamGia() != 0) { %>
									<div><span><b>Sale off <%= listBookOffer.get(i).getGiamGia()%>%</b></span></div>
									<% } %>
									<% if(listBookOffer.get(i).getGiaBan() == listBookOffer.get(i).getGiaUuDai()) {%>
									<div class="item-price"><%= listBookOffer.get(i).getGiaBan()%></div>
									<% } else { %>
									<div class="item-price"><span class="prev-price"><%= listBookOffer.get(i).getGiaBan()%></span><%= listBookOffer.get(i).getGiaUuDai()%></div>
									<% } %>
									
								</figcaption>
							</div>
							<% } %>
						</div><!--grid-->
					</div>
				</div><!--inner-content-->
			</div>
		</div>
	</section>

	
		<section id="author" class="py-5 my-5">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="section-header align-center">
						<div class="title">
							<span>Some quality items</span>
						</div>
						<h2 class="section-title">New author</h2>
					</div>

					<div class="product-list" data-aos="fade-up">
						<div class="row">
							<% for(int i = 0; i < listBookNewAuthor.size(); i++) { %>
							<div class="col-md-3">
								<div class="product-item">
									<figure class="product-style">
										<img src="image_book/<%= listBookNewAuthor.get(i).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
										<button type="button" class="add-to-cart" data-product-tile="add-to-cart" data-bs-target="#login_ModalToggle" data-bs-toggle="modal">Add to
											Cart</button>
									</figure>
									<figcaption>
										<h3><a href="CONTROLLER_GUEST?modget=view&masach=<%= listBookNewAuthor.get(i).getMaSach()%>"><%= listBookNewAuthor.get(i).getTenSach()%></a></h3>
														
										<span><%= listBookNewAuthor.get(i).getTacGia()%></span>
										
										<% if(listBookNewAuthor.get(i).getGiamGia() != 0) { %>
										<div><span><b>Sale off <%= listBookNewAuthor.get(i).getGiamGia()%>%</b></span></div>
										<% } %>
										
										<% if(listBookNewAuthor.get(i).getGiaBan() == listBookNewAuthor.get(i).getGiaUuDai()) {%>
										<div class="item-price"><%= listBookNewAuthor.get(i).getGiaBan()%></div>
										<% } else { %>
										<div class="item-price"><span class="prev-price"><%= listBookOffer.get(i).getGiaBan()%></span><%= listBookOffer.get(i).getGiaUuDai()%></div>
										<% } %>
									</figcaption>
								</div>
							</div>
							<% } %>

						</div><!--ft-books-slider-->
					</div><!--grid-->


				</div><!--inner-content-->
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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Thêm mã này dưới form login -->
<% if (error != null && !error.isEmpty()) { %>
  <script>
    // Thêm mã JavaScript để mở modal login khi có lỗi
    $(document).ready(function(){
      $('#login_ModalToggle').modal('show');
    });
  </script>
<% } %>


<!-- Modal Login -->
<div class="modal fade" id="login_ModalToggle" aria-hidden="true" aria-labelledby="login_ModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-dialog-sm ">
    <div class="modal-content border-0 ">
      <div class="modal-header border-0">
        <h1 class="login-card-description text-center w-100 " id="login_ModalToggleLabel" style="margin:0;">Login</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding:22px;">
      <form action="CONTROLLER_GUEST?modpost=login" method="post">
        <div class="form-group mb-4">
          <label for="username_login" class="sr-only">Username</label>
          <% if(error == null) { %>
         <input type="text" name="username_login" id="username_login" class="form-control" placeholder="Username" style="height: 45px;">
          <% } else {%>
         <input type="text" name="username_login" id="username_login" class="form-control" value="<%= user_login%>" style="height: 45px;"> 	
          <% } %>
        </div>
        
        <div class="form-group mb-2">
          <label for="password_login" class="sr-only">Password</label>
         <% if(error == null) { %>
         <input type="password" name="password_login" id="password_login" class="form-control" placeholder="Password" style="height: 45px;">
         <% } else {%>
         <input type="password" name="password_login" id="password_login" class="form-control" value="<%= pass_login %>" style="height: 45px;">
         <% } %>
        </div>
        
        <% if(error != null) { %>
        <div>
          <label class="text-danger" style="font-size:smaller"><%= error %></label>
        </div>
       
        <% } %>
        <a href="#" class="forgot-password-link">Forgot password?</a>
       <button type="submit" name ="login" class="btn btn-primary d-block mx-auto mb-0" style=" border-radius: 18px; width: -webkit-fill-available; height: 45px; ">Login</button>
      </form>
      </div>
      <div class="modal-footer border-0"  style=" padding-top: 0; padding:22px;">
        <p class="login-card-footer-text mb-0">Don't have an account? <a href="#" data-bs-target="#signup_ModalToggle" data-bs-toggle="modal" class="text-reset">Register here</a></p>
      </div>
    </div>
  </div>
</div>




<!-- Modal sign up -->

<div class="modal fade" id="signup_ModalToggle" aria-hidden="true" aria-labelledby="signup_ModalToggleLabel" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 ">
      <div class="modal-header border-0 ">
        <h1 class="login-card-description text-center w-100" id="signup_ModalToggleLabel" style="margin:0;">Sign up</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body" style="padding:22px;">
        <form action="CONTROLLER_GUEST?modpost=signup" method="post" onsubmit="return validateForm()">
          <div class="form-group mb-2">
            <label for="hoten_signup" class="sr-only">Họ Tên</label>
            <input type="text" name="hoten_signup" id="hoten_signup" class="form-control" placeholder="Họ Tên" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label class="sr-only" >Giới Tính</label>
            <div class="gender-options">
              <input type="radio" name="gioitinh_signup" id="nam">
              <label for="nam">Nam</label>
              <input type="radio" name="gioitinh_signup" id="nu">
              <label for="nu">Nữ</label>
            </div>
          </div>

          <div class="form-group mb-2">
            <label for="ns_signup" class="sr-only">Ngày Sinh</label>
            <input type="date" name="ns_signup" id="ns_signup" class="form-control" style="height: 45px;">
          </div>

          <div class="form-group mb-2">
            <label for="diachi_signup" class="sr-only">Địa Chỉ</label>
            <input type="text" name="diachi_signup" id="diachi_signup" class="form-control" placeholder="Địa Chỉ" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label for="sdt_signup" class="sr-only">SDT</label>
            <input type="text" name="sdt_signup" id="sdt_signup" class="form-control" placeholder="SDT" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label for="email_signup" class="sr-only">Email</label>
            <input type="text" name="email_signup" id="email_signup" class="form-control" placeholder="Email" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label for="username_signup" class="sr-only">Username</label>
            <input type="text" name="username_signup" id="username_signup" class="form-control" placeholder="Username" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label for="password_signup" class="sr-only">Password</label>
            <input type="password" name="password_signup" id="password_signup" class="form-control" placeholder="Password" style="height: 45px; " >
          </div>

          <div class="form-group mb-2">
            <label for="re_password_signup" class="sr-only">Repeat your password</label>
            <input type="password" name="re_password_signup" id="re_password_signup" class="form-control" placeholder="Re-enter password" style="height: 45px; " >
          </div>
          <button type="submit" name="register" class="btn btn-primary d-block mx-auto mb-0" style=" border-radius: 18px; width: -webkit-fill-available; height: 45px; ">Register</button>
        </form>
      </div>
      <div class="modal-footer border-0" style=" padding-top: 0; padding:22px;">
        <p class="login-card-footer-text mb-0">Already have an account? <a href="#" data-bs-target="#login_ModalToggle" data-bs-toggle="modal" class="text-reset">Login here</a></p>
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