<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="model.BEAN.GIOHANG"%>
<%@page import="model.BEAN.THELOAI"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<title>User Cart</title>
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
	
	


</head>

<% ArrayList<GIOHANG> xacnhan = (ArrayList<GIOHANG>)request.getAttribute("xacnhandonhang"); %>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Thêm mã này dưới form login -->
<% if (xacnhan.size() != 0) { %>
  <script>
    // Thêm mã JavaScript để mở modal login khi có lỗi
    $(document).ready(function(){
      $('#order_ModalToggle').modal('show');
    });
  </script>
<% } %>

<%
String nameUser = (String) session.getAttribute("nameUser");
ArrayList<THELOAI> listTheloai = (ArrayList<THELOAI>) request.getAttribute("listTheloai");
int SoluongGioHang = (int) request.getAttribute("SoluongGioHang");
%>


<body data-bs-spy="scroll" data-bs-target="#header" tabindex="0">


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

   <div class=" py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>

<div class="untree_co-section before-footer-section">
<form class="col-md-12" method="post" id="myform" acion="CONTROLLER_USER?modpost=giohang">
            <div class="container">
              <div class="row mb-0">
                
                  <div class="site-blocks-table">
                  <table class="table table-hover">
					  <thead>
					    <tr>
					      <th class="col product-selection" style="padding-left: 25px;">Select</th>
					      <th class="col product-thumbnail" style="padding-left: 25px;">Image</th>
					      <th class="col product-name">Product</th>
					      <th class="col product-price">Price</th>
					      <th class="col product-quantity">Quantity</th>
					      <th class="col product-total">Total</th>
					      <th class="col product-remove">Remove</th>
					    </tr>
					  </thead>
					  <tbody class="table-group-divider">
					    <% ArrayList<GIOHANG> giohang = (ArrayList<GIOHANG>)request.getAttribute("giohang");
					    	float sum = 0;
					    	float sumdagiam = 0;
							for(int i = 0; i < giohang.size(); i++) { %>
					    <% 
					      String idtext = (String)("quantity_sach"+i); 
					      String name = giohang.get(i).getTenSach();
					      int giasach = giohang.get(i).getGiaBan();
					      int soluong = giohang.get(i).getSoLuong();
					      int tonggia = giasach * soluong;
					      sum = sum + tonggia;
					      int giamgia = (int)giohang.get(i).getGiamGia();
					      int giasachdagiam = giasach * (100 - giamgia) / 100;
					      sumdagiam = sumdagiam + giasachdagiam * soluong;
					    %>
					    <tr>
					       <td class="product-selection text-center" style="padding-left: 25px;">
					        <input type="checkbox" name="productSelection<%= i %>" id="productSelection<%= i %>" value="<%=i %>" class="custom-checkbox"/>
					      </td>
					      <td class="product-thumbnail">
					        <div class="col-lg-2 col-md-3 col-sm-2 me-1">
					          <a href="#" title="product-image">
					            <img src="image_book/<%= giohang.get(i).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 120px; margin-left: 20px;">
					          </a>
					        </div>
					      </td>
					      <td class="product-name">
					        <h2 class="h4 text-black"><%= name %></h2>
					      </td>
					      <td>
					       <% if(giasach != giasachdagiam) { %> 
					       		<s><%=giasach %></s> 
					       <% } %>
					       
					       <%= giasachdagiam %>  
					       
					      </td>
					      <td>
					        <div class="input-group mb-3 d-flex align-items-center quantity-container" style="max-width: 120px;">
					          <button type="button" class="btn btn-light rounded-0 rounded-start btn-number" data-type="minus" onclick="decrementValue2('<%= idtext %>')" style="margin: 0;height: fit-content;">-</button>
					          <input type="text" class="form-control text-center quantity-amount" value="<%=soluong %>" name="<%= idtext %>" min="1" id="<%= idtext %>" style="margin-bottom: 0;" aria-describedby="button-addon1">
					          <div class="input-group-append">
					            <button type="button" class="btn btn-light rounded-0 rounded-end btn-number" data-type="plus" onclick="incrementValue2('<%= idtext %>')" style="margin: 0;height: fit-content;">+</button>
					          </div>
					        </div>
					      </td>
					      <td>  <%= giasachdagiam * soluong %> </td>
					      <td style="padding-top:0"><a href="CONTROLLER_USER?modpost=deleteGioHang&idsach=<%= giohang.get(i).getMaSach() %>" class="btn btn-primary btn-sm">X</a></td>
					    </tr>
					    <% } %>
					  </tbody>
					</table>

                  </div>
              </div>
        
              <div class="row">
                <div class="col-md-6">
                  <div class="row mb-5">
                    <div class="col-md-6 mb-3 mb-md-0">
                      <button name="button" value="update" class="btn btn-primary btn-sm btn-block" style="border-radius: 15px;height: 50px;width: 200px;" type="submit">Update Cart</button>
                    </div>
                    <div class="col-md-6">
                      <button type="button" onclick="redirectToHome()" class="btn btn-primary btn-sm btn-block"style="border-radius: 15px;height: 50px;width: 200px;" data-bs-dismiss="modal" aria-label="Close">Continue Shopping</button>
                    </div>
                  </div>
                 
                </div>
                <div class="col-md-6 pl-5">
                  <div class="row justify-content-end">
                    <div class="col-md-7">
                      <div class="row">
                        <div class="col-md-12 text-right border-bottom mb-5">
                          <h3 class="text-black h4 text-uppercase fw-bolder ">Cart Totals</h3>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black">Subtotal</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black"><%= sumdagiam %></strong>
                        </div>
                      </div>
                       <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black">Shipping Fee</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black">30000</strong>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col-md-6">
                          <span class="text-black">Total</span>
                        </div>
                        <div class="col-md-6 text-right">
                          <strong class="text-black"><%= sumdagiam + 30000 %></strong>
                        </div>
                      </div>
        
                      <div class="row">
                        <div class="col-md-12">
                          <button class="btn btn-primary d-block mx-auto mb-0"  style="border-radius: 15px;height: 50px;width: 200px;" type="submit"  >CONFIRM CART</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
                            </form>
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
	

	
	<!-- 
		int index = Integer.parseInt(selected[i]);
		xacnhan.add(giohang.get(index));
			if(giohang.get(i).getMaSach().equals(selected[j])) {
				xacnhan.add(giohang.get(i));
				break;
			}
			ArrayList<GIOHANG> xacnhan = (ArrayList<GIOHANG>)request.getAttribute("giohang");
	String checkboxValue = "";
	String name = "productSelection";
	for(int i = 0; i < giohang.size(); i++) {
		
		checkboxValue = request.getParameter(name + i);
		System.out.println(checkboxValue);
		if ("on".equals(checkboxValue)) {
            // Checkbox được chọn
            xacnhan.add(giohang.get(i));
        }
	}
	 -->
	
	
	<div class="modal fade" id="order_ModalToggle" aria-hidden="true" aria-labelledby="order_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg modal-md modal-dialog-centered mb-3">
		<div class="modal-content border-0 mb-3">
	        <div class="modal-header border-0"  style="padding-bottom: 0;">
	        	<h1 class="modal-title fs-5 fw-bolder text-center" style=" margin-left: auto;">Your Order</h1>
	            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <form action="CONTROLLER_USER?modpost=themdonhang" method="post">
	        	        <div class="modal-body ">
		        		<table class="table site-block-order-table mb-2 table-hover">
	                    <thead>
	                     <th class="ms-3 ms-lg-4 ps-lg-4">Image</th>
	                    
	                      <th>Product</th>
	                      <th>Total</th>
	                    </thead>
	                    <tbody class="table-group-divider">
	                    <% 
	                    	session.setAttribute("xacnhandonhang", xacnhan);
	                    	sum = 0;
	                    	sumdagiam = 0;
	                    %>
	                   <% for(int i = 0; i < xacnhan.size(); i++) { %>
	
	                   <% 
						      String idtext = (String)("quantity_sach"+i); 
						      String name = xacnhan.get(i).getTenSach();
						      float giasach = xacnhan.get(i).getGiaBan();
						      int soluong = xacnhan.get(i).getSoLuong();
						      float tonggia = giasach * soluong;
						      sum = sum + tonggia;
						      int giamgia = (int)xacnhan.get(i).getGiamGia();
						      float giasachdagiam = giasach * (100 - giamgia) / 100f;
						      sumdagiam = sumdagiam + giasachdagiam * soluong;
						%>
	                      <tr>
	                      
	                       <td class="product-thumnail">
		                          <div class=" col-lg-2 me-1 ms-lg-3 ps-lg-3">
	
				                    <a href="#" title="product-image">
				                      <img src="image_book/<%= xacnhan.get(i).getTenAnh()%>" class="img-fluid" alt="single-product-item" style="max-width: 50px;">
				                    </a>
				                  </div>
	                           
	                       </td>
	                       
	                       <td><h4><%=name %> <strong class="mx-2">x</strong> <%=soluong %> </h4></td>
	                       <td><h4> 
		                       <% if(giasach != giasachdagiam) { %> 
						       		<s><%=giasach %></s> 
						       <% }%>
						       
						       <%= giasachdagiam %>  
	                       
	                       </h4></td>
	                     
	                      </tr>
	                      <%} %>
	                     	 <tr>
	                      <td></td>
	                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
	                        <td class="text-black"><%= sumdagiam %></td>
	                      </tr>
	                      <tr>
	                      <td></td>
	                        <td class="text-black font-weight-bold "><strong>Shipping Fee</strong></td>
	                        <td class="text-black">30000</td>
	                      </tr>
	                      <tr>
	                      	<td></td>
	                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
	                        <td class="text-black font-weight-bold"><strong><%= sumdagiam + 30000 %></strong></td>
	                      </tr>
	                     
	                    </tbody>
	                  </table>
	                  
	                
					<div class="row mb-3"style="margin-left:120px;">
					  <div class="col-md-6 d-flex justify-content-center">
					    <button class="btn btn-primary" data-bs-dismiss="modal" aria-label="Close" style="border-radius: 22px; height: 45px; width: 150px;">Cancel Order</button>
					  </div>
					  <div class="col-md-6 d-flex justify-content-center">
					    <button type="submit"  class="btn btn-primary btn-sm" style="border-radius: 22px; height: 45px; width: 150px;">Confirm Order</button>
					  </div>
					</div>
	
		       
				</div>
	        </form>

		</div>
  </div>
</div>
	
	
	
	

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



  function incrementValue2(id) {
    var value = parseInt(document.getElementById(id).value, 10);
    value = isNaN(value) ? 1 : value;
    value++;
    document.getElementById(id).value = value;
  }

  function decrementValue2(id) {
    var value = parseInt(document.getElementById(id).value, 10);
    value = isNaN(value) ? 1 : value;
    value = value <= 1 ? 1 : value - 1;
    document.getElementById(id).value = value;
  }
  
  function redirectToHome() {
      // Thực hiện chuyển hướng bằng JavaScript
      window.location.href = "CONTROLLER_USER?modget=home"; 
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