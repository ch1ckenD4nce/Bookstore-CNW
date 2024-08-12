package model.DAO;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Vector;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.GIOHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;

public class DAO_USER {
	public DAO_USER() {
	}

	public boolean CheckLogin(String username, String password) {
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM taikhoan WHERE username = ? and password = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);

			ResultSet result = pst.executeQuery();
			if (result.next()) {
				return true;
			} else
				return false;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public String getQuyen(String username) {
		String quyen = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT quyen FROM taikhoan WHERE username = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);

			ResultSet result = pst.executeQuery();
			if (result.next()) {
				quyen = result.getString("quyen");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return quyen;
	}

	public String getNameUser(String username) {
		String nameUser = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM taikhoan WHERE username = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			int id = 0;
			if (result.next()) {
				id = result.getInt("idtaikhoan");

			}
			String sql2 = "SELECT * FROM khachhang WHERE idtaikhoan = ?";
			PreparedStatement pst2 = conn.prepareStatement(sql2);
			pst2.setInt(1, id);
			ResultSet result2 = pst2.executeQuery();
			if (result2.next()) {
				nameUser = result2.getString("hoten");
			}
			return nameUser;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return nameUser;
	}

	public ArrayList<SACH> getAllBook() {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				System.out.println("dao -> getallbook: " + masach + ", " + tensach + ", " + tacgia + ", " + giaban);

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}

//	public ArrayList<SACH> getAllBook_tacgia(int idtacgia) {
//		// tensach , gia,
//		ArrayList<SACH> listBook = new ArrayList<SACH>();
//		try {
//			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
//			String sql = "SELECT tentacgia FROM tacgia WHERE idtacgia = ?";
//			PreparedStatement pst = conn.prepareStatement(sql);
//			pst.setInt(1, idtacgia);
//			ResultSet result = pst.executeQuery();
//			if (result.next()) {
//				String tentacgia = result.getString("tentacgia");
//				System.out.println("dao -> getallbook_tacgia -> tentacgia: " + tentacgia);
//				String sql2 = "SELECT * FROM sach WHERE tacgia = ?";
//				PreparedStatement pst2 = conn.prepareStatement(sql2);
//				pst2.setString(1, tentacgia);
//				ResultSet result2 = pst2.executeQuery();
//				while (result2.next()) {
//					String masach = result2.getString("masach");
//					String tensach = result2.getString("tensach");
//					String tacgia = result2.getString("tacgia");
//					Float giaban = result2.getFloat("giaban");
//					System.out.println("dao -> getallbook: " + masach + ", " + tensach + ", " + tacgia + ", " + giaban);
//
//					String sql3 = "SELECT dataanh FROM anh WHERE idsach = ?";
//					PreparedStatement pst3 = conn.prepareStatement(sql3);
//					pst3.setString(1, masach);
//					ResultSet result3 = pst3.executeQuery();
//					byte[] imageData = null;
//					if (result2.next()) {
//						// Lấy dữ liệu ảnh
//						Blob dataanh = result3.getBlob("dataanh");
//						imageData = dataanh.getBytes(1, (int) dataanh.length());
//					}
//					SACH sach = new SACH(masach, tensach, tacgia, giaban, imageData);
//					listBook.add(sach);
//				}
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return listBook;
//	}

//	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
//		// tensach , gia,
//		ArrayList<SACH> listBook = new ArrayList<SACH>();
//		try {
//			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
//			String sql = "SELECT * FROM sach WHERE idtheloai = ?";
//			PreparedStatement pst = conn.prepareStatement(sql);
//			pst.setInt(1, idtheloai);
//			ResultSet result = pst.executeQuery();
//			while (result.next()) {
//				String masach = result.getString("masach");
//				String tensach = result.getString("tensach");
//				String tacgia = result.getString("tacgia");
//				Float giaban = result.getFloat("giaban");
//				System.out.println("dao -> getallbook_tacgia: " + masach + ", " + tensach + ", " + tacgia + ", "+ giaban);
//
//				String sql3 = "SELECT dataanh FROM anh WHERE idsach = ?";
//				PreparedStatement pst3 = conn.prepareStatement(sql3);
//				pst3.setString(1, masach);
//				ResultSet result3 = pst3.executeQuery();
//				byte[] imageData = null;
//				if (result3.next()) {
//					// Lấy dữ liệu ảnh
//					Blob dataanh = result3.getBlob("dataanh");
//					imageData = dataanh.getBytes(1, (int) dataanh.length());
//				}
//				SACH sach = new SACH(masach, tensach, tacgia, giaban, imageData);
//				listBook.add(sach);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return listBook;
//	}
	
//	public ArrayList<SACH> getAllBook_search(String search) {
//		// tensach , gia,
//		System.out.println("dao -> getallbook_search -> search: " + search);
//		ArrayList<SACH> listBook = new ArrayList<SACH>();
//		try {
//			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
//			String sql = "SELECT * FROM sach WHERE tensach LIKE ? or tacgia LIKE ?";
//			PreparedStatement pst = conn.prepareStatement(sql);
//			pst.setString(1, "%" + search + "%");
//			pst.setString(2, "%" + search + "%");
//			ResultSet result = pst.executeQuery();
//			while (result.next()) {
//				String masach = result.getString("masach");
//				String tensach = result.getString("tensach");
//				String tacgia = result.getString("tacgia");
//				Float giaban = result.getFloat("giaban");
//				System.out.println("dao -> getallbook_tacgia: " + masach + ", " + tensach + ", " + tacgia + ", "+ giaban);
//
//				String sql3 = "SELECT dataanh FROM anh WHERE idsach = ?";
//				PreparedStatement pst3 = conn.prepareStatement(sql3);
//				pst3.setString(1, masach);
//				ResultSet result3 = pst3.executeQuery();
//				byte[] imageData = null;
//				if (result3.next()) {
//					// Lấy dữ liệu ảnh
//					Blob dataanh = result3.getBlob("dataanh");
//					imageData = dataanh.getBytes(1, (int) dataanh.length());
//				}
//				SACH sach = new SACH(masach, tensach, tacgia, giaban, imageData);
//				listBook.add(sach);
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return listBook;
//	}

