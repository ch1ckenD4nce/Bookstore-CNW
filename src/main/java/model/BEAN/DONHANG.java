package model.BEAN;

import java.sql.Date;

public class DONHANG {
	private String MaDonHang;
	private String MaKhachHang;
	private Date NgayDatHang;
	private String TenKhachHang;
	private String DiaChi;
	private String Sdt;
	private String TenAnh;
	private String MaSach;
	private String TenSach;
	private int Soluong;
	private float GiaBan;
	private float TongCong;
	private int TinhTrang;
	
	public DONHANG(String maDonHang, String maKhachHang, Date ngayDatHang, String tenKhachHang, String diaChi,
			String sdt, String tenAnh, String maSach, String tenSach, int soluong, float giaBan, float tongCong, int tinhtrang) {
		super();
		MaDonHang = maDonHang;
		MaKhachHang = maKhachHang;
		NgayDatHang = ngayDatHang;
		TenKhachHang = tenKhachHang;
		DiaChi = diaChi;
		Sdt = sdt;
		TenAnh = tenAnh;
		MaSach = maSach;
		TenSach = tenSach;
		Soluong = soluong;
		GiaBan = giaBan;
		TongCong = tongCong;
		TinhTrang = tinhtrang;
	}
	
	

	public DONHANG(String maDonHang, String maKhachHang, Date ngayDatHang, int tinhTrang) {
		super();
		MaDonHang = maDonHang;
		MaKhachHang = maKhachHang;
		NgayDatHang = ngayDatHang;
		TinhTrang = tinhTrang;
	}



	public int getTinhTrang() {
		return TinhTrang;
	}



	public void setTinhTrang(int tinhTrang) {
		TinhTrang = tinhTrang;
	}



	public String getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		MaDonHang = maDonHang;
	}

	public String getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		MaKhachHang = maKhachHang;
	}

	public Date getNgayDatHang() {
		return NgayDatHang;
	}

	public void setNgayDatHang(Date ngayDatHang) {
		NgayDatHang = ngayDatHang;
	}

	public String getTenKhachHang() {
		return TenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		TenKhachHang = tenKhachHang;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getSdt() {
		return Sdt;
	}

	public void setSdt(String sdt) {
		Sdt = sdt;
	}

	public String getTenAnh() {
		return TenAnh;
	}

	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}

	public String getMaSach() {
		return MaSach;
	}

	public void setMaSach(String maSach) {
		MaSach = maSach;
	}

	public String getTenSach() {
		return TenSach;
	}

	public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}

	public int getSoluong() {
		return Soluong;
	}

	public void setSoluong(int soluong) {
		Soluong = soluong;
	}

	public float getGiaBan() {
		return GiaBan;
	}

	public void setGiaBan(float giaBan) {
		GiaBan = giaBan;
	}

	public float getTongCong() {
		return TongCong;
	}

	public void setTongCong(float tongCong) {
		TongCong = tongCong;
	}
	
	
}
