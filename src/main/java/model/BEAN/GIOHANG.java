package model.BEAN;

public class GIOHANG {
	private String MaSach;
	private String TenSach;
	private int GiaBan;
	private int SoLuong;
	private String TenAnh;
	private int GiamGia;
	
	public GIOHANG() {
		
	}
	public GIOHANG(String maSach, String tenSach, int giaBan, int soLuong, String tenAnh, int giamGia) {
		super();
		MaSach = maSach;
		TenSach = tenSach;
		GiaBan = giaBan;
		SoLuong = soLuong;
		TenAnh = tenAnh;
		GiamGia = giamGia;
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
	public int getGiaBan() {
		return GiaBan;
	}
	public void setGiaBan(int giaBan) {
		GiaBan = giaBan;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public String getTenAnh() {
		return TenAnh;
	}
	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}
	public float getGiamGia() {
		return GiamGia;
	}
	public void setGiamGia(int giamGia) {
		GiamGia = giamGia;
	}
	
}