	public ArrayList<THELOAI> getAllTheLoai() {
		ArrayList<THELOAI> listTheloai = new ArrayList<THELOAI>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM theloai";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				int idtheloai = result.getInt("idtheloai");
				String tentheloai = result.getString("tentheloai");
				THELOAI theloai = new THELOAI(idtheloai, tentheloai);
				listTheloai.add(theloai);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listTheloai;
	}

	public ArrayList<TACGIA> getAllTacgia() {
		ArrayList<TACGIA> listTacgia = new ArrayList<TACGIA>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM tacgia";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				int idtacgia = result.getInt("idtacgia");
				String tentacgia = result.getString("tentacgia");
				TACGIA tacgia = new TACGIA(idtacgia, tentacgia);
				listTacgia.add(tacgia);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listTacgia;
	}


	// ====== USER -> FEATURED BOOKS
	public ArrayList<SACH> getFeaturedBook() {
		ArrayList<SACH> listFeaturedBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY (soluongtong - soluongconlai) DESC LIMIT 4";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				System.out.println("dao -> getallbook: " + masach + ", " + tensach + ", " + tacgia + ", " + giaban);

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listFeaturedBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listFeaturedBook;
	}
	
	// ====== USER -> BEST SELLING
	public SACH getBookBestSelling() {
	    SACH sach = null; // Khởi tạo đối tượng
	    try {
	    	//
	    	Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY (soluongtong - soluongconlai) DESC LIMIT 1;";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				System.out.println("dao -> getallbook: " + masach + ", " + tensach + ", " + tacgia + ", " + giaban);

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
			}
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return sach;
	}
	// ====== USER -> POPULAR BOOK -> ALL
	public ArrayList<SACH> getBookPopular_All() {
		ArrayList<SACH> listBookPopular_All = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
	        String sql = "SELECT * FROM sach ORDER BY (soluongtong - soluongconlai) DESC LIMIT 8";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	        while(rs.next()) {
	        	String masach = rs.getString("masach");
	        	String tensach = rs.getString("tensach");
	        	String tacgia = rs.getString("tacgia");
	        	float giaban = rs.getFloat("giaban");
	        	
	        	
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookPopular_All;
	}
	
	
	//======================================
	public ArrayList<SACH> getBookBanner() {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY giaban DESC LIMIT 2";
			PreparedStatement pst = conn.prepareStatement(sql);

			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				System.out.println("dao -> getallbook: " + masach + ", " + tensach + ", " + tacgia + ", " + giaban);

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	
	public ArrayList<SACH> getAllBook_genre_featured(int idtheloai) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ? LIMIT 4";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	
	public ArrayList<SACH> getBookOffer() {
		ArrayList<SACH> listBookOffer = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY giamgia DESC LIMIT 8";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota"); 
				
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBookOffer.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookOffer;
	} 
	
	public ArrayList<SACH> getBookNewAuthor() {
		ArrayList<SACH> listBookNewAuthor = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT tentacgia FROM tacgia ORDER BY idtacgia DESC LIMIT 4";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String tentacgia = rs.getString("tentacgia");
				
				String sql2 = "SELECT * FROM sach WHERE tacgia = ? LIMIT 1";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, tentacgia);
				ResultSet rs2 = pst2.executeQuery();
				while(rs2.next()) {
					String masach = rs2.getString("masach");
					String tensach = rs2.getString("tensach");
					String tacgia = rs2.getString("tacgia");
					Float giaban = rs2.getFloat("giaban");
					int giamgia = rs2.getInt("giamgia");
					String mota = rs2.getString("mota"); 
					
					
					String sql3 = "SELECT tenanh FROM anhsach WHERE masach = ?";
					PreparedStatement pst3 = conn.prepareStatement(sql3);
					pst3.setString(1, masach);
					ResultSet rs3 = pst3.executeQuery();
					String tenanh = null;
					if (rs3.next()) {
						tenanh = rs3.getString("tenanh");
					}
					float giauudai = giaban - giaban * (float)(giamgia/100.0f);
					
					SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
					listBookNewAuthor.add(sach);
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookNewAuthor;
	}
	
	public ArrayList<SACH> getAllBook_genre(int idtheloai) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	public String getNameGenre(int idtheloai) {
		String tenTheLoai = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT tentheloai FROM theloai WHERE idtheloai = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				tenTheLoai = result.getString("tentheloai"); 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tenTheLoai;
	}
	
	public SACH getBook(String masachdetail) {
		SACH sach = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE masach = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, masachdetail);
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota"); 
				
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sach;
	}
	
