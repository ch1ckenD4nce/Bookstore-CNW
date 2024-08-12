<%@page import="model.BEAN.KHACHHANG"%>
<%@page import="model.BEAN.CHITIETDONHANG"%>
<%@page import="model.BEAN.DONHANG"%>
<%@page import="model.BEAN.THELOAI"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Test Don Hang _admin</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="description" content="">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/normalize.css">
	<link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
	<link rel="stylesheet" type="text/css" href="css/vendor.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	
	<script>
	function viewDetail(param) {
	  window.location.href = 'CONTROLLER_USER?modget=viewOrder&madonhang=' + param;
	}
	</script>


</head>


 


<body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">
	<%
        request.setCharacterEncoding("UTF-8");
        ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
        ArrayList<DONHANG> listOrder_confirm = (ArrayList<DONHANG>) request.getAttribute("listOrder_confirm");
        ArrayList<DONHANG> listOrder_completed = (ArrayList<DONHANG>) request.getAttribute("listOrder_completed");
        ArrayList<DONHANG> listOrder_can = (ArrayList<DONHANG>) request.getAttribute("listOrder_can");
		String nameUser = (String) session.getAttribute("nameUser");
		int idtheloai = (int) session.getAttribute("idtheloai_admin");
		int SoluongGioHang = (int) request.getAttribute("SoluongGioHang");
		
		
		// order detail
		DONHANG order = (DONHANG) request.getAttribute("order");
		ArrayList<CHITIETDONHANG> orderdetail = (ArrayList<CHITIETDONHANG>) request.getAttribute("orderdetail");
		KHACHHANG khhang = (KHACHHANG) request.getAttribute("khhang");
		
		// total
		float fee = 30000;
		float subtotal = (float) request.getAttribute("subtotal");
		
		float totalamount = (float) request.getAttribute("totalamount");
    %>

	<div id="header-wrap">

		<div class="top-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						
					</div>
					<div class="col-md-6">
						<div class="right-element">
							<a href="CONTROLLER_USER?modpost=order" class="user-account for-buy"><i
									class="icon icon-user"></i><span><%= nameUser %></span></a>
							<a href="CONTROLLER_ADMIN?modget=logout" class=""><i class=""></i><span>Logout
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
	
	
	

   

	<h2 class="fw-bolder text-center">My Orders</h2>

		<ul class="tabs mb-1 mt-2">
			<li data-tab-target="#confirm" <% if (session.getAttribute("selectOrder").equals("confirm")) { %> class="active tab" <% } else { %> class="tab" <% } %> >To Confirm</li>
			
			<li data-tab-target="#completed" <% if (session.getAttribute("selectOrder").equals("completed")) { %> class="active tab" <% } else { %> class="tab" <% } %>>Completed</li>
			<li data-tab-target="#cancelled" <% if (session.getAttribute("selectOrder").equals("cancelled")) { %> class="active tab" <% } else { %> class="tab" <% } %>>Cancelled</li>
			
		</ul>


		<div id="confirm" data-tab-content <% if (session.getAttribute("selectOrder").equals("confirm")) { %> class="active" <% } %>>
		 <% for (int i = 0; i < listOrder_confirm.size() ; i++) {  %>
			<% 
				String name = "listOrder_" + listOrder_confirm.get(i).getMaDonHang();
			 	ArrayList<CHITIETDONHANG> listOrderDetail_confirm = (ArrayList<CHITIETDONHANG>) request.getAttribute(name);		
			 	String nameTotal = "total_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				int total_confirm = (int) request.getAttribute(nameTotal);		
				String nameamountTotal = "tamount_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm = (float) request.getAttribute(nameamountTotal);
				
			%>
			  <table style="width: 800px; background-color: white;border-radius:15px;" class="mb-3">
			    <tr >
			      <td style="padding-bottom:0px;" >
			      
			      
			      <div class=" d-flex justify-content-between " >
	                    <div class="ms-3 pb-0">Bill Code: <%= listOrder_confirm.get(i).getMaDonHang() %></div>
	                    <div class="ms-5 pb-0 me-4 ">Customer Code: <%= listOrder_confirm.get(i).getMaKhachHang() %></div>
	                   
		           </div>
			      
			      
			      </td>
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		
			      		<div class="mini-cart-item d-flex " >
		                  <div class="col-lg-2 col-md-3 col-sm-2 me-4 mb-2">
		                    <a href="#" title="product-image">
		                      <img src="image_book/<%= listOrderDetail_confirm.get(0).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 40%; margin-left: 20px;">
		                    </a>
		                  </div>
		                  <div class="col-lg-9 col-md-8 col-sm-8 ">
		                 <div class="product-header d-flex justify-content	-between align-items-center mb-3">
							  <h2 class="product-title fs-6 me-5 fw-bolder" style="margin:0;"><%= listOrderDetail_confirm.get(0).getTenSach() %></h2>
							  
							</div>
		                 
		                    <div class="quantity-price d-flex justify-content-between align-items-center" >
		                   
		                       <div id="price-code">
		                        <h4> <strong class="mx-2">x</strong> <%= listOrderDetail_confirm.get(0).getSoLuong() %></h4>
		                       
		                      </div>
		                      
		                      
		                      	<div id="price-code" style=" margin-left: 130px; margin-right: 20px;">
		                        <span class="product-price fs-6"><%= listOrderDetail_confirm.get(0).getGiaBan() %></span>
		                      </div>
		                     
		                    </div>
		                    <!-- quantity-price -->
		                  </div>
		               </div>
						
									      
			      	</td>
			   	 </tr>
			   	 <tr >
			      
			       <td style="padding-bottom:0px;" >
			       
			       		<div class=" d-flex justify-content-between align-items-center" >
		                      <div class="ms-3 pb-0"><%= total_confirm  %> item</div>
		                      	
		                      <div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal_confirm %></div>
		                     
		                 </div>
			       </td>
			      
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		<button class="btn btn-primary mt-0 mb-3 float-end me-4"  style="border-radius: 18px;height: 40px;width: 120px;"  onclick="viewDetail('<%=listOrder_confirm.get(i).getMaDonHang()%>')">View Detail</button>
			     
			      </td>
			    </tr>
			  </table>
			  <%} %>
 
			  
		</div>
		
		
		
		<div id="completed" data-tab-content <% if (session.getAttribute("selectOrder").equals("completed")) { %> class="active" <% } %>>
		 <% for (int i = 0; i < listOrder_completed.size(); i++) { %>
			<% 
				String name = "listOrderCompleted_" + listOrder_completed.get(i).getMaDonHang();
			 	ArrayList<CHITIETDONHANG> listOrderDetail_completed = (ArrayList<CHITIETDONHANG>) request.getAttribute(name);	
			 	String nameTotal = "total_completed_" + listOrder_completed.get(i).getMaDonHang();
				int total = (int) request.getAttribute(nameTotal);		
				String nameamountTotal = "tamount_completed_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal = (float) request.getAttribute(nameamountTotal);
			%>
			  <table style="width: 800px; background-color: white;border-radius:15px;" class="mb-3">
			    <tr >
			      <td style="padding-bottom:0px;" >
			      
			      
			      <div class=" d-flex justify-content-between " >
	                    <div class="ms-3 pb-0">Bill Code: <%= listOrder_completed.get(i).getMaDonHang() %></div>
	                    <div class="ms-5 pb-0 me-4 ">Customer Code: <%= listOrder_completed.get(i).getMaKhachHang() %></div>
	                   
		           </div>
			      
			      
			      </td>
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		
			      		<div class="mini-cart-item d-flex " >
		                  <div class="col-lg-2 col-md-3 col-sm-2 me-4 mb-2">
		                    <a href="#" title="product-image">
		                      <img src="image_book/<%= listOrderDetail_completed.get(0).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 40%; margin-left: 20px;">
		                    </a>
		                  </div>
		                  <div class="col-lg-9 col-md-8 col-sm-8 ">
		                 <div class="product-header d-flex justify-content-between align-items-center mb-3">
							  <h2 class="product-title fs-6 me-5 fw-bolder" style="margin:0;"><%= listOrderDetail_completed.get(0).getTenSach() %></h2>
							  
							</div>
		                 
		                    <div class="quantity-price d-flex justify-content-between align-items-center" >
		                   
		                       <div id="price-code">
		                        <h4> <strong class="mx-2">x</strong> <%= listOrderDetail_completed.get(0).getSoLuong() %></h4>
		                       
		                      </div>
		                      
		                      
		                      	<div id="price-code" style=" margin-left: 130px; margin-right: 20px;">
		                        <span class="product-price fs-6"><%= listOrderDetail_completed.get(0).getGiaBan() %></span>
		                      </div>
		                     
		                    </div>
		                    <!-- quantity-price -->
		                  </div>
		               </div>
						
									      
			      	</td>
			   	 </tr>
			   	 <tr >
			      
			       <td style="padding-bottom:0px;" >
			       
			       		<div class=" d-flex justify-content-between align-items-center" >
		                      <div class="ms-3 pb-0"><%= total %> item</div>
		                      	
		                      <div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal %></div>
		                     
		                 </div>
			       </td>
			      
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		<button class="btn btn-primary mt-0 mb-3 float-end me-4"  style="border-radius: 18px;height: 40px;width: 120px;"  onclick="viewDetail('<%=listOrder_completed.get(i).getMaDonHang()%>')">View Detail</button>
			     
			      </td>
			    </tr>
			  </table>
			  <%} %>
 
			  
		</div>
		
		<div id="cancelled" data-tab-content <% if (session.getAttribute("selectOrder").equals("cancelled")) { %> class="active" <% } %>>
		 <% for (int i = 0; i < listOrder_can.size(); i++) { %>
		 	<% 
				String name = "listOrderCan_" + listOrder_can.get(i).getMaDonHang();
			 	ArrayList<CHITIETDONHANG> listOrderDetail_can = (ArrayList<CHITIETDONHANG>) request.getAttribute(name);
			 	String nameTotal = "total_can_" + listOrder_can.get(i).getMaDonHang();
				int total = (int) request.getAttribute(nameTotal);		
				String nameamountTotal = "tamount_can_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal = (float) request.getAttribute(nameamountTotal);
			%>
			  <table style="width: 800px; background-color: white;border-radius:15px;" class="mb-3">
			    <tr >
			      <td style="padding-bottom:0px;" >
			      
			      
			      <div class=" d-flex justify-content-between " >
	                    <div class="ms-3 pb-0">Bill Code: <%= listOrder_can.get(i).getMaDonHang() %></div>
	                    <div class="ms-5 pb-0 me-4 ">Customer Code: <%= listOrder_can.get(i).getMaDonHang() %></div>
	                   
		           </div>
			      
			      
			      </td>
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		
			      		<div class="mini-cart-item d-flex " >
		                  <div class="col-lg-2 col-md-3 col-sm-2 me-4 mb-2">
		                    <a href="#" title="product-image">
		                      <img src="image_book/<%= listOrderDetail_can.get(0).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 40%; margin-left: 20px;">
		                    </a>
		                  </div>
		                  <div class="col-lg-9 col-md-8 col-sm-8 ">
		                 <div class="product-header d-flex justify-content-between align-items-center mb-3">
							  <h2 class="product-title fs-6 me-5 fw-bolder" style="margin:0;"><%= listOrderDetail_can.get(0).getTenSach() %></h2>
							  
							</div>
		                 
		                    <div class="quantity-price d-flex justify-content-between align-items-center" >
		                   
		                       <div id="price-code">
		                        <h4> <strong class="mx-2">x</strong> <%= listOrderDetail_can.get(0).getSoLuong() %></h4>
		                       
		                      </div>
		                      
		                      
		                      	<div id="price-code" style=" margin-left: 130px; margin-right: 20px;">
		                        <span class="product-price fs-6"><%= listOrderDetail_can.get(0).getGiaBan() %></span>
		                      </div>
		                     
		                    </div>
		                    <!-- quantity-price -->
		                  </div>
		               </div>
						
									      
			      	</td>
			   	 </tr>
			   	 <tr >
			      
			       <td style="padding-bottom:0px;" >
			       
			       		<div class=" d-flex justify-content-between align-items-center" >
		                      <div class="ms-3 pb-0"><%= total %> item</div>
		                      	
		                      <div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal %></div>
		                     
		                 </div>
			       </td>
			      
			    </tr>
			    <tr>
			      <td style="padding-bottom:0px;" >
			      		<button class="btn btn-primary mt-0 mb-3 float-end me-4"  style="border-radius: 18px;height: 40px;width: 120px;"  onclick="viewDetail('<%=listOrder_can.get(i).getMaDonHang()%>')">View Detail</button>
			     
			      </td>
			    </tr>
			  </table>
			  <%} %>
 
			  
		</div>



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
<% if (order != null) { %>
  <script>
    // Thêm mã JavaScript để mở modal login khi có lỗi
    $(document).ready(function(){
      $('#detail_Bill_Confirm_ModalToggle').modal('show');
    });
  </script>
<% } %>
	
	
<div class="modal fade" id="detail_Bill_Confirm_ModalToggle" aria-hidden="true" aria-labelledby="detail_Bill_Confirm_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg modal-md modal-dialog-centered mb-3">
		<div class="modal-content border-0 mb-3">
	        <div class="modal-header border-0"  style="padding-bottom: 0;">
	        	<h1 class="modal-title fs-5 fw-bolder text-center" style=" margin-left: auto;">My Order</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body ">
	        		<table class="table site-block-order-table mb-2 table-hover">
                    <thead>
                     <th class="ms-3 ms-lg-4 ps-lg-4">Image</th>
                    
                      <th>Product</th>
                      <th>Price</th>
                    </thead>
                    <tbody class="table-group-divider">
                   <% for (int j = 0; j < orderdetail.size(); j++) { %>
                      <tr>
                      
                       <td class="product-thumnail">
	                          <div class=" col-lg-2 me-1 ms-lg-3 ps-lg-3">

			                    <a href="#" title="product-image">
			                      <img src="image_book/<%= orderdetail.get(j).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 50px;">
			                    </a>
			                  </div>
                           
                       </td>
                       
                       <td><h4><%= orderdetail.get(j).getTenSach()%><strong class="mx-2">x</strong> <%= orderdetail.get(j).getSoLuong()%></h4></td>
                       <td><h4><%= orderdetail.get(j).getGiaBan()%></h4></td>
                     
                      </tr>
                      <%} %>
                     <tr>
 						 <td colspan="3"><div class="ms-3">Bill Code: <%= orderdetail.get(0).getMaDonHang() %> </div></td>
					</tr>
                      
                      
                      
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold text-end"><strong>Cart Subtotal</strong></td>
                        <td class="text-black"><%= totalamount %></td>
                      </tr>
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold text-end"><strong>Shipping Fee</strong></td>
                        <td class="text-black">30000</td>
                      </tr>
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold text-end "><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong><%= totalamount + 30000 %></strong></td>
                      </tr>
                     
                    </tbody>
                  </table>
                  
                
				<div class="row mb-3">
				  <div class="col-md-6 mx-auto d-flex justify-content-center">
				    <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" style="border-radius: 22px; height: 45px; width: 200px;">Continue Shopping</button>
				  </div>
				  
				</div>

	     

   
			</div>
		</div>
  </div>
