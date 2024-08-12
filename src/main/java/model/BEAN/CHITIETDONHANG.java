package model.BEAN;

public class CHITIETDONHANG {
	private String MaDonHang;
	private String MaSach;
	private String TenSach;
	private String TenAnh;
	private int SoLuong;
	private float GiaBan;
	private float GiaUuDai;

	public CHITIETDONHANG(String maDonHang, String maSach, String tenSach, String tenAnh, int soLuong, float giaBan, float giaUuDai) {
		super();
		MaDonHang = maDonHang;
		MaSach = maSach;
		TenSach = tenSach;
		TenAnh = tenAnh;
		SoLuong = soLuong;
		GiaBan = giaBan;
		GiaUuDai = giaUuDai;
	}
	
	public CHITIETDONHANG(String maDonHang, String maSach, String tenSach, String tenAnh, int soLuong, float giaBan) {
		super();
		MaDonHang = maDonHang;
		MaSach = maSach;
		TenSach = tenSach;
		TenAnh = tenAnh;
		SoLuong = soLuong;
		GiaBan = giaBan;
	}
	
	

	public float getGiaUuDai() {
		return GiaUuDai;
	}



	public void setGiaUuDai(float giaUuDai) {
		GiaUuDai = giaUuDai;
	}



	public float getGiaBan() {
		return GiaBan;
	}


	public void setGiaBan(float giaBan) {
		GiaBan = giaBan;
	}


	public String getTenSach() {
		return TenSach;
	}


	public void setTenSach(String tenSach) {
		TenSach = tenSach;
	}


	public String getTenAnh() {
		return TenAnh;
	}


	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}


	public String getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(String maDonHang) {
		MaDonHang = maDonHang;
	}

	public String getMaSach() {
		return MaSach;
	}

	public void setMaSach(String maSach) {
		MaSach = maSach;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

}