	public ArrayList<SACH> getBookRelated(String masachdetail) {
		ArrayList<SACH> listBookRelated = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			// lấy ra thể loại của sách đang tìm 
			String sql = "SELECT idtheloai FROM sach WHERE masach = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, masachdetail);
			ResultSet rs = pst.executeQuery();
			int idtheloai = 0;
			if(rs.next()) {
				idtheloai = rs.getInt("idtheloai");
			}
			
			// list book tương tự 
			String sql2 = "SELECT * FROM sach WHERE idtheloai = ? and masach <> ?";
			PreparedStatement pst2 = conn.prepareStatement(sql2);
			pst2.setInt(1, idtheloai);
			pst2.setString(2, masachdetail);
			ResultSet rs2 = pst2.executeQuery();
			while(rs2.next()) {
				String masach = rs2.getString("masach");
				String tensach = rs2.getString("tensach");
				String tacgia = rs2.getString("tacgia");
				Float giaban = rs2.getFloat("giaban");
				int giamgia = rs2.getInt("giamgia");
				String mota = rs2.getString("mota"); 
				
				String sql3 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setString(1, masach);
				ResultSet rs3 = pst3.executeQuery();
				String tenanh = null;
				if (rs3.next()) {
					tenanh = rs3.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBookRelated.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookRelated;
	}
	
	public ArrayList<SACH> getAllBook_genre_search(int idtheloai, String search) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ? and (tensach LIKE ? or tacgia LIKE ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			pst.setString(2, "%" + search + "%");
			pst.setString(3, "%" + search + "%");
			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");

				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	public ArrayList<SACH> getBookSearch(String search, int idtheloai) {
		ArrayList<SACH> listBookSearch = new ArrayList<SACH>();
		
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ? and (tensach LIKE ? or tacgia LIKE ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idtheloai);
			pst.setString(2, "%" + search + "%");
			pst.setString(3, "%" + search + "%");
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				Float giaban = result.getFloat("giaban");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota"); 
				
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				float giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				SACH sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);
				listBookSearch.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookSearch;
	}
	public void addBookToCart(String makhachhang, String masach, int soluong) {
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String selectQuery = "SELECT soluong FROM giohang WHERE makhachhang = ? AND masach = ?";
		    try (PreparedStatement selectStatement = conn.prepareStatement(selectQuery)) {
		        selectStatement.setString(1, makhachhang);
		        selectStatement.setString(2, masach);

		        try (ResultSet resultSet = selectStatement.executeQuery()) {
		            if (resultSet.next()) {
		                // Nếu đã tồn tại, tính toán giá trị mới và thực hiện UPDATE
		                int soluongHienTai = resultSet.getInt("soluong");
		                int soluongMoi = soluongHienTai + soluong;

		                String updateQuery = "UPDATE giohang SET soluong = ? WHERE makhachhang = ? AND masach = ?";
		                try (PreparedStatement updateStatement = conn.prepareStatement(updateQuery)) {
		                    updateStatement.setInt(1, soluongMoi);
		                    updateStatement.setString(2, makhachhang);
		                    updateStatement.setString(3, masach);
		                    updateStatement.executeUpdate();
		                }
		            } else {
		                // Nếu chưa tồn tại, thực hiện INSERT
		                String insertQuery = "INSERT INTO giohang (makhachhang, masach, soluong) VALUES (?, ?, ?)";
		                try (PreparedStatement insertStatement = conn.prepareStatement(insertQuery)) {
		                    insertStatement.setString(1, makhachhang);
		                    insertStatement.setString(2, masach);
		                    insertStatement.setInt(3, soluong);
		                    insertStatement.executeUpdate();
		                }
		            }
		        }
		    }
			conn.close();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	public String getMaKhachHang(String username) {
		String makhachhang="";
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM taikhoan WHERE username = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			ResultSet result = pst.executeQuery();
			int id = 0;
			if (result.next()) {
				id = result.getInt("idtaikhoan");

			}
			String sql2 = "SELECT * FROM khachhang WHERE idtaikhoan = ?";
			PreparedStatement pst2 = conn.prepareStatement(sql2);
			pst2.setInt(1, id);
			ResultSet result2 = pst2.executeQuery();
			if (result2.next()) {
				makhachhang = result2.getString("makhachhang");
			}
			return makhachhang;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return makhachhang;
	}
	public ArrayList<GIOHANG> getGioHangList(String makh) {
		ArrayList<GIOHANG> result = new ArrayList<GIOHANG>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String query = "SELECT giohang.masach, sach.tensach, sach.giaban, giohang.soluong, anhsach.tenanh, sach.giamgia " +
                    "FROM giohang " +
                    "JOIN sach ON giohang.masach = sach.masach " +
                    "LEFT JOIN anhsach ON giohang.masach = anhsach.masach " +
                    "WHERE giohang.makhachhang = ?";

			// Sử dụng PreparedStatement để tránh các vấn đề an toàn về SQL Injection
		    PreparedStatement preparedStatement = conn.prepareStatement(query);
		    preparedStatement.setString(1, makh);
		    
		    System.out.println(preparedStatement);
		     
		    ResultSet resultSet = preparedStatement.executeQuery();
		    GIOHANG cur = new GIOHANG();
		    while (resultSet.next()) {
		    	cur = new GIOHANG();
		    	cur.setMaSach(resultSet.getString("masach"));
		    	cur.setTenSach(resultSet.getString("tensach"));
		    	cur.setGiaBan(resultSet.getInt("giaban"));
		    	cur.setSoLuong(resultSet.getInt("soluong"));
		    	cur.setGiamGia(resultSet.getInt("giamgia"));
		    	cur.setTenAnh(resultSet.getString("tenanh"));
		    	
                String masach = resultSet.getString("masach");
                String tensach = resultSet.getString("tensach");
                int giaban = resultSet.getInt("giaban");
                int soluong = resultSet.getInt("soluong");
                
                result.add(cur);
                // Xử lý dữ liệu, ví dụ: in ra màn hình
                System.out.println("Masach: " + masach + ", Tensach: " + tensach + ", Soluong: " + soluong);
		     }
		     
		    conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	public void deleteGioHang(String makh, String masach) {
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String query = "DELETE FROM giohang WHERE makhachhang = ? AND masach = ?";

			// Sử dụng PreparedStatement để tránh các vấn đề an toàn về SQL Injection
		    PreparedStatement preparedStatement = conn.prepareStatement(query);
		    preparedStatement.setString(1, makh);
		    preparedStatement.setString(2, masach);
		    
		    System.out.println("query: " + preparedStatement);
		     
		    int rowsAffected = preparedStatement.executeUpdate();
		    if(rowsAffected > 0) {
		    	System.out.println("Xoa thanh cong!!!!!");
		    }
		     
		    conn.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void insertDonHang(String makh, ArrayList<GIOHANG> giohang) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT madonhang FROM donhang WHERE makhachhang = ? ";
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, makh);
			
			System.out.println("query: " + preparedStatement);
			
			ResultSet rs = preparedStatement.executeQuery();
			String madonhang = makh + "_";
			int index = 1;
//			if(rs.next()) {
//				String madh = rs.getString("madonhang");
//				String[] array = madh.split("_");
//				System.out.println("Ma don hang: " + madh);
//				for(int i = 0; i < array.length; i++) {
//					System.out.println(array[i]);
//				}
//				index = Integer.parseInt(array[2]) + 1;
//				madonhang = madonhang + index;
//			}
//			else {
//				index = 1;
//				madonhang = madonhang + index;
//			}
			Vector<Integer> vector = new Vector<>();			
			int cnt = 0;
			while(rs.next()) {
				String madh = rs.getString("madonhang");
				String[] array = madh.split("_");
				int cur = Integer.parseInt(array[2]);
				vector.add(cur);
			}
			if(vector.size() > 0) {
				Collections.sort(vector);
				index = vector.lastElement() + 1;
			}
	        
	        
			
			madonhang = madonhang + index;
			Date currentDate = new Date(Calendar.getInstance().getTime().getTime());
			String query = "INSERT INTO donhang (madonhang, makhachhang, ngaydathang, tinhtrang) VALUES (?, ?, ?, ?)";
			PreparedStatement preparedStatement2 = conn.prepareStatement(query);
			preparedStatement2.setString(1, madonhang);
			preparedStatement2.setString(2, makh);
			preparedStatement2.setDate(3, currentDate);
			preparedStatement2.setInt(4, 0);
			
			
			System.out.println("query: " + preparedStatement2);
			
			int rowsAffected = preparedStatement2.executeUpdate();
		    if(rowsAffected > 0) {
		    	System.out.println("Them thanh cong!!!!!");
		    }
		    else return;
		    
		    query = "";
		    for(int i = 0; i < giohang.size(); i++) {
		    	query = "INSERT INTO chitietdonhang (madonhang, masach, soluong) VALUES (?, ?, ?)";
		    	preparedStatement = conn.prepareStatement(query);
		    	preparedStatement.setString(1, madonhang);
		    	preparedStatement.setString(2, giohang.get(i).getMaSach());
		    	preparedStatement.setInt(3, giohang.get(i).getSoLuong());
		    	
		    	rowsAffected = preparedStatement.executeUpdate();
		    	
		    	int soluongban = giohang.get(i).getSoLuong();
		    	query = "UPDATE sach SET soluongconlai = soluongconlai - ? WHERE masach = ? ";
		    	preparedStatement = conn.prepareStatement(query);
		    	preparedStatement.setInt(1, giohang.get(i).getSoLuong());
		    	preparedStatement.setString(2, giohang.get(i).getMaSach());
		    	
		    	rowsAffected = preparedStatement.executeUpdate();
		    	
		    	deleteGioHang(makh, giohang.get(i).getMaSach());
		    }

		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
	}
	
	public void updateGioHang(String makh, ArrayList<GIOHANG> giohang) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3307/bookstore", "root", "");
			String query = "UPDATE giohang SET soluong = ? WHERE makhachhang = ? AND masach = ?";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			
			for(int i = 0; i < giohang.size(); i++) {
				preparedStatement.setInt(1, giohang.get(i).getSoLuong());
				preparedStatement.setString(2, makh);
				preparedStatement.setString(3, giohang.get(i).getMaSach());
				
				int rowsAffected = preparedStatement.executeUpdate();
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ArrayList<DONHANG> getAllOrder_confirm(String makh) {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ? AND makhachhang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 0);
			p.setString(2, makh);
			ResultSet r = p.executeQuery();
			while(r.next()) {
				String madonhang = r.getString("madonhang");
				String makhachhang = r.getString("makhachhang");
				Date ngaydathang = r.getDate("ngaydathang");
				int tinhtrang = r.getInt("tinhtrang");
				DONHANG donhang = new DONHANG(madonhang, makhachhang, ngaydathang, tinhtrang);
				listOrder.add(donhang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listOrder;
	}
	
	public ArrayList<DONHANG> getAllOrder_completed(String makh) {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ? AND makhachhang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 1);
			p.setString(2, makh);
			ResultSet r = p.executeQuery();
			while(r.next()) {
				String madonhang = r.getString("madonhang");
				String makhachhang = r.getString("makhachhang");
				Date ngaydathang = r.getDate("ngaydathang");
				int tinhtrang = r.getInt("tinhtrang");
				DONHANG donhang = new DONHANG(madonhang, makhachhang, ngaydathang, tinhtrang);
				listOrder.add(donhang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listOrder;
	}
	
	public ArrayList<DONHANG> getAllOrder_can(String makh) {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ? AND makhachhang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 2);
			p.setString(2, makh);
			ResultSet r = p.executeQuery();
			while(r.next()) {
				String madonhang = r.getString("madonhang");
				String makhachhang = r.getString("makhachhang");
				Date ngaydathang = r.getDate("ngaydathang");
				int tinhtrang = r.getInt("tinhtrang");
				DONHANG donhang = new DONHANG(madonhang, makhachhang, ngaydathang, tinhtrang);
				listOrder.add(donhang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listOrder;
	}
	
	public ArrayList<CHITIETDONHANG> getAllOrderDetail(String madonhang) {
		ArrayList<CHITIETDONHANG> listOrderDetail = new ArrayList<CHITIETDONHANG>();
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM chitietdonhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String masach = rs.getString("masach");
				int soluong = rs.getInt("soluong");
				
				String sql2 = "SELECT * FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet rs2 = pst2.executeQuery();
				String tenanh = null;
				if(rs2.next()) {
					tenanh = rs2.getString("tenanh");
				}
				
				String sql3 = "SELECT * FROM sach WHERE masach = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setString(1, masach);
				ResultSet rs3 = pst3.executeQuery();
				String tensach = null;
				float giaban = 0;
				if(rs3.next()) {
					tensach = rs3.getString("tensach");
					giaban = rs3.getFloat("giaban");
				}
				
				CHITIETDONHANG chitietdonhang = new CHITIETDONHANG(madonhang, masach, tensach, tenanh, soluong, giaban);
				listOrderDetail.add(chitietdonhang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listOrderDetail;
	}
	
	public int getAllTotal(String madonhang) {
		int total = 0;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT SUM(soluong) AS tong_soluong FROM chitietdonhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				total = rs.getInt("tong_soluong");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	
	public float getAmountTotal(String madonhang) {
		float totalamount = 0;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			
			// lấy ra mã sach và số lượng 
			String sql = "SELECT * FROM chitietdonhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String masach = rs.getString("masach");
				int soluong = rs.getInt("soluong");
				
				String sql2 = "SELECT * FROM sach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()) {
					float giaban = rs2.getFloat("giaban");
					totalamount += soluong * giaban;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return totalamount;
	}
	
	public KHACHHANG getKH(String makhachhang) {
		KHACHHANG khachhang = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM khachhang WHERE makhachhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, makhachhang);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String hoten = rs.getString("hoten");
				String sdt = rs.getString("sdt");
				String email = rs.getString("email");
				String diachi = rs.getString("diachi");
				khachhang = new KHACHHANG(makhachhang, hoten, sdt, email, diachi);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return khachhang;
	}
	
	public KHACHHANG getKHang(String madonhang) {
		KHACHHANG khachhang = null;
		try {
//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				String makhachhang = rs.getString("makhachhang");
				
				String sql2 = "SELECT * FROM khachhang WHERE makhachhang = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, makhachhang);
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()) {
					String hoten = rs2.getString("hoten");
					String sdt = rs2.getString("sdt");
					String email = rs2.getString("email");
					String diachi = rs2.getString("diachi");
					khachhang = new KHACHHANG(makhachhang, hoten, sdt, email, diachi);
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return khachhang;
	}
	
	public DONHANG getOrder(String maDonhang) {
		DONHANG donhang = null;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, maDonhang);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				String makhachhang = rs.getString("makhachhang");
				Date ngaydathang = rs.getDate("ngaydathang");
				int tinhtrang = rs.getInt("tinhtrang");
				donhang = new DONHANG(maDonhang, makhachhang, ngaydathang, tinhtrang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return donhang;
	}
	public int getSoluongGioHang(String makhachhang) {
		int total = 0;
		try {
			//
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT COUNT(*) AS tong_soluong FROM giohang WHERE makhachhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, makhachhang);
			ResultSet rs = pst.executeQuery();
			System.out.println(pst);
			if (rs.next()) {
				total = rs.getInt("tong_soluong");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return total;
	}
	public float getAmountTotal2(String madonhang) {
		float totalamount = 0;
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			
			// lấy ra mã sach và số lượng 
			String sql = "SELECT * FROM chitietdonhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				String masach = rs.getString("masach");
				int soluong = rs.getInt("soluong");
				
				String sql2 = "SELECT * FROM sach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()) {
					float giaban = rs2.getFloat("giaban");
					int giamgia = rs2.getInt("giamgia");
					
					float giauudai = giaban - giaban * (float)(giamgia/100.0f);
					
					totalamount += soluong * giauudai;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return totalamount;
	}
	public int getTrangThai(String madonhang) {
		int trangThai = 0;
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				trangThai = rs.getInt("tinhtrang");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return trangThai;
	}
}
