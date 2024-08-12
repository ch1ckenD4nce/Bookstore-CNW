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
        ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
        ArrayList<SACH> listBook = (ArrayList<SACH>) request.getAttribute("listBook");
        ArrayList<SACH> listFeaturedBook = (ArrayList<SACH>) request.getAttribute("listFeaturedBook");
        ArrayList<SACH> listBookOffer = (ArrayList<SACH>) request.getAttribute("listBookOffer");
        ArrayList<SACH> listBookNewAuthor = (ArrayList<SACH>) request.getAttribute("listBookNewAuthor");
        SACH book_bestselling = (SACH) request.getAttribute("book_bestselling");
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
							<a href="CONTROLLER_USER?modget=order" class="user-account for-buy"><i
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
										
										<li class="menu-item"><a href="#featured-books" class="nav-link">Featured</a></li>
										<li class="menu-item"><a href="#popular-books" class="nav-link">Popular</a></li>
										<li class="menu-item"><a href="#special-offer" class="nav-link">Offer</a></li>
										<li class="menu-item"><a href="#author" class="nav-link">Author</a></li>
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

	<section id="billboard">

		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<button class="prev slick-arrow">
						<i class="icon icon-arrow-left"></i>
					</button>

					<div class="main-slider pattern-overlay">
						<% for (int i = 0; i < listBook.size(); i++) { %>
		                    <div class="slider-item">
								<div class="banner-content">
									<h2 class="banner-title"><%= listBook.get(i).getTenSach() %></h2>
									<p>
					                    <% 
					                        String moTa = listBook.get(i).getMoTa();
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
										<a href="CONTROLLER_USER?modget=view&masach=<%=listBook.get(i).getMaSach() %>" class="btn btn-outline-accent btn-accent-arrow">Shop it now<i
												class="icon icon-ns-arrow-right"></i></a>
									</div>
								</div><!--banner-content-->
								<img src="image_book/<%=listBook.get(i).getTenAnh() %>" alt="banner" class="banner-image"  style="width: 450px; height: 550px;">
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

						<% for (int i = 0; i < listFeaturedBook.size(); i++) { %>
							<div class="col-md-3">
								<div class="product-item">
									<figure class="product-style">
										<img src="image_book/<%= listFeaturedBook.get(i).getTenAnh()%>" alt="Books" class="product-item" style="width: 344px; height: 418px;">
										<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= listFeaturedBook.get(i).getMaSach()%>')">Add to Cart</button>
									
									</figure>
									<figcaption>
										<h3><a href="CONTROLLER_USER?modget=view&masach=<%= listFeaturedBook.get(i).getMaSach()%>"><%= listFeaturedBook.get(i).getTenSach()%></a></h3>
											
										<span><%= listFeaturedBook.get(i).getTacGia() %></span>
										
										
										<% if(listFeaturedBook.get(i).getGiamGia() != 0) { %>
										<div><span><b>Sale off <%= listFeaturedBook.get(i).getGiamGia()%>%</b></span></div>
										<% } %>
										
										<% if(listFeaturedBook.get(i).getGiaUuDai() == listFeaturedBook.get(i).getGiaBan()) {%>
										<div class="item-price"><%= listFeaturedBook.get(i).getGiaBan()%></div>
										<% } else { %>
										<div class="item-price"><span class="prev-price"><%= listFeaturedBook.get(i).getGiaBan()%></span><%= listFeaturedBook.get(i).getGiaUuDai()%></div>
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
						<a href="CONTROLLER_USER?modget=viewall" class="btn-accent-arrow">View all products <i
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
								<img src="image_book/<%= book_bestselling.getTenAnh()%>" alt="book" class="single-image">
							</figure>
						</div>

						<div class="col-md-6">
							<div class="product-entry">
								<h2 class="section-title divider">Best Selling Book</h2>

								<div class="products-content">
									<div class="author-name">By <%= book_bestselling.getTacGia() %></div>
									<h3 class="item-title"><%= book_bestselling.getTenSach() %></h3>
									<p>
										<% 
					                        String moTa = book_bestselling.getMoTa();
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
									
									<% if(book_bestselling.getGiamGia() != 0) { %>
									<div><span><b>Sale off <%= book_bestselling.getGiamGia()%>%</b></span></div>
									<% } %>
									
									<% if(book_bestselling.getGiaUuDai() == book_bestselling.getGiaBan()) {%>
									<div class="item-price"><%= book_bestselling.getGiaBan()%></div>
									<% } else { %>
									<div class="item-price"><span class="prev-price"><%= book_bestselling.getGiaBan()%></span><%= book_bestselling.getGiaUuDai()%></div>
									<% } %>
									
									<div class="btn-wrap">
										<a href="CONTROLLER_USER?modget=view&masach=<%= book_bestselling.getMaSach()%>" class="btn-accent-arrow" a>shop it now <i
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
						<li data-tab-target="#user<%= listTheloai.get(0).getIdtheloai()%>" class="active tab"><%= listTheloai.get(0).getTentheloai() %></li>
								
						<% for(int i = 1; i < listTheloai.size(); i++) {%>
						<li data-tab-target="#user<%= listTheloai.get(i).getIdtheloai()%>" class="tab"><%= listTheloai.get(i).getTentheloai() %></li>
						<% } %>
					</ul>

					<div class="tab-content">
						<div id="user<%= listTheloai.get(0).getIdtheloai()%>" data-tab-content class="active">
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
												<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= list0.get(j).getMaSach()%>')">Add to Cart</button>
										
													
											</figure>
											<figcaption>
												<h3><a href="CONTROLLER_USER?modget=view&masach=<%= list0.get(j).getMaSach()%>"><%= list0.get(j).getTenSach()%></a></h3>
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
							<div id="user<%= listTheloai.get(i).getIdtheloai()%>" data-tab-content>
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
												
													<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= list.get(j).getMaSach()%>')">Add to Cart</button>
										
												</figure>
												<figcaption>
													<h3><a href="CONTROLLER_USER?modget=view&masach=<%= list.get(j).getMaSach()%>"><%= list.get(j).getTenSach()%></a></h3>
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
										
										<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= listBookOffer.get(i).getMaSach()%>')">Add to Cart</button>
										
								</figure>
								<figcaption>
									<h3><a href="CONTROLLER_USER?modget=view&masach=<%= listBookOffer.get(i).getMaSach()%>"><%= listBookOffer.get(i).getTenSach()%></a></h3>
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
											
											
										<button type="button" class="add-to-cart" data-product-tile="add-to-cart"  onclick="view('<%= listBookNewAuthor.get(i).getMaSach()%>')">Add to Cart</button>
										
									</figure>
									<figcaption>
										<h3><a href="CONTROLLER_USER?modget=view&masach=<%= listBookNewAuthor.get(i).getMaSach()%>"><%= listBookNewAuthor.get(i).getTenSach()%></a></h3>
														
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



<div class="modal fade" id="cart_ModalToggle" aria-hidden="true" aria-labelledby="cart_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg modal-md modal-dialog-centered">
      <div class="modal-content border-0">
        <div class="modal-header border-0"  style="padding-bottom: 0;">
        	<h1 class="modal-title fs-5 fw-bolder text-center" style=" margin-left: auto;">Shopping Cart</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body ">
              <div class="mini-cart cart-list p-0 mt-3 border-0">
                <div class="mini-cart-item d-flex  pb-3 " >
                  <div class="col-lg-2 col-md-3 col-sm-2 me-4">
                    <a href="#" title="product-image">
                      <img src="images/product-item4.jpg" class="img-fluid" alt="single-product-item" style="max-width: 75%; margin-left: 20px;">
                    </a>
                  </div>
                  <div class="col-lg-9 col-md-8 col-sm-8 ">
                 <div class="product-header d-flex justify-content-between align-items-center mb-3">
					  <h2 class="product-title fs-6 me-5 fw-bolder">Simple way of piece life</h2>
					  <button type="button" class="btn btn-outline-danger br border-0" aria-label="remove_product"
					          data-product_id="11913" data-cart_item_key="abc" data-product_sku="" style="margin: 0;">
					    X
					  </button>
					</div>
                 
                    <div class="quantity-price d-flex justify-content-between align-items-center" >
                   
                       <div id="price-code">
                        <span class="product-price fs-6" style="margin-left: 20px; margin-right: 130px;">$1199.000</span>
                      </div>
                      
                      <div class="input-group product-qty">
					    <button type="button" class="btn btn-light rounded-0 rounded-start btn-number" data-type="minus" onclick="decrementValue()" style="margin: 0;height: fit-content;">-</button>
					   <input type="number" name="quantity" class="form-control input-number quantity" value="1" min="1" id="quantity" style="margin: 0; height: fit-content;">
					    <button type="button" class="btn btn-light rounded-0 rounded-end btn-number" data-type="plus" onclick="incrementValue()"  style="margin: 0;height: fit-content;">+</button>
					  </div>
                      
                      	<div id="price-code" style=" margin-left: 130px; margin-right: 20px;">
                        <span class="product-price fs-6">$1198.000</span>
                      </div>
                     
                    </div>
                    <!-- quantity-price -->
                  </div>
                </div>
               
              </div>
           
              <!-- cart-list -->
              
              <div class="modal-footer justify-content-center border-0">
                <button type="submit" class="btn btn-primary d-block mx-auto mb-0" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="border-radius: 20px;height: 45px;width: 200px;">Continue Shopping</button>
                <button type="submit"
                  class="btn btn-primary d-block mx-auto mb-0"  style="border-radius: 20px;height: 45px;width: 200px;">Add to cart</button>
              </div>
            </div>
         
      </div>
    </div>
  </div>
  <!-- cart view -->




<script>
  function incrementValue() {
    var value = parseInt(document.getElementById('quantity').value, 10);
    value = isNaN(value) ? 1 : value;
    value++;
    document.getElementById('quantity').value = value;
  }

  function decrementValue() {
    var value = parseInt(document.getElementById('quantity').value, 10);
    value = isNaN(value) ? 1 : value;
    value = value <= 1 ? 1 : value - 1;
    document.getElementById('quantity').value = value;
  }
</script>



	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>

</html>