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
	  window.location.href = 'CONTROLLER_ADMIN?modget=viewOrder&madonhang=' + param;
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
							<a href="CONTROLLER_ADMIN?modget=logout" class=""><i class=""></i><span>Logout
									</span></a>

							
						</div><!--top-right-->
					</div>

				</div>
			</div>
		</div><!--top-content-->

		<header id="header">
			<div class="container-fluid">
				<div class="row">

					<div class="col-md-2">
						<div class="main-logo">
							
							<a href="index_user.jsp"><img src="images/logo.png" alt="logo"></a>
						</div>

					</div>

					<div class="col-md-10">

						<nav id="navbar">
							<div class="main-menu stellarnav">
								<ul class="menu-list">
									
																
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

				</div>
			</div>
		</header>

	</div><!--header-wrap-->
	
	
	

   

	<h2 class="fw-bolder text-center">Order Management</h2>

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
				String nameamountTotal2 = "tamount_confirm2_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm2 = (float) request.getAttribute(nameamountTotal2);
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
		                      	<% if(listOrderDetail_confirm.get(0).getGiaBan() == listOrderDetail_confirm.get(0).getGiaUuDai()) { %>
		                      	 	<span class="product-price fs-6"><%= listOrderDetail_confirm.get(0).getGiaBan() %></span>
		                      	<% } else { %>
		                      	 	<span class="product-price fs-6"><s><%= listOrderDetail_confirm.get(0).getGiaBan() %></s> <%= listOrderDetail_confirm.get(0).getGiaUuDai() %></span>
		                      	<% } %>
		                        
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
		                      	<% if(amountTotal_confirm == amountTotal_confirm2) { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal_confirm %></div>
		                      	<% } else { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal_confirm2 %></div>
		                      	<% } %>
		                     
		                     
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
				
				String nameamountTotal2 = "tamount_completed2_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal2 = (float) request.getAttribute(nameamountTotal2);
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
		                        
		                        <% if(listOrderDetail_completed.get(0).getGiaBan() == listOrderDetail_completed.get(0).getGiaUuDai()) { %>
		                      	 	<span class="product-price fs-6"><%= listOrderDetail_completed.get(0).getGiaBan() %></span>
		                      	<% } else { %>
		                      	 	<span class="product-price fs-6"><s><%= listOrderDetail_completed.get(0).getGiaBan() %></s> <%= listOrderDetail_completed.get(0).getGiaUuDai() %></span>
		                      	<% } %>
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
		                      
		                      <% if(amountTotal == amountTotal2) { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal %></div>
		                      	<% } else { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <s><%= amountTotal %></s> <%= amountTotal2 %></div>
		                      	<% } %>
		                     
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
				
				String nameamountTotal2 = "tamount_can2_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal2 = (float) request.getAttribute(nameamountTotal2);
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
		                         <% if(listOrderDetail_can.get(0).getGiaBan() == listOrderDetail_can.get(0).getGiaUuDai()) { %>
		                      	 	<span class="product-price fs-6"><%= listOrderDetail_can.get(0).getGiaBan() %></span>
		                      	<% } else { %>
		                      	 	<span class="product-price fs-6"><s><%= listOrderDetail_can.get(0).getGiaBan() %></s> <%= listOrderDetail_can.get(0).getGiaUuDai() %></span>
		                      	<% } %>
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
		                      	
		                      
		                      <% if(amountTotal == amountTotal2) { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <%= amountTotal %></div>
		                      	<% } else { %>
		                      	 	<div class="ms-5 pb-0 me-4"><strong class="mx-2">Order Total:</strong> <s><%= amountTotal %></s> <%= amountTotal2 %></div>
		                      	<% } %>
		                     
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
	
	
	
	
<div class="modal fade" id="detail_Bill_Confirm_ModalToggle" aria-hidden="true" aria-labelledby="detail_Bill_Confirm_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-centered mb-3">
		 <div class="site-section">
      <div class="container" style="background-color: white;">
       
        <div class="row">
        
          <div class="col-md-6 mb-5 mb-md-0 ">
            <h2 class="h3 mb-3 text-black mt-2 fw-bolder " style="position: sticky; top:30px;">Billing Details</h2>
            <div class="p-3 p-lg-5 border" style=" position: sticky; top: 70px;">
            
             <div class="form-group row">
                <div class="col-md-6">
                  <label for="maKH" class="text-black" >Customer Code </label>
                  <input type="text" class="form-control" id="maKH" name="maKH" readonly>
                </div>
                <div class="col-md-6">
                  <label for="maDH" class="text-black">Bill Code </label>
                  <input type="text" class="form-control" id="maDH" name="maDH"  readonly>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="ngayDat" class="text-black">Date Order </label>
                  <input type="text" class="form-control" id="ngayDat" name="ngayDat"  readonly>
                </div>
              </div>
            
              <div class="form-group">
                <label for="hoTen" class="text-black">Full Name </label>
                 <input type="text" class="form-control" id="hoTen" name="hoTen"  readonly>
               
              </div>
               <div class="form-group row ">
                <div class="col-md-6">
                  <label for="email" class="text-black">Email Address </label>
                  <input type="text" class="form-control" id="email" name="email"  readonly>
                </div>
                <div class="col-md-6">
                  <label for="soDT" class="text-black">Phone Number </label>
                  <input type="text" class="form-control" id="soDT" name="soDT"  readonly>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="address" class="text-black">Address </label>
                  <input type="text" class="form-control" id="address" name="address"  readonly>
                </div>
              </div>


              
            </div>
          </div>
          
          
          
          <div class="col-md-6">

        
            
            <div class="row mb-5">
              <div class="col-md-12">
              	 <div class=" d-flex justify-content-between " >
              	 	<h2 class="h3 mb-3 text-black mt-2 fw-bolder " >Order Product</h2>
              	 	
	                   
	                    <div class="ms-5 mt-2 pb-0 text-danger">*To confirm</div>
	                   
		           </div>
			      
           
              
           
              
                <div class="p-3 p-lg-5 border" style="background-color: white;">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                     <th class="ms-3">Image</th>
                    
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody class="table-group-divider">
                   <% for (int j = 0; j < 10; j++) { %>
                      <tr>
                      
                       <td class="product-thumnail">
	                          <div class="col-lg-2 col-md-3 col-sm-2 me-1">
			                    <a href="#" title="product-image">
			                      <img src="images/product-item4.jpg" class="img-fluid" alt="single-product-item" style="max-width: 50px;">
			                    </a>
			                  </div>
                           
                       </td>
                       
                       <td><h4>Simple way of piece life <strong class="mx-2">x</strong> 1</h4></td>
                       <td><h4>$250.00</h4></td>
                     
                      </tr>
                      <%} %>
                     
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">$350.00</td>
                      </tr>
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold "><strong>Shipping Fee</strong></td>
                        <td class="text-black">$30.00</td>
                      </tr>
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>$380.00</strong></td>
                      </tr>
                    </tbody>
                  </table>

       
                  <div class="row mb-5">
                    <div class="col-md-6 ">
                      <button class="btn btn-primary d-block mx-auto mb-0" style="border-radius: 20px;height: 50px;width: 150px; ">Confirm Bill</button>
                    </div>
                    <div class="col-md-6">
                      <button class="btn btn-primary btn-sm btn-block"style="border-radius: 20px;height: 50px;width: 150px; margin-left: 50px;">Cancel Bill</button>
                    </div>
                  </div>
            

                  

                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- </form> -->
      </div>
    </div>
		
		
  </div>
