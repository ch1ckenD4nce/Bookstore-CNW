package model.BEAN;

import java.util.Date;

public class KHACHHANG {
	private String MaKhachHang;
	private String HoTen;
	private String GioiTinh;
	private Date NgaySinh;
	private String SDT;
	private String email;
	private int IdTaiKhoan;
	private String DiaChi;

	public KHACHHANG(String maKhachHang, String hoTen, String gioiTinh, Date ngaySinh, String sDT, String email,
			int idTaiKhoan) {
		super();
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		GioiTinh = gioiTinh;
		NgaySinh = ngaySinh;
		SDT = sDT;
		this.email = email;
		IdTaiKhoan = idTaiKhoan;
	}
	
	

	



	public KHACHHANG(String maKhachHang, String hoTen, String sDT, String email, String diaChi) {
		super();
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		SDT = sDT;
		this.email = email;
		DiaChi = diaChi;
	}







	public String getDiaChi() {
		return DiaChi;
	}







	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}







	public String getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		GioiTinh = gioiTinh;
	}

	public Date getNgaySinh() {
		return NgaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		NgaySinh = ngaySinh;
	}

	public String getSDT() {
		return SDT;
	}

	public void setSDT(String sDT) {
		SDT = sDT;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIdTaiKhoan() {
		return IdTaiKhoan;
	}

	public void setIdTaiKhoan(int idTaiKhoan) {
		IdTaiKhoan = idTaiKhoan;
	}

}
