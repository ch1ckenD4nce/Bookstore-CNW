package model.BEAN;

import java.sql.Blob;

public class SACH {
	private String MaSach;
	private String TenSach;
	private String TacGia;
	private String NXB;
	private int idTheLoai;
	private float GiaBan;
	private int SoLuongTong;
	private int SoLuongConLai;
	private int GiamGia;
	private String MoTa;

	private byte[] Anh;
	private String TenTheLoai;
	private String TenAnh;
	private float GiaUuDai;

	private int SoLuongDaBan;

	// ADMIN -> list book
	public SACH(String maSach, String tenSach, String tacGia, float giaBan, int soLuongTong, int soLuongConLai,
			int giamGia, String moTa, String tenanh, String tentheloai, int soluongdaban) {
		super();
		MaSach = maSach;
		TenSach = tenSach;
		TacGia = tacGia;
		TenTheLoai = tentheloai;
		GiaBan = giaBan;
		SoLuongTong = soLuongTong;
		SoLuongConLai = soLuongConLai;
		GiamGia = giamGia;
		MoTa = moTa;
		TenAnh = tenanh;
		SoLuongDaBan = soluongdaban;
	}

	// USER -> LIST BOOK
	public SACH(String masach, String tensach, String tacgia, float giaban, int giamgia, float giauudai, String mota,
			String tenanh) {
		MaSach = masach;
		TenSach = tensach;
		TacGia = tacgia;
		GiaBan = giaban;
		GiamGia = giamgia;
		GiaUuDai = giauudai;
		MoTa = mota;
		TenAnh = tenanh;
	}

	public SACH(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int soluongtong,
			int soluongconlai, int giamgia, String mota, String tenanh) {
		MaSach = masach;
		TenSach = tensach;
		TacGia = tacgia;
		NXB = nxb;
		idTheLoai = idtheloai;
		GiaBan = giaban;
		SoLuongTong = soluongtong;
		SoLuongConLai = soluongconlai;
		GiamGia = giamgia;
		MoTa = mota;
		TenAnh = tenanh;

	}

	public int getSoLuongDaBan() {
		return SoLuongDaBan;
	}

	public void setSoLuongDaBan(int soLuongDaBan) {
		SoLuongDaBan = soLuongDaBan;
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

	public String getTacGia() {
		return TacGia;
	}

	public void setTacGia(String tacGia) {
		TacGia = tacGia;
	}

	public String getNXB() {
		return NXB;
	}

	public void setNXB(String nXB) {
		NXB = nXB;
	}

	public int getIdTheLoai() {
		return idTheLoai;
	}

	public void setIdTheLoai(int idTheLoai) {
		this.idTheLoai = idTheLoai;
	}

	public float getGiaBan() {
		return GiaBan;
	}

	public void setGiaBan(float giaBan) {
		GiaBan = giaBan;
	}

	public int getSoLuongTong() {
		return SoLuongTong;
	}

	public void setSoLuongTong(int soLuongTong) {
		SoLuongTong = soLuongTong;
	}

	public int getSoLuongConLai() {
		return SoLuongConLai;
	}

	public void setSoLuongConLai(int soLuongConLai) {
		SoLuongConLai = soLuongConLai;
	}

	public int getGiamGia() {
		return GiamGia;
	}

	public void setGiamGia(int giamGia) {
		GiamGia = giamGia;
	}

	public String getMoTa() {
		return MoTa;
	}

	public void setMoTa(String moTa) {
		MoTa = moTa;
	}

	public byte[] getAnh() {
		return Anh;
	}

	public void setAnh(byte[] anh) {
		this.Anh = anh;
	}

	public String getTentheloai() {
		return TenTheLoai;
	}

	public void setTentheloai(String tentheloai) {
		TenTheLoai = tentheloai;
	}

	public String getTenTheLoai() {
		return TenTheLoai;
	}

	public void setTenTheLoai(String tenTheLoai) {
		TenTheLoai = tenTheLoai;
	}

	public String getTenAnh() {
		return TenAnh;
	}

	public void setTenAnh(String tenAnh) {
		TenAnh = tenAnh;
	}

	public float getGiaUuDai() {
		return GiaUuDai;
	}

	public void setGiaUuDai(float giaUuDai) {
		GiaUuDai = giaUuDai;
	}

}