</div>


<div class="modal fade" id="detail_Bill_ModalToggle" aria-hidden="true" aria-labelledby="detail_Bill_ModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-centered mb-3">
		 <div class="site-section">
      <div class="container" style="background-color: white;">
       
        <div class="row">
        
          <div class="col-md-6 mb-5 mb-md-0 ">
            <h2 class="h3 mb-3 text-black mt-2 fw-bolder " style="position: sticky; top:30px;">Billing Details</h2>
            <div class="p-3 p-lg-5 border" style=" position: sticky; top: 70px;">
            
             <div class="form-group row">
                <div class="col-md-6">
                  <label for="maKH" class="text-black" >Customer Code </label>
                  <input type="text" class="form-control" id="maKH" name="maKH" readonly>
                </div>
                <div class="col-md-6">
                  <label for="maDH" class="text-black">Bill Code </label>
                  <input type="text" class="form-control" id="maDH" name="maDH"  readonly>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="ngayDat" class="text-black">Date Order </label>
                  <input type="text" class="form-control" id="ngayDat" name="ngayDat"  readonly>
                </div>
              </div>
            
              <div class="form-group">
                <label for="hoTen" class="text-black">Full Name </label>
                 <input type="text" class="form-control" id="hoTen" name="hoTen"  readonly>
               
              </div>
               <div class="form-group row ">
                <div class="col-md-6">
                  <label for="email" class="text-black">Email Address </label>
                  <input type="text" class="form-control" id="email" name="email"  readonly>
                </div>
                <div class="col-md-6">
                  <label for="soDT" class="text-black">Phone Number </label>
                  <input type="text" class="form-control" id="soDT" name="soDT"  readonly>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-12">
                  <label for="address" class="text-black">Address </label>
                  <input type="text" class="form-control" id="address" name="address"  readonly>
                </div>
              </div>


              
            </div>
          </div>
          
          
          
          <div class="col-md-6">

        
            
            <div class="row mb-5">
              <div class="col-md-12">
           
                 <div class=" d-flex justify-content-between " >
              	 	<h2 class="h3 mb-3 text-black mt-2 fw-bolder " >Order Product</h2>
              	 	
	                   
	                    <div class="ms-5 mt-2 pb-0  text-danger">*Completed</div>
	                   
		           </div>
           
              
                <div class="p-3 p-lg-5 border" style="background-color: white;">
                  <table class="table site-block-order-table mb-5">
                    <thead>
                     <th class="ms-3">Image</th>
                    
                      <th>Product</th>
                      <th>Total</th>
                    </thead>
                    <tbody class="table-group-divider">
                   <% for (int j = 0; j < 10; j++) { %>
                      <tr>
                      
                       <td class="product-thumnail">
	                          <div class="col-lg-2 col-md-3 col-sm-2 me-1">
			                    <a href="#" title="product-image">
			                      <img src="images/product-item4.jpg" class="img-fluid" alt="single-product-item" style="max-width: 50px;">
			                    </a>
			                  </div>
                           
                       </td>
                       
                       <td><h4>Simple way of piece life <strong class="mx-2">x</strong> 1</h4></td>
                       <td><h4>$250.00</h4></td>
                     
                      </tr>
                      <%} %>
                     
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                        <td class="text-black">$350.00</td>
                      </tr>
                      <tr>
                      <td></td>
                        <td class="text-black font-weight-bold "><strong>Shipping Fee</strong></td>
                        <td class="text-black">$30.00</td>
                      </tr>
                      <tr>
                      	<td></td>
                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                        <td class="text-black font-weight-bold"><strong>$380.00</strong></td>
                      </tr>
                    </tbody>
                  </table>


                </div>
              </div>
            </div>

          </div>
        </div>
        <!-- </form> -->
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