</div>





<div class="modal fade" id="detail_Bill_ModalToggle" aria-hidden="true" aria-labelledby="detail_Bill_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg modal-md modal-dialog-centered mb-3">
		<div class="modal-content border-0 mb-3">
	        <div class="modal-header border-0"  style="padding-bottom: 0;">
	        	<h1 class="modal-title fs-5 fw-bolder text-center" style=" margin-left: auto;">My Order</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body ">
	        		<table class="table site-block-order-table mb-2 table-hover">
                    <thead>
                     <th class="ms-3 ms-lg-4 ps-lg-4">Image</th>
                    
                      <th>Product</th>
                      <th>Price</th>
                    </thead>
                    <tbody class="table-group-divider">
                   <% for (int j = 0; j < orderdetail.size(); j++) { %>
                      <tr>
                      
                       <td class="product-thumnail">
	                          <div class=" col-lg-2 me-1 ms-lg-3 ps-lg-3">

			                    <a href="#" title="product-image">
			                      <img src="image_book/<%= orderdetail.get(j).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 50px;">
			                    </a>
			                  </div>
                           
                       </td>
                       
                       <td><h4><%= orderdetail.get(j).getTenSach()%><strong class="mx-2">x</strong> 1</h4></td>
                       <td><h4><%= orderdetail.get(j).getGiaBan()%></h4></td>
                     
                      </tr>
                      <%} %>
                     <tr>
 						 <td colspan="3"><div class="ms-3">Bill Code: <%= orderdetail.get(0).getMaDonHang() %> </div></td>
					</tr>

                       <tr>
                      	<td colspan="3" ><div class="ms-3">Date Order: 22:30 PM 22/5/2002</div></td>
                      	
                      </tr>
                      
                      
                      
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold text-end"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">$350.00</td>
                      </tr>
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold text-end"><strong>Shipping Fee</strong></td>
                        <td class="text-black">$30.00</td>
                      </tr>
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold text-end "><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>$380.00</strong></td>
                      </tr>
                     
                    </tbody>
                  </table>
                  
                
				<div class="row mb-3">
				  <div class="col-md-6 mx-auto d-flex justify-content-center">
				    <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" style="border-radius: 22px; height: 45px; width: 200px;">Continue Shopping</button>
				  </div>
				  
				</div>

	     

   
			</div>
		</div>
  </div>
</div>
	
	
	

</script>


	<script src="js/jquery-1.11.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<script src="js/plugins.js"></script>
	<script src="js/script.js"></script>

</body>

</html>