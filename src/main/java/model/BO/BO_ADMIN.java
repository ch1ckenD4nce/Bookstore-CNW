package model.BO;

import java.io.InputStream;
import java.util.ArrayList;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.DAO.DAO_ADMIN;

public class BO_ADMIN {
	public BO_ADMIN() {
	}
	
	public ArrayList<SACH> getAllBook() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllBook();
	}
	
	public ArrayList<THELOAI> getAllTheloai() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllTheLoai();
	}
	
	public ArrayList<TACGIA> getAllTacgia() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllTacgia();
	}
	
	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllBook_theloai(idtheloai);
	}
	
	public SACH getBook(String masach) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getBook(masach);
	}
	
	public boolean checkMaSach(String masach) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.checkMaSach(masach);
	}
	
	public boolean THEMSACH(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int soluongtong, int giamgia, String mota, InputStream dataanh) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.THEMSACH(masach, tensach, tacgia, nxb, idtheloai, giaban, soluongtong, giamgia, mota, dataanh);
	}
	
	public boolean insertBook(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int giamgia, String mota, String tenanh) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.insertBook(masach, tensach, tacgia, nxb, idtheloai, giaban, giamgia, mota, tenanh);
	}
	
	public boolean updateBook(String masach, String tensach, String tacgia, String nxb, int idtheloai, float giaban, int giamgia, String mota, String tenanh) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.updateBook(masach, tensach, tacgia, nxb, idtheloai, giaban, giamgia, mota, tenanh);
	}
	
	public ArrayList<SACH> getBookSearch(String search, int idtheloai) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getBookSearch(search, idtheloai);
	}
	public void ConfirmOrder(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		dao.ConfirmOrder(madonhang);
	}
	
	public void CancelledOrder(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		dao.CancelledOrder(madonhang);
	}
	
	public ArrayList<SACH> getBookSearch_all(String search) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getBookSearch_all(search);
	}
	
	public ArrayList<DONHANG> getAllOrder_confirm() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllOrder_confirm();
	}
	
	public ArrayList<DONHANG> getAllOrder_completed() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllOrder_completed();
	}
	
	public ArrayList<DONHANG> getAllOrder_can() {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllOrder_can();
	}
	
	public ArrayList<CHITIETDONHANG> getAllOrderDetail(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllOrderDetail(madonhang);
	}
	
	public int getAllTotal(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAllTotal(madonhang);
	}
	
	public float getAmountTotal(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAmountTotal(madonhang);
	}
	
	public float getAmountTotal2(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getAmountTotal2(madonhang);
	}
	
	public KHACHHANG getKH(String makhachhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getKH(makhachhang);
	}
	
	public KHACHHANG getKHang(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getKHang(madonhang);
	}
	
//	public CHITIETDONHANG getOrderDetail(String madonhang) {
//		DAO_ADMIN dao = new DAO_ADMIN();
//		return dao.getOrderDetail(madonhang);
//	}
	
	public DONHANG getOrder(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getOrder(madonhang);
	}
	
	public int getTrangThai(String madonhang) {
		DAO_ADMIN dao = new DAO_ADMIN();
		return dao.getTrangThai(madonhang);
	}
}
