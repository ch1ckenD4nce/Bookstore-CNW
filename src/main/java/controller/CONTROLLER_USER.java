package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.GIOHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.BO.BO_USER;

/**
 * Servlet implementation class CONTROLLER_USER
 */
@WebServlet("/CONTROLLER_USER")
public class CONTROLLER_USER extends HttpServlet {
	private String nameUser = null;
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CONTROLLER_USER() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		session.setAttribute("idtheloai_user", 0);
		String modget = request.getParameter("modget");
		if(modget == null) {
			doPost(request, response);
			return;
		}
		BO_USER bo = new BO_USER();
		if (modget.equals("view")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);
			String masachdetail = request.getParameter("masach");
			// lấy ra sách muốn xem
			SACH sach = bo.getBook(masachdetail);
			ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
			request.setAttribute("sach", sach);
			request.setAttribute("listTheloai", listTheloai);
			// lấy ra list sách tương tự 
			ArrayList<SACH> listBookRelated = bo.getBookRelated(masachdetail);
			request.setAttribute("listBookRelated", listBookRelated);
			session.setAttribute("idtheloai_user", 0);
			RequestDispatcher rd2 = request.getRequestDispatcher("USER_bookdetail.jsp");
			rd2.forward(request, response);
			
		} else if (modget.equals("viewall")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);
			
			ArrayList<SACH> listBook = bo.getAllBook();
			ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
			ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
			
			request.setAttribute("listBook", listBook);
			request.setAttribute("listTheloai", listTheloai);
			request.setAttribute("listTacgia", listTacgia);
			
			for(int i = 0; i < listTheloai.size(); i++) {
				String[] listname = new String[listTheloai.size()];
				String name = "listBook_" + listTheloai.get(i).getTentheloai();
				listname[i] = name;
				
				ArrayList<SACH> currentList = bo.getAllBook_genre(listTheloai.get(i).getIdtheloai());
				request.setAttribute(listname[i], currentList);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("USER_allbook.jsp");
			rd.forward(request, response);
		} else if (modget.equals("home")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);
			
			// lấy ra cbb
			ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
			request.setAttribute("listTheloai", listTheloai);
			
			
			// banner
			ArrayList<SACH> listBook = bo.getBookBanner();
			request.setAttribute("listBook", listBook);
			
			
			// featured book
			ArrayList<SACH> listFeaturedBook = bo.getFeaturedBook();
			request.setAttribute("listFeaturedBook", listFeaturedBook);
			
			// popular book
			for(int i = 0; i < listTheloai.size(); i++) {
				String[] listname = new String[listTheloai.size()];
				String name = "listBook_" + listTheloai.get(i).getTentheloai();
				listname[i] = name;
				
				ArrayList<SACH> currentList = bo.getAllBook_genre_featured(listTheloai.get(i).getIdtheloai());
				request.setAttribute(listname[i], currentList);
			}
			
			// best selling
			SACH book_bestselling = bo.getBookBestSelling();
			request.setAttribute("book_bestselling", book_bestselling);
			
			// author
			ArrayList<SACH> listBookNewAuthor = bo.getBookNewAuthor();
			request.setAttribute("listBookNewAuthor", listBookNewAuthor);
			
			// book with offer
			ArrayList<SACH> listBookOffer = bo.getBookOffer();
			request.setAttribute("listBookOffer", listBookOffer);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("USER_index.jsp");
			rd.forward(request, response);
		} else if(modget.equals("logout")) {
			session.setAttribute("idtheloai", 0);
			session.setAttribute("idtheloai_user", 0);
			session.setAttribute("nameUser", null);
			session.setAttribute("error", null);
			response.sendRedirect("CONTROLLER_GUEST?modget=index");
		}
		else if (modget.equals("order")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);

        	session.setAttribute("idtheloai_admin", 0);
        	ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
            
            // list order confirm
            ArrayList<DONHANG> listOrder_confirm = bo.getAllOrder_confirm(makh);
            request.setAttribute("listOrder_confirm", listOrder_confirm);
            
            for(int i = 0; i < listOrder_confirm.size(); i++) {
				String name = "listOrder_" + listOrder_confirm.get(i).getMaDonHang();
				System.out.println("-------" + name);
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
				
				// lấy ra khách hàng
				String kh_confirm = "kh_confirm_" + listOrder_confirm.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_confirm.get(i).getMaKhachHang());
				request.setAttribute(kh_confirm, khachhang);
            }
            
            ArrayList<DONHANG> listOrder_completed = bo.getAllOrder_completed(makh);
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
				
				// lấy ra khách hàng
				String kh_completed = "kh_completed_" + listOrder_completed.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_completed.get(i).getMaKhachHang());
				request.setAttribute(kh_completed, khachhang);
            }
            
            ArrayList<DONHANG> listOrder_can = bo.getAllOrder_can(makh);
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
				
				// lấy ra khách hàng
				String kh_can = "kh_can_" + listOrder_can.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_can.get(i).getMaKhachHang());
				request.setAttribute(kh_can, khachhang);
            }
            
            // list chitietdonhang
            
            session.setAttribute("selectOrder", "confirm");
            RequestDispatcher rd = request.getRequestDispatcher("USER_order.jsp");
            rd.forward(request, response);
            
        }
		else if (modget.equals("viewOrder")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);
			ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
			
        	String madonhang = request.getParameter("madonhang");
        	System.out.println("madonhang" + madonhang);
        	// lấy ra đơn hàng
        	DONHANG order = bo.getOrder(madonhang);
        	request.setAttribute("order", order);
        	System.out.println("donhang" + order != null);
        	
        	// lấy ra tổng tiền sau giảm giá
			float totalamount = bo.getAmountTotal2(madonhang);
			request.setAttribute("totalamount", totalamount);

        	
        	// lấy ra chi tiết đơn hàng 
        	ArrayList<CHITIETDONHANG> orderdetail = bo.getAllOrderDetail(madonhang);
        	request.setAttribute("orderdetail", orderdetail);
        	System.out.println("orderdetail" + orderdetail.size());

        	// lấy ra khách hàng
        	KHACHHANG khhang = bo.getKHang(madonhang);
        	request.setAttribute("khhang", khhang);
        	System.out.println("khhang" + khhang != null);
        	
        	// lấy ra tổng tiền
        	float subtotal = bo.getAmountTotal(madonhang);
			request.setAttribute("subtotal", subtotal);

        	
        	// lấy lại đoạn cũ 
        	 // list order confirm
            ArrayList<DONHANG> listOrder_confirm = bo.getAllOrder_confirm(makh);
            request.setAttribute("listOrder_confirm", listOrder_confirm);
            
            for(int i = 0; i < listOrder_confirm.size(); i++) {
				String name = "listOrder_" + listOrder_confirm.get(i).getMaDonHang();
				System.out.println("-------" + name);
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
            }
            ArrayList<DONHANG> listOrder_completed = bo.getAllOrder_completed(makh);
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
				
				// lấy ra khách hàng
				String kh_completed = "kh_completed_" + listOrder_completed.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_completed.get(i).getMaKhachHang());
				request.setAttribute(kh_completed, khachhang);
            }
            ArrayList<DONHANG> listOrder_can = bo.getAllOrder_can(makh);
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
				
				// lấy ra khách hàng
				String kh_can = "kh_can_" + listOrder_can.get(i).getMaDonHang();
				KHACHHANG khachhang = bo.getKH(listOrder_can.get(i).getMaKhachHang());
				request.setAttribute(kh_can, khachhang);
            }
            
            RequestDispatcher rd = request.getRequestDispatcher("USER_orderdetail.jsp");
            rd.forward(request, response);
            
        	
        	
        }

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		HttpSession session = request.getSession();
		session.setAttribute("idtheloai_user", 0);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String modpost = request.getParameter("modpost");
		BO_USER bo = new BO_USER();
		if (modpost.equals("login")) {
			String Username = request.getParameter("username_login");
			String Password = request.getParameter("password_login");
			System.out.println("controller: " + Username + ", " + Password);

			boolean checkLogin = bo.checkLogin(Username, Password);
			if (checkLogin) {
				// lay ra ten nguoi dung
				nameUser = bo.getNameUser(Username);
				session.setAttribute("nameUser", nameUser);
				
				//System.out.println("controller: " + nameUser + ", " + Username);
				// phan quyen
				String quyen = bo.getQuyen(Username);
				System.out.println("controller: " + quyen);
				if (quyen.equals("ADMIN")) {
					RequestDispatcher rd = request.getRequestDispatcher("trangchu_admin.jsp");
					rd.forward(request, response);
				} else if (quyen.equals("USER")) {
					request.setAttribute("user", nameUser);
					session.setAttribute("username", Username);
					System.out.println("controller: " + Username);
					
					// lấy ra cbb
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					request.setAttribute("listTheloai", listTheloai);
					
					
					// banner
					ArrayList<SACH> listBook = bo.getBookBanner();
					request.setAttribute("listBook", listBook);
					
					
					// featured book
					ArrayList<SACH> listFeaturedBook = bo.getFeaturedBook();
					request.setAttribute("listFeaturedBook", listFeaturedBook);
					
					// popular book
					for(int i = 0; i < listTheloai.size(); i++) {
						String[] listname = new String[listTheloai.size()];
						String name = "listBook_" + listTheloai.get(i).getTentheloai();
						listname[i] = name;
						
						ArrayList<SACH> currentList = bo.getAllBook_genre_featured(listTheloai.get(i).getIdtheloai());
						request.setAttribute(listname[i], currentList);
					}
					
					// best selling
					SACH book_bestselling = bo.getBookBestSelling();
					request.setAttribute("book_bestselling", book_bestselling);
					
					// author
					ArrayList<SACH> listBookNewAuthor = bo.getBookNewAuthor();
					request.setAttribute("listBookNewAuthor", listBookNewAuthor);
					
					// book with offer
					ArrayList<SACH> listBookOffer = bo.getBookOffer();
					request.setAttribute("listBookOffer", listBookOffer);
					
					
					RequestDispatcher rd = request.getRequestDispatcher("USER_index.jsp");
					rd.forward(request, response);
				}
			} else {
				session.setAttribute("error", "ACCOUNT OR PASSWORD IS INCORRECT");
				response.sendRedirect("CONTROLLER_GUEST?modget=index");
			}
		} else if (modpost.equals("select")) {
			String selectedCbb = request.getParameter("selectedCbb");
			String selectedValue = request.getParameter("selectedValue");
			String eventType = request.getParameter("eventType");
			
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			
			request.setAttribute("SoluongGioHang", SoluongGioHang);

			if (eventType.equals("cbb")) {
				if (selectedValue.equals("")) {
					session.setAttribute("idtheloai_user", 0);
					ArrayList<SACH> listBook = bo.getAllBook();
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
					
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					request.setAttribute("listTacgia", listTacgia);
					
					for(int i = 0; i < listTheloai.size(); i++) {
						String[] listname = new String[listTheloai.size()];
						String name = "listBook_" + listTheloai.get(i).getTentheloai();
						listname[i] = name;
						
						ArrayList<SACH> currentList = bo.getAllBook_genre(listTheloai.get(i).getIdtheloai());
						request.setAttribute(listname[i], currentList);
					}
					
					RequestDispatcher rd = request.getRequestDispatcher("USER_allbook.jsp");
					rd.forward(request, response);
					
				} else {
					ArrayList<SACH> listBook = bo.getAllBook_theloai(Integer.parseInt(selectedValue));
					session.setAttribute("idtheloai_user", Integer.parseInt(selectedValue));
					String tentheloai = bo.getNameGenre(Integer.parseInt(selectedValue));
					session.setAttribute("tentheloai", tentheloai);
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					request.setAttribute("listTacgia", listTacgia);
					
					RequestDispatcher rd = request.getRequestDispatcher("USER_bookgenre.jsp");
					rd.forward(request, response);
				}
			} else if (eventType.equals("search")) {
				String searchValue = request.getParameter("selectedValue");
				
				int id = (int) session.getAttribute("idtheloai_user"); 
				System.out.println("test id "+id);
				if(id == 0) {
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					request.setAttribute("listTheloai", listTheloai);
					
					for(int i = 0; i < listTheloai.size(); i++) {
						String[] listname = new String[listTheloai.size()];
						String name = "listBook_" + listTheloai.get(i).getTentheloai();
						listname[i] = name;
						
						ArrayList<SACH> currentList = bo.getAllBook_genre_search(listTheloai.get(i).getIdtheloai(), searchValue);
						request.setAttribute(listname[i], currentList);
					}
					
					RequestDispatcher rd = request.getRequestDispatcher("USER_allbook.jsp");
					rd.forward(request, response);
					
				} else {
					ArrayList<SACH> listBook = bo.getBookSearch(searchValue, id);
					ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
					ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					request.setAttribute("listTacgia", listTacgia);

					
					RequestDispatcher rd = request.getRequestDispatcher("USER_bookgenre.jsp");
					rd.forward(request, response);
				}
			}
		}
		else if(modpost.equals("dathang")) {
			String username = (String) session.getAttribute("username_login");
			String masach = request.getParameter("masach");
			int soluong = Integer.parseInt(request.getParameter("soluong"));
			String makhachhang = bo.getMaKhachHang(username);
			bo.addBookToCart(makhachhang, masach, soluong);
			//response.sendRedirect(request.getRequestURI());
			//response.sendRedirect("CONTROLLER_USER?modpost=giohang");
			String link = "CONTROLLER_USER?modget=view&masach=" + masach;
			System.out.println(link);
			response.sendRedirect(link);
//			RequestDispatcher rd = request.getRequestDispatcher(link);
//			rd.forward(request, response);
		}
		else if(modpost.equals("giohang")) {
			ArrayList<THELOAI> listTheloai = bo.getAllTheloai();
            request.setAttribute("listTheloai", listTheloai);
			System.out.println("controller: gio hang");
			String username = (String) session.getAttribute("username_login");
			System.out.println("username: " + username);
			String makh = bo.getMaKhachHang(username);
			
			int SoluongGioHang = bo.getSoluongGioHang(makh);
			request.setAttribute("SoluongGioHang", SoluongGioHang);
			
			ArrayList<GIOHANG> giohang = bo.getGioHangList(makh);
			ArrayList<GIOHANG> xacnhan = new ArrayList<GIOHANG>();
			
			String buttonValue = "";
			buttonValue = request.getParameter("button");
			System.out.println("Button: " + buttonValue);
			if(buttonValue == null) {
				String checkboxValue = "";
				String name = "productSelection";
				System.out.println("Ma khach: " + makh);
				for(int i = 0; i < giohang.size(); i++) {
					
					checkboxValue = request.getParameter(name + i);
					//System.out.println("checkboxValue" + checkboxValue);
					if (checkboxValue != null) {
			            // Checkbox được chọn
			            xacnhan.add(giohang.get(i));
			        }
				}
			}
			else if(buttonValue.equals("update")) {
				int inputValue = 0;
				String name = "quantity_sach";
				for(int i = 0; i < giohang.size(); i++) {
					inputValue = Integer.parseInt(request.getParameter(name + i))  ;
					giohang.get(i).setSoLuong(inputValue);
					System.out.println(i + ": " + inputValue);
				}
				bo.updateGioHang(makh, giohang);
			}
			
			request.setAttribute("xacnhandonhang", xacnhan);
			request.setAttribute("giohang", giohang);
			RequestDispatcher rd = request.getRequestDispatcher("USER_cart.jsp");
			rd.forward(request, response);
		}
		else if(modpost.equals("deleteGioHang")) {
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			String masach = request.getParameter("idsach");
			System.out.println("MaKhachHang = " + makh + " ID sach" + masach);
			bo.deleteGioHang(makh, masach);
			RequestDispatcher rd = request.getRequestDispatcher("CONTROLLER_USER?modpost=giohang");
			rd.forward(request, response);
		}
		else if(modpost.equals("themdonhang")) {
			ArrayList<GIOHANG> giohang = (ArrayList<GIOHANG>)session.getAttribute("xacnhandonhang");
			System.out.println("controller: them don hang");
			for(int i = 0; i < giohang.size(); i++) {
				System.out.println(giohang.get(i).getTenSach());
			}
			String username = (String) session.getAttribute("username_login");
			String makh = bo.getMaKhachHang(username);
			bo.insertDonHang(makh, giohang);
			
			RequestDispatcher rd = request.getRequestDispatcher("CONTROLLER_USER?modpost=giohang");
			rd.forward(request, response);
		}
		
	}

}
