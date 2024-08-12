package model.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;

public class DAO_GUEST {
	public DAO_GUEST() {
	}
	
	public boolean CheckLogin(String username, String password) {
		try {
//			Class.forName("com.mysql.jdbc.Driver");
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
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean Singup(String hoten,String gioitinh, Date ngaySinhDate,String diachi, String sdt, String email, String username, String password) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT makhachhang FROM khachhang ORDER BY makhachhang DESC LIMIT 1";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				String makhachhang = rs.getString("makhachhang");
				String[] array = makhachhang.split("_");
				int index = Integer.parseInt(array[1]) + 1;
				
				String sql2 = "INSERT INTO taikhoan (username, password, quyen) VALUES (?, ?, ?)";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, username);
				pst2.setString(2, password);
				pst2.setString(3, "USER");
				int rs2 = pst2.executeUpdate();
				if(rs2 > 0) {
					String sql3 = "SELECT idtaikhoan FROM taikhoan WHERE username = ? and password = ?";
					PreparedStatement pst3 = conn.prepareStatement(sql3);
					pst3.setString(1, username);
					pst3.setNString(2, password);
					ResultSet rs3 = pst3.executeQuery();
					if(rs3.next()) {
						int idtaikhoan = rs3.getInt("idtaikhoan");
						
						
						String sql4 = "INSERT INTO khachhang (makhachhang, hoten, gioitinh, ngaysinh, diachi, sdt, email, idtaikhoan) VALUES (?,?,?,?,?,?,?,?)";
						PreparedStatement pst4 = conn.prepareStatement(sql4);
						pst4.setString(1, "US_"+index);
						pst4.setString(2, hoten);
						pst4.setString(3, gioitinh);
						pst4.setDate(4, ngaySinhDate);
						pst4.setString(5, diachi);
						pst4.setString(6, sdt);
						pst4.setString(7, email);
						pst4.setInt(8, idtaikhoan);
						
						int rs4 = pst4.executeUpdate();
						return rs4 > 0;
					}
				}
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	
	public String getNameUser(String username) {
		String nameUser = null;
		try {
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
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return nameUser;
	}
	
	public String getQuyen(String username) {
		String quyen = null;
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT quyen FROM taikhoan WHERE username = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);

			ResultSet result = pst.executeQuery();
			if (result.next()) {
				quyen = result.getString("quyen");
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return quyen;
	}
	
	public ArrayList<THELOAI> getAllTheLoai() {
		ArrayList<THELOAI> listTheloai = new ArrayList<THELOAI>();
		try {
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
	
	public ArrayList<SACH> getAllBook() {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
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
	
	public ArrayList<SACH> getAllBook_genre(int idtheloai) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
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
	
	public ArrayList<SACH> getAllBook_genre_search(int idtheloai, String search) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
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
	
	public ArrayList<SACH> getAllBook_genre_featured(int idtheloai) {
		// mã sách , tên sách, tác giả, giá bán, ảnh
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
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
	
	
	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
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
	
	public ArrayList<TACGIA> getAllTacgia() {
		ArrayList<TACGIA> listTacgia = new ArrayList<TACGIA>();
		try {
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
	
	public ArrayList<SACH> getBookBanner() {
		ArrayList<SACH> listBookBanner = new ArrayList<SACH>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY giaban DESC LIMIT 2";
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
				listBookBanner.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookBanner;
	}
	
	public ArrayList<SACH> getBookFeatured() {
		ArrayList<SACH> listBookBanner = new ArrayList<SACH>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY (soluongtong - soluongconlai) DESC LIMIT 4";
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
				listBookBanner.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookBanner;
	} 
	
	public ArrayList<SACH> getBookOffer() {
		ArrayList<SACH> listBookOffer = new ArrayList<SACH>();
		try {
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
	
	public SACH getBookBestSelling() {
		SACH sach = null;
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach ORDER BY (soluongtong - soluongconlai) DESC LIMIT 1";
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
				sach = new SACH(masach, tensach, tacgia, giaban, giamgia, giauudai, mota, tenanh);			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sach;
	} 
	
	public SACH getBook(String masachdetail) {
		SACH sach = null;
		try {
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
	
	public ArrayList<SACH> getBookSearch(String search, int idtheloai) {
		ArrayList<SACH> listBookSearch = new ArrayList<SACH>();
		
		try {
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
	
	public ArrayList<SACH> getBookNewAuthor() {
		ArrayList<SACH> listBookNewAuthor = new ArrayList<SACH>();
		try {
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
}
