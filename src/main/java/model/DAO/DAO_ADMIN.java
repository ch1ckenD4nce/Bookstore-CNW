package model.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;

public class DAO_ADMIN {
	public DAO_ADMIN() {
	}

	public ArrayList<SACH> getAllBook() {
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
				int idtheloai = result.getInt("idtheloai");
				float giaban = result.getFloat("giaban");
				int soluongtong = result.getInt("soluongtong");
				int soluongconlai = result.getInt("soluongconlai");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				int soluongdaban = result.getInt("soluongdaban");
				// lấy ảnh
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				// lấy tên thể loại
				String tentheloai = null;

				String sql3 = "SELECT tentheloai FROM theloai WHERE idtheloai = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setInt(1, idtheloai);
				ResultSet result3 = pst3.executeQuery();
				if (result3.next()) {
					tentheloai = result3.getString("tentheloai");
				}
				SACH sach = new SACH(masach, tensach, tacgia, giaban, soluongtong, soluongconlai, giamgia, mota, tenanh, tentheloai, soluongdaban);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
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
	
	public ArrayList<SACH> getAllBook_theloai(int idTheloai) {
		ArrayList<SACH> listBook = new ArrayList<SACH>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idTheloai);
			ResultSet result = pst.executeQuery();
			while (result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				int idtheloai = result.getInt("idtheloai");
				float giaban = result.getFloat("giaban");
				int soluongtong = result.getInt("soluongtong");
				int soluongconlai = result.getInt("soluongconlai");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				int soluongdaban = result.getInt("soluongdaban");
				// lấy ảnh
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				// lấy tên thể loại
				String tentheloai = null;

				String sql3 = "SELECT tentheloai FROM theloai WHERE idtheloai = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setInt(1, idtheloai);
				ResultSet result3 = pst3.executeQuery();
				if (result3.next()) {
					tentheloai = result3.getString("tentheloai");
				}
				SACH sach = new SACH(masach, tensach, tacgia, giaban, soluongtong, soluongconlai, giamgia, mota, tenanh, tentheloai, soluongdaban);
				listBook.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBook;
	}
	
	public boolean checkMaSach(String masach) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE masach = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, masach);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) return true;
			else return false;
		} catch (Exception e) {
		}
		return false;
	}

	public boolean THEMSACH(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban,
			int soluongtong, int giamgia, String mota, InputStream dataanh) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "INSERT INTO sach (masach, tensach, tacgia, nxb, idtheloai, giaban, soluongtong, soluongconlai, giamgia, mota) VALUES (?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, masach);
			pst.setString(2, tensach);
			pst.setString(3, tacgia);
			pst.setString(4, nxb);
			pst.setInt(5, idtheloai);
			pst.setFloat(6, giaban);
			pst.setInt(7, soluongtong);
			pst.setInt(8, soluongtong);
			pst.setInt(9, giamgia);
			pst.setString(10, mota);
			int rs = pst.executeUpdate();
			
			if(rs > 0) {
				String sql2 = "INSERT INTO anh (idsach, dataanh, tenanh) VALUES (?,?,?)";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				pst2.setBlob(2, dataanh);
				pst2.setString(3, "okok");
				int rs2 = pst2.executeUpdate();
				if (rs2 > 0) {
					return true;
				} else
					return false;
			} else return false;
		} catch (Exception e) {
		}
		return false;
	}

	public boolean insertBook(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int giamgia, String mota, String tenanh) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "INSERT INTO sach (masach, tensach, tacgia, nxb, idtheloai, giaban , giamgia, mota, soluongdaban) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, masach);
			pst.setString(2, tensach);
			pst.setString(3, tacgia);
			pst.setString(4, nxb);
			pst.setInt(5, idtheloai);
			pst.setFloat(6, giaban);
			pst.setInt(7, giamgia);
			pst.setString(8, mota);
			pst.setInt(9, 0);
			int rs = pst.executeUpdate();
			if (rs > 0) {
				String sql2 = "INSERT INTO anhsach (masach, tenanh) VALUES (?,?)";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				pst2.setString(2, tenanh);
				int rs2 = pst2.executeUpdate();
				if(rs2 > 0) {
					return true;
				} else return false;
			}
		} catch (Exception e) {
		}
		return false;
	}
	
	public boolean updateBook(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int giamgia, String mota, String tenanh) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "UPDATE sach SET tensach=?, tacgia=?, nxb=?, idtheloai=?, giaban=?, giamgia=?, mota=? WHERE masach=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, tensach);
			pst.setString(2, tacgia);
			pst.setString(3, nxb);
			pst.setInt(4, idtheloai);
			pst.setFloat(5, giaban);
			pst.setInt(6, giamgia);
			pst.setString(7, mota);
			pst.setString(8, masach);
			int rs = pst.executeUpdate();
			if (rs > 0) {
				if(tenanh != null && !tenanh.isEmpty()) {
					String sql2 = "UPDATE anhsach SET tenanh=? WHERE masach=?";
					PreparedStatement pst2 = conn.prepareStatement(sql2);
					pst2.setString(1, tenanh);
					pst2.setString(2, masach);
					int rs2 = pst2.executeUpdate();
					if(rs2 > 0) {
						return true;
					} else return false;
				} else return true;
			}
		} catch (Exception e) {
		}
		return false;
	}
	
	public SACH getBook(String maSach) {
		SACH sach = null;
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE masach = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, maSach);
			ResultSet result = pst.executeQuery();
			if(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				String nxb = result.getString("nxb");
				int idtheloai = result.getInt("idtheloai");
				Float giaban = result.getFloat("giaban");
				int soluongtong = result.getInt("soluongtong");
				int soluongconlai = result.getInt("soluongconlai");
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
				sach = new SACH(masach, tensach, tacgia, nxb, idtheloai, giaban, soluongtong, soluongconlai, giamgia, mota, tenanh);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return sach;
	}
	
	public ArrayList<SACH> getBookSearch(String search, int idTheloai) {
		ArrayList<SACH> listBookSearch = new ArrayList<SACH>();
		
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE idtheloai = ? and (tensach LIKE ? or tacgia LIKE ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, idTheloai);
			pst.setString(2, "%" + search + "%");
			pst.setString(3, "%" + search + "%");
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				int idtheloai = result.getInt("idtheloai");
				float giaban = result.getFloat("giaban");
				int soluongtong = result.getInt("soluongtong");
				int soluongconlai = result.getInt("soluongconlai");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				int soluongdaban = result.getInt("soluongdaban");
				// lấy ảnh
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				// lấy tên thể loại
				String tentheloai = null;

				String sql3 = "SELECT tentheloai FROM theloai WHERE idtheloai = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setInt(1, idtheloai);
				ResultSet result3 = pst3.executeQuery();
				if (result3.next()) {
					tentheloai = result3.getString("tentheloai");
				}
				SACH sach = new SACH(masach, tensach, tacgia, giaban, soluongtong, soluongconlai, giamgia, mota, tenanh, tentheloai, soluongdaban);
				listBookSearch.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookSearch;
	}
	
	public ArrayList<SACH> getBookSearch_all(String search) {
		ArrayList<SACH> listBookSearch_all = new ArrayList<SACH>();
		
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM sach WHERE tensach LIKE ? or tacgia LIKE ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + search + "%");
			pst.setString(2, "%" + search + "%");
			ResultSet result = pst.executeQuery();
			while(result.next()) {
				String masach = result.getString("masach");
				String tensach = result.getString("tensach");
				String tacgia = result.getString("tacgia");
				int idtheloai = result.getInt("idtheloai");
				float giaban = result.getFloat("giaban");
				int soluongtong = result.getInt("soluongtong");
				int soluongconlai = result.getInt("soluongconlai");
				int giamgia = result.getInt("giamgia");
				String mota = result.getString("mota");
				int soluongdaban = result.getInt("soluongdaban");
				// lấy ảnh
				String sql2 = "SELECT tenanh FROM anhsach WHERE masach = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, masach);
				ResultSet result2 = pst2.executeQuery();
				String tenanh = null;
				if (result2.next()) {
					tenanh = result2.getString("tenanh");
				}
				// lấy tên thể loại
				String tentheloai = null;

				String sql3 = "SELECT tentheloai FROM theloai WHERE idtheloai = ?";
				PreparedStatement pst3 = conn.prepareStatement(sql3);
				pst3.setInt(1, idtheloai);
				ResultSet result3 = pst3.executeQuery();
				if (result3.next()) {
					tentheloai = result3.getString("tentheloai");
				}
				SACH sach = new SACH(masach, tensach, tacgia, giaban, soluongtong, soluongconlai, giamgia, mota, tenanh, tentheloai, soluongdaban);
				listBookSearch_all.add(sach);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return listBookSearch_all;
	}
	
	public ArrayList<DONHANG> getAllOrder_confirm() {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 0);
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
	
	public ArrayList<DONHANG> getAllOrder_completed() {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 1);
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
	
	public ArrayList<DONHANG> getAllOrder_can() {
		ArrayList<DONHANG> listOrder = new ArrayList<DONHANG>();
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE tinhtrang = ?";
			PreparedStatement p = conn.prepareStatement(sql);
			p.setInt(1, 2);
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
				float giauudai = 0;
				if(rs3.next()) {
					tensach = rs3.getString("tensach");
					giaban = rs3.getFloat("giaban");
					int giamgia = rs3.getInt("giamgia");
					
					giauudai = giaban - giaban * (float)(giamgia/100.0f);
				
				}
				
				CHITIETDONHANG chitietdonhang = new CHITIETDONHANG(madonhang, masach, tensach, tenanh, soluong, giaban, giauudai);
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
	
	public KHACHHANG getKH(String makhachhang) {
		KHACHHANG khachhang = null;
		try {
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
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "SELECT * FROM donhang WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, maDonhang);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				String madonhang = rs.getString("madonhang");
				String makhachhang = rs.getString("makhachhang");
				Date ngaydathang = rs.getDate("ngaydathang");
				int tinhtrang = rs.getInt("tinhtrang");
				donhang = new DONHANG(madonhang, makhachhang, ngaydathang, tinhtrang);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return donhang;
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
	
//	public ArrayList<CHITIETDONHANG> getOrderDetail(String madonhang) {
//		ArrayList<CHITIETDONHANG> listOrderDetail = new ArrayList<CHITIETDONHANG>();
//		try {
//			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
//			String sql = "SELECT * FROM chitietdonhang WHERE madonhang = ?";
//			PreparedStatement pst = conn.prepareStatement(sql);
//			pst.setString(1, madonhang);
//			ResultSet rs = pst.executeQuery();
//			if(rs.next()) {
//				String masach = rs.getString("masach");
//				int soluong = rs.getInt("soluong");
//				
//				CHITIETDONHANG chitietdonhang = new CHITIETDONHANG(madonhang, masach, masach, masach, soluong, soluong)
//				
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return chitietdonhang;
//	}
	
	public void ConfirmOrder(String madonhang) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "UPDATE donhang SET tinhtrang = 1 WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			int rs = pst.executeUpdate();
			
			if(rs > 0) {
				String sql2 = "SELECT * FROM chitietdonhang WHERE madonhang = ?";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				pst2.setString(1, madonhang);
				ResultSet rs2 = pst2.executeQuery();
				while(rs2.next()) {
					String masach = rs2.getString("masach");
					int soluong = rs2.getInt("soluong");
					
					String sql3 = "UPDATE sach SET soluongdaban = soluongdaban + ? WHERE masach = ?";
					PreparedStatement pst3 = conn.prepareStatement(sql3);
					pst3.setInt(1, soluong);
					pst3.setString(2, masach);
					int rs3 = pst3.executeUpdate();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void CancelledOrder(String madonhang) {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mySQL://localhost:3306/bookstore", "root", "");
			String sql = "UPDATE donhang SET tinhtrang = 2 WHERE madonhang = ?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, madonhang);
			int rs = pst.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
