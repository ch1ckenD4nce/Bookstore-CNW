package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.BO.BO_GUEST;

/**
 * Servlet implementation class CONTROLLER_HOME
 */
@WebServlet("/CONTROLLER_GUEST")
public class CONTROLLER_GUEST extends HttpServlet {
	private String nameUser = null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CONTROLLER_GUEST() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		BO_GUEST bo = new BO_GUEST();
		String modget = request.getParameter("modget");
		HttpSession session = request.getSession(); 
		session.setAttribute("idtheloai", 0);
		if(modget.equals("index")) {
			// lấy ra cbb
			ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
			request.setAttribute("listTheloai", listTheloai);
			
			// banner : lấy ra 2 sách mới nhất / giá bán mắc nhất 
			ArrayList<SACH> listBookBanner = bo.getBookBanner();
			request.setAttribute("listBookBanner", listBookBanner);
			
			// featured book
			ArrayList<SACH> listBookFeatured = bo.getBookFeatured();
			request.setAttribute("listBookFeatured", listBookFeatured);
			
			// popular book  : list thể loại và listbook theo thể loại
			for(int i = 0; i < listTheloai.size(); i++) {
				String[] listname = new String[listTheloai.size()];
				String name = "listBook_" + listTheloai.get(i).getTentheloai();
				listname[i] = name;
				
				ArrayList<SACH> currentList = bo.getAllBook_genre_featured(listTheloai.get(i).getIdtheloai());
				request.setAttribute(listname[i], currentList);
			}
			
			// best selling
			SACH bookBestSelling = bo.getBookBestSelling();
			request.setAttribute("bookBestSelling", bookBestSelling);
			
			// author
			ArrayList<SACH> listBookNewAuthor = bo.getBookNewAuthor();
			request.setAttribute("listBookNewAuthor", listBookNewAuthor);
			
			// book with offer
			ArrayList<SACH> listBookOffer = bo.getBookOffer();
			request.setAttribute("listBookOffer", listBookOffer);
			
			RequestDispatcher rd = request.getRequestDispatcher("GUEST_index.jsp");
			rd.forward(request, response);
			
			
		} else if(modget.equals("view")) {
			String masachdetail = request.getParameter("masach");
			// lấy ra sách muốn xem
			SACH sach = bo.getBook(masachdetail);
			ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
			request.setAttribute("sach", sach);
			request.setAttribute("listTheloai", listTheloai);
			// lấy ra list sách tương tự 
			ArrayList<SACH> listBookRelated = bo.getBookRelated(masachdetail);
			request.setAttribute("listBookRelated", listBookRelated);
			session.setAttribute("idtheloai", 0);
			
			RequestDispatcher rd2 = request.getRequestDispatcher("GUEST_bookdetail.jsp");
			rd2.forward(request, response);
		} else if (modget.equals("viewall")) {
			ArrayList<SACH> listBook = bo.getAllBook();
			System.out.println(listBook.get(1).getTenSach());
			ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
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
			
			RequestDispatcher rd = request.getRequestDispatcher("GUEST_allbook.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(); 
		session.setAttribute("idtheloai", 0);
		BO_GUEST bo = new BO_GUEST();
		String modpost = request.getParameter("modpost");
		if(modpost.equals("select")) {
			String selectedCbb = request.getParameter("selectedCbb");
			String selectedValue = request.getParameter("selectedValue");
			String eventType = request.getParameter("eventType");
			if (eventType.equals("cbb")) {
				if (selectedValue.equals("")) {
					session.setAttribute("idtheloai", 0);
					ArrayList<SACH> listBook = bo.getAllBook();
					System.out.println(listBook.get(1).getTenSach());
					ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
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
					
					RequestDispatcher rd = request.getRequestDispatcher("GUEST_allbook.jsp");
					rd.forward(request, response);
				} else {
					// Xử lý khi combobox thể loại được chọn
					ArrayList<SACH> listBook = bo.getAllBook_theloai(Integer.parseInt(selectedValue));
					session.setAttribute("idtheloai", Integer.parseInt(selectedValue));
					String tentheloai = bo.getNameGenre(Integer.parseInt(selectedValue));
					session.setAttribute("tentheloai", tentheloai);
					ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
					ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					request.setAttribute("listTacgia", listTacgia);
					
					RequestDispatcher rd = request.getRequestDispatcher("GUEST_bookgenre.jsp");
					rd.forward(request, response);
				}
				
			} else if (eventType.equals("search")) {
				String searchValue = request.getParameter("selectedValue");
				
				int id = (int) session.getAttribute("idtheloai"); 
				System.out.println("test id "+id);
				if(id == 0) {
					ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
					request.setAttribute("listTheloai", listTheloai);
					
					for(int i = 0; i < listTheloai.size(); i++) {
						String[] listname = new String[listTheloai.size()];
						String name = "listBook_" + listTheloai.get(i).getTentheloai();
						listname[i] = name;
						
						ArrayList<SACH> currentList = bo.getAllBook_genre_search(listTheloai.get(i).getIdtheloai(), searchValue);
						request.setAttribute(listname[i], currentList);
					}
					
					RequestDispatcher rd = request.getRequestDispatcher("GUEST_allbook.jsp");
					rd.forward(request, response);
					
				} else {
					ArrayList<SACH> listBook = bo.getBookSearch(searchValue, id);
					ArrayList<THELOAI> listTheloai = bo.getAllTheLoai();
					ArrayList<TACGIA> listTacgia = bo.getAllTacgia();
					request.setAttribute("listBook", listBook);
					request.setAttribute("listTheloai", listTheloai);
					request.setAttribute("listTacgia", listTacgia);

					
					RequestDispatcher rd = request.getRequestDispatcher("GUEST_bookgenre.jsp");
					rd.forward(request, response);
				}
				
			}
			
		} else if(modpost.equals("login")) {
			String Username = request.getParameter("username_login");
			String Password = request.getParameter("password_login");
			session.setAttribute("username_login", Username);
			session.setAttribute("password_login", Password);
			System.out.println("controller: " + Username + ", " + Password);
			
			boolean checkLogin = bo.checkLogin(Username, Password);
			if (checkLogin) {
				// lay ra ten nguoi dung
				nameUser = bo.getNameUser(Username);
				session.setAttribute("nameUser", nameUser);
				System.out.println("controller: " + nameUser);
				// phan quyen
				String quyen = bo.getQuyen(Username);
				System.out.println("controller: " + quyen);
				if (quyen.equals("ADMIN")) {
					session.setAttribute("idtheloai_admin", 0);
					response.sendRedirect("CONTROLLER_ADMIN?modget=home");
				} else if (quyen.equals("USER")) {
					response.sendRedirect("CONTROLLER_USER?modget=home");
					
				}
			} else {
				System.out.println("error");
				session.setAttribute("error", "Account or password is in correct!");
				response.sendRedirect("CONTROLLER_GUEST?modget=index");
			}
		} else if(modpost.equals("signup")) {
			String hoten = request.getParameter("hoten_signup");
			String gioitinh = request.getParameter("gioitinh_signup");
			String ngaysinh = request.getParameter("ns_signup");
			Date ngaySinhDate = null;

		    if (ngaysinh != null && !ngaysinh.isEmpty()) {
		        try {
		            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		            ngaySinhDate = new Date(dateFormat.parse(ngaysinh).getTime());
		        } catch (ParseException e) {
		            e.printStackTrace();
		        }
		    }
			
			String diachi = request.getParameter("diachi_signup");
			String sdt = request.getParameter("sdt_signup");
			String email = request.getParameter("email_signup");
			String username = request.getParameter("username_signup");
			String password = request.getParameter("password_signup");
			
			boolean checkSignup = bo.Singup(hoten, gioitinh, ngaySinhDate, diachi, sdt, email, username, password);
			if(checkSignup) {
				session.setAttribute("error", null);
				response.sendRedirect("CONTROLLER_GUEST?modget=index");
			}
		}
	}

}
