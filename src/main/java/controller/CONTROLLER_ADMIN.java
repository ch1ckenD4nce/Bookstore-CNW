package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.BO.BO_ADMIN;

@WebServlet("/CONTROLLER_ADMIN")
@MultipartConfig
public class CONTROLLER_ADMIN extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CONTROLLER_ADMIN() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		session.setAttribute("index", 1);
        String modget = request.getParameter("modget");
        BO_ADMIN bo = new BO_ADMIN();
        if (modget.equals("listbook")) {
            ArrayList<SACH> listBook = bo.getAllBook();
            request.setAttribute("listBook", listBook);
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_danhsachbook.jsp");
            rd.forward(request, response);
        } else if (modget.equals("themsach")) {
        	ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
        	request.setAttribute("listTheloai", listTheloai);
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_insert.jsp");
            rd.forward(request, response);
        } else if (modget.equals("home")) {
        	ArrayList<SACH> listBook = bo.getAllBook();
            request.setAttribute("listBook", listBook);
            
            ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
            
//            ArrayList<SACH> listBookUpDate = new ArrayList<SACH>();
//            for(int i = 0; i < listBook.size(); i++) {
//            	String name = "book_" + listBook.get(i).getTenSach();
//            	// lấy ra book 
//            	SACH sach = bo.getBook(listBook.get(i).getMaSach());
//            	listBookUpDate.add(sach);
//            }
//            request.setAttribute("listBookUpDate", listBookUpDate);
//            
            
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_index.jsp");
            rd.forward(request, response);
        } else if(modget.equals("update")) {
        	String masach = request.getParameter("masach");
        	SACH sach = bo.getBook(masach);
        	request.setAttribute("sach", sach);
        	
        	ArrayList<SACH> listBook = bo.getAllBook();
            request.setAttribute("listBook", listBook);
            
            ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
        	
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_update.jsp");
            rd.forward(request, response);
        } else if (modget.equals("order")) {
        	session.setAttribute("idtheloai_admin", 0);
        	ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
            
            session.setAttribute("cnw", null);
            
            // list order confirm
            ArrayList<DONHANG> listOrder_confirm = bo.getAllOrder_confirm();
            request.setAttribute("listOrder_confirm", listOrder_confirm);
            
            for(int i = 0; i < listOrder_confirm.size(); i++) {
				String name = "listOrder_" + listOrder_confirm.get(i).getMaDonHang();
//				System.out.println("-------" + name);
				ArrayList<CHITIETDONHANG> listOrderDetail = bo.getAllOrderDetail(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail);
				System.out.println(listOrderDetail.size()+"______");
				
				// lấy ra tổng số lượng 
				String nameTotal = "total_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				int total_confirm = bo.getAllTotal(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameTotal, total_confirm);
				
				// lấy ra tổng tiền
				String nameamountTotal = "tamount_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm = bo.getAmountTotal(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal, amountTotal_confirm);
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal2 = "tamount_confirm2_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm2 = bo.getAmountTotal2(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal2, amountTotal_confirm2);
				
				// lấy ra khách hàng
				String kh_confirm = "kh_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_confirm.get(i).getMaKhachHang());
				request.setAttribute(kh_confirm, khachhang);
            }
            
            ArrayList<DONHANG> listOrder_completed = bo.getAllOrder_completed();
            request.setAttribute("listOrder_completed", listOrder_completed);
            
            for(int i = 0; i < listOrder_completed.size(); i++) {
				String name = "listOrderCompleted_" + listOrder_completed.get(i).getMaDonHang();
				ArrayList<CHITIETDONHANG> listOrderDetail_completed = bo.getAllOrderDetail(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail_completed);
				
				// lấy ra tổng số lượng 
				String nameTotal_completed = "total_completed_" + listOrder_completed.get(i).getMaDonHang();
				int total_completed = bo.getAllTotal(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameTotal_completed, total_completed);
				
				// lấy ra tổng tiền
				String nameamountTotal_completed = "tamount_completed_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal_completed = bo.getAmountTotal(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_completed, amountTotal_completed);
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal_completed2 = "tamount_completed2_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal_completed2 = bo.getAmountTotal2(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_completed2, amountTotal_completed2);
				
				// lấy ra khách hàng
				String kh_completed = "kh_completed_" + listOrder_completed.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_completed.get(i).getMaKhachHang());
				request.setAttribute(kh_completed, khachhang);
            }
            
            ArrayList<DONHANG> listOrder_can = bo.getAllOrder_can();
            request.setAttribute("listOrder_can", listOrder_can);
            
            for(int i = 0; i < listOrder_can.size(); i++) {
				String name = "listOrderCan_" + listOrder_can.get(i).getMaDonHang();
				ArrayList<CHITIETDONHANG> listOrderDetail_can = bo.getAllOrderDetail(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail_can);
				
				// lấy ra tổng số lượng 
				String nameTotal_can = "total_can_" + listOrder_can.get(i).getMaDonHang();
				int total_can = bo.getAllTotal(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameTotal_can, total_can);
				
				// lấy ra tổng tiền
				String nameamountTotal_can = "tamount_can_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal_can = bo.getAmountTotal(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_can, amountTotal_can);
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal_can2_ = "tamount_can2_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal_can2 = bo.getAmountTotal2(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_can2_, amountTotal_can2);
				
				// lấy ra khách hàng
				String kh_can = "kh_can_" + listOrder_can.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_can.get(i).getMaKhachHang());
				request.setAttribute(kh_can, khachhang);
            }
            
            // list chitietdonhang
            
            session.setAttribute("selectOrder", "confirm");
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_order.jsp");
            rd.forward(request, response);
            
            
        } else if (modget.equals("viewOrder")) {
        	String madonhang = request.getParameter("madonhang");
        	System.out.println("madonhang" + madonhang);
        	request.setAttribute("madonhang", madonhang);
        	session.setAttribute("cnw", "ok");
        	
        	// lấy ra trạng thái 
        	int trangthai = bo.getTrangThai(madonhang);
        	System.out.println("trangthai" + trangthai);
        	if(trangthai == 0) {
        		session.setAttribute("selectOrder", "confirm");
        	} else if (trangthai == 1) {
        		session.setAttribute("selectOrder", "completed");
        	}  else if (trangthai == 2) {
        		session.setAttribute("selectOrder", "cancelled");
        	}
        	
        	int temp = (int) session.getAttribute("index");
        	temp++;
        	session.setAttribute("index", temp);
        	
        	// lấy ra đơn hàng
        	String nameorder = "order_"+temp;
        	DONHANG order = bo.getOrder(madonhang);
        	request.setAttribute(nameorder, order);
        	if(order != null) {
        		System.out.println("cnw");
        	} else {
        		System.out.println("no");
        	}

        	
        	// lấy ra chi tiết đơn hàng 
        	ArrayList<CHITIETDONHANG> orderdetail = bo.getAllOrderDetail(madonhang);
        	request.setAttribute("orderdetail", orderdetail);
//        	System.out.println("orderdetail" + orderdetail.size());
        	

        	// lấy ra khách hàng
        	KHACHHANG khhang = bo.getKHang(madonhang);
        	request.setAttribute("khhang", khhang);
//        	System.out.println("khhang" + khhang != null);
        	
        	// lấy ra tổng tiền
        	float subtotal = bo.getAmountTotal(madonhang);
			request.setAttribute("subtotal", subtotal);
			
			// lấy ra tổng tiền sau giảm giá
			float subtotal2 = bo.getAmountTotal2(madonhang);
			request.setAttribute("subtotal2", subtotal2);
			

        	
        	// lấy lại đoạn cũ 
        	 // list order confirm
            ArrayList<DONHANG> listOrder_confirm = bo.getAllOrder_confirm();
            request.setAttribute("listOrder_confirm", listOrder_confirm);
            
            for(int i = 0; i < listOrder_confirm.size(); i++) {
				String name = "listOrder_" + listOrder_confirm.get(i).getMaDonHang();
//				System.out.println("-------" + name);
				ArrayList<CHITIETDONHANG> listOrderDetail = bo.getAllOrderDetail(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail);
//				System.out.println(listOrderDetail.size()+"______");
				
				// lấy ra tổng số lượng 
				String nameTotal = "total_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				int total_confirm = bo.getAllTotal(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameTotal, total_confirm);
				
				// lấy ra tổng tiền
				String nameamountTotal = "tamount_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm = bo.getAmountTotal(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal, amountTotal_confirm);
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal2 = "tamount_confirm2_" + listOrder_confirm.get(i).getMaDonHang();
				float amountTotal_confirm2 = bo.getAmountTotal2(listOrder_confirm.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal2, amountTotal_confirm2);
            }
            ArrayList<DONHANG> listOrder_completed = bo.getAllOrder_completed();
            request.setAttribute("listOrder_completed", listOrder_completed);
            
            for(int i = 0; i < listOrder_completed.size(); i++) {
				String name = "listOrderCompleted_" + listOrder_completed.get(i).getMaDonHang();
				ArrayList<CHITIETDONHANG> listOrderDetail_completed = bo.getAllOrderDetail(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail_completed);
				
				// lấy ra tổng số lượng 
				String nameTotal_completed = "total_completed_" + listOrder_completed.get(i).getMaDonHang();
				int total_completed = bo.getAllTotal(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameTotal_completed, total_completed);
				
				// lấy ra tổng tiền
				String nameamountTotal_completed = "tamount_completed_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal_completed = bo.getAmountTotal(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_completed, amountTotal_completed);
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal_completed2 = "tamount_completed2_" + listOrder_completed.get(i).getMaDonHang();
				float amountTotal_completed2 = bo.getAmountTotal2(listOrder_completed.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_completed2, amountTotal_completed2);
				
				// lấy ra khách hàng
				String kh_completed = "kh_completed_" + listOrder_completed.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_completed.get(i).getMaKhachHang());
				request.setAttribute(kh_completed, khachhang);
            }
            ArrayList<DONHANG> listOrder_can = bo.getAllOrder_can();
            request.setAttribute("listOrder_can", listOrder_can);
            
            for(int i = 0; i < listOrder_can.size(); i++) {
				String name = "listOrderCan_" + listOrder_can.get(i).getMaDonHang();
				ArrayList<CHITIETDONHANG> listOrderDetail_can = bo.getAllOrderDetail(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(name, listOrderDetail_can);
				
				// lấy ra tổng số lượng 
				String nameTotal_can = "total_can_" + listOrder_can.get(i).getMaDonHang();
				int total_can = bo.getAllTotal(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameTotal_can, total_can);
				
				// lấy ra tổng tiền
				String nameamountTotal_can = "tamount_can_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal_can = bo.getAmountTotal(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_can, amountTotal_can);
				
				
				// lấy ra tổng tiền sau giảm giá
				String nameamountTotal_can2_ = "tamount_can2_" + listOrder_can.get(i).getMaDonHang();
				float amountTotal_can2 = bo.getAmountTotal2(listOrder_can.get(i).getMaDonHang());
				request.setAttribute(nameamountTotal_can2_, amountTotal_can2);
				
				// lấy ra khách hàng
				String kh_can = "kh_can_" + listOrder_can.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_can.get(i).getMaKhachHang());
				request.setAttribute(kh_can, khachhang);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_orderdetail.jsp");
            rd.forward(request, response);
            
        	
        	
        } else if(modget.equals("logout")) {
			session.setAttribute("idtheloai", 0);
			session.setAttribute("idtheloai_user", 0);
			session.setAttribute("nameUser", null);
			session.setAttribute("selectOrder", "confirm");
			response.sendRedirect("CONTROLLER_GUEST?modget=index");
		} else if(modget.equals("testtt")) {
			String path = getServletContext().getRealPath("");
			System.out.println(path);
		} else if(modget.equals("confirm")) {
			session.setAttribute("selectOrder", "completed");
			String madonhang = (String) request.getParameter("madonhang");
			System.out.println(madonhang);
			bo.ConfirmOrder(madonhang);
			response.sendRedirect("CONTROLLER_ADMIN?modget=order");
		} else if(modget.equals("can")) {
			session.setAttribute("selectOrder", "cancelled");
			String madonhang = (String) request.getParameter("madonhang");
			System.out.println(madonhang);
			bo.CancelledOrder(madonhang);
			response.sendRedirect("CONTROLLER_ADMIN?modget=order");
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
        String modpost = request.getParameter("modpost");
        BO_ADMIN bo = new BO_ADMIN();
        if (modpost.equals("themsach")) {
            String masach = request.getParameter("masach");
            String tensach = request.getParameter("tensach");
            String tacgia = request.getParameter("tacgia");
            String nxb = request.getParameter("nxb");
            int theloai = Integer.parseInt(request.getParameter("idtheloai"));
            float giaban = Float.parseFloat(request.getParameter("giaban"));
            int giamgia = Integer.parseInt(request.getParameter("giamgia"));
            String mota = request.getParameter("mota");
            Part p = request.getPart("fileanh");
            String tenanh = p.getSubmittedFileName(); 
            // kiểm tra mã sách đã tồn tại hay chưa 
            boolean checkMaSach = bo.checkMaSach(masach);
            if(!checkMaSach) {
            	boolean checkinsert = bo.insertBook(masach, tensach, tacgia, nxb, theloai, giaban, giamgia,
                        mota, tenanh);
                if (checkinsert) {
                	String path = getServletContext().getRealPath("/image_book");
                    if (!Files.exists(Paths.get(path))) {
                        Files.createDirectories(Paths.get(path));
                    }
                    p.write(path + File.separator + tenanh);
                    response.sendRedirect("CONTROLLER_ADMIN?modget=home");
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("test_error.jsp");
                    rd.forward(request, response);
                }
            } else {
            	session.setAttribute("masach_admin_insert", masach);
            	session.setAttribute("tensach_admin_insert", tensach);
            	session.setAttribute("tacgia_admin_insert", tacgia);
            	session.setAttribute("nxb_admin_insert", nxb);
            	session.setAttribute("idtheloai_admin_insert", theloai);
            	session.setAttribute("giaban_admin_insert", giaban);
            	session.setAttribute("giamgia_admin_insert", giamgia);
            	session.setAttribute("mota_admin_insert", mota);
            	session.setAttribute("tenanh_admin_insert", tenanh);
            	response.sendRedirect("CONTROLLER_ADMIN?modget=index");
            	
            }
            
            
            
           
        } else if (modpost.equals("update")) {
            String masach = request.getParameter("masach_update");
            String tensach = request.getParameter("tensach_update");
            String tacgia = request.getParameter("tacgia_update");
            String nxb = request.getParameter("nxb_update");
            int theloai = Integer.parseInt(request.getParameter("idtheloai_update"));
            float giaban = Float.parseFloat(request.getParameter("giaban_update"));
            int giamgia = Integer.parseInt(request.getParameter("giamgia_update"));
            String mota = request.getParameter("mota_update");
            
            Part p = request.getPart("fileanh_update");
            System.out.println("p" + p);
            String tenanh = p.getSubmittedFileName(); 
            System.out.println("tenanh " + tenanh);
            
            
            boolean checkUpdate = bo.updateBook(masach, tensach, tacgia, nxb, theloai, giaban, giamgia,
                    mota, tenanh);
            
            
            if (checkUpdate) {
            	if(tenanh != null && !tenanh.isEmpty()) {
            		String path = getServletContext().getRealPath("/image_book");
//            	String path = getServletContext().getRealPath("");
            		System.out.println(path);
            		if (!Files.exists(Paths.get(path))) {
            			Files.createDirectories(Paths.get(path));
            		}
            		p.write(path + File.separator + tenanh);
            	}
            	SACH sach = bo.getBook(masach);
            	request.setAttribute("sach", sach);
            	
            	ArrayList<SACH> listBook = bo.getAllBook();
                request.setAttribute("listBook", listBook);
                
                ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
                request.setAttribute("listTheloai", listTheloai);
            	
                RequestDispatcher rd = request.getRequestDispatcher("ADMIN_update.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("test_error.jsp");
                rd.forward(request, response);
            }
        } else if(modpost.equals("select")) {
        	String selectedCbb = request.getParameter("selectedCbb");
			String selectedValue = request.getParameter("selectedValue");
			String eventType = request.getParameter("eventType");

			if (eventType.equals("cbb")) {
				if (selectedValue.equals("")) {
					session.setAttribute("idtheloai_admin", 0);
					ArrayList<SACH> listBook = bo.getAllBook();
		            request.setAttribute("listBook", listBook);
		            
		            ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
		            request.setAttribute("listTheloai", listTheloai);
		            
		            RequestDispatcher rd = request.getRequestDispatcher("ADMIN_index.jsp");
		            rd.forward(request, response);
				} else {
					session.setAttribute("idtheloai_admin", Integer.parseInt(selectedValue));
					ArrayList<SACH> listBook = bo.getAllBook_theloai(Integer.parseInt(selectedValue));
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					
					RequestDispatcher rd = request.getRequestDispatcher("ADMIN_index.jsp");
					rd.forward(request, response);
				}
			} else if (eventType.equals("search")) {
				String searchValue = request.getParameter("selectedValue");
//				System.out.println(searchValue);
				int id = (int) session.getAttribute("idtheloai_admin"); 
//				System.out.println("test id "+id);
				if(id == 0) {
//					System.out.println("okok");
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					request.setAttribute("listTheloai", listTheloai);
					
					ArrayList<SACH> listBook = bo.getBookSearch_all(searchValue);
					request.setAttribute("listBook", listBook);
					
					RequestDispatcher rd = request.getRequestDispatcher("ADMIN_index.jsp");
					rd.forward(request, response);
				} else {
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					request.setAttribute("listTheloai", listTheloai);
					
					ArrayList<SACH> listBook = bo.getBookSearch(searchValue, id);
					request.setAttribute("listBook", listBook);
					
					RequestDispatcher rd = request.getRequestDispatcher("ADMIN_index.jsp");
					rd.forward(request, response);
				}
			
			}
        }
    }
}
