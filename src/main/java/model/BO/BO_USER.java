package model.BO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.BEAN.CHITIETDONHANG;
import model.BEAN.DONHANG;
import model.BEAN.GIOHANG;
import model.BEAN.KHACHHANG;
import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.DAO.DAO_USER;

public class BO_USER {

	public BO_USER() {
	}

	public boolean checkLogin(String username, String password) {
		DAO_USER dao = new DAO_USER();
		return dao.CheckLogin(username, password);
	}

	public String getQuyen(String username) {
		DAO_USER dao = new DAO_USER();
		return dao.getQuyen(username);
	}

	public String getNameUser(String username) {
		DAO_USER dao = new DAO_USER();
		return dao.getNameUser(username);
	}

	public ArrayList<SACH> getAllBook() {
		DAO_USER dao = new DAO_USER();
		return dao.getAllBook();
	}
	
	public ArrayList<SACH> getFeaturedBook() {
		DAO_USER dao = new DAO_USER();
		return dao.getFeaturedBook();
	}
	
//	public ArrayList<SACH> getAllBook_tacgia(int idtacgia) {
//		DAO_USER dao = new DAO_USER();
//		return dao.getAllBook_tacgia(idtacgia);
//	}
	
//	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
//		DAO_USER dao = new DAO_USER();
//		return dao.getAllBook_theloai(idtheloai);
//	}
	
//	public ArrayList<SACH> getAllBook_search(String search) {
//		DAO_USER dao = new DAO_USER();
//		return dao.getAllBook_search(search);
//	}
	
	public ArrayList<THELOAI> getAllTheloai() {
		DAO_USER dao = new DAO_USER();
		return dao.getAllTheLoai();
	}
	
	public ArrayList<TACGIA> getAllTacgia() {
		DAO_USER dao = new DAO_USER();
		return dao.getAllTacgia();
	}
	
	
	public SACH getBookBestSelling() {
		DAO_USER dao = new DAO_USER();
		return dao.getBookBestSelling();
	}
	
	//=======BANNER
	public ArrayList<SACH> getBookBanner() {
		DAO_USER dao = new DAO_USER();
		return dao.getBookBanner();
	}
	
	public ArrayList<SACH> getAllBook_genre_featured(int idtheloai) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllBook_genre_featured(idtheloai);
	}
	
	//===== OFFER
	public ArrayList<SACH> getBookOffer() {
		DAO_USER dao = new DAO_USER();
		return dao.getBookOffer();
	}
	
	//=====AUTHOR
	public ArrayList<SACH> getBookNewAuthor() {
		DAO_USER dao = new DAO_USER();
		return dao.getBookNewAuthor();
	}
	
	public ArrayList<SACH> getAllBook_genre(int idtheloai) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllBook_genre(idtheloai);
	}
	
	
	//======GENRE
	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllBook_theloai(idtheloai);
	}
	
	public String getNameGenre(int idtheloai) {
		DAO_USER dao = new DAO_USER();
		return dao.getNameGenre(idtheloai);
	}
	
	public SACH getBook(String masachdetail) {
		DAO_USER dao = new DAO_USER();
		return dao.getBook(masachdetail);
	}
	
	public ArrayList<SACH> getBookRelated(String masachdetail) {
		DAO_USER dao = new DAO_USER();
		return dao.getBookRelated(masachdetail);
	}
	
	public ArrayList<SACH> getAllBook_genre_search(int idtheloai, String search) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllBook_genre_search(idtheloai, search);
	}
	
	public ArrayList<SACH> getBookSearch(String search, int idtheloai) {
		DAO_USER dao = new DAO_USER();
		return dao.getBookSearch(search, idtheloai);
	}
	public void addBookToCart(String makhachhang, String masach, int soluong) {
		DAO_USER dao = new DAO_USER();
		dao.addBookToCart(makhachhang, masach, soluong);
	}
	public String getMaKhachHang(String username) {
		DAO_USER dao = new DAO_USER();
		return dao.getMaKhachHang(username);
	}
	public ArrayList<GIOHANG> getGioHangList(String makh) {
		DAO_USER dao = new DAO_USER();
		return dao.getGioHangList(makh);
	}
	public void deleteGioHang(String makh, String masach) {
		DAO_USER dao = new DAO_USER();
		dao.deleteGioHang(makh, masach);
	}
	public void insertDonHang(String makh, ArrayList<GIOHANG> giohang) {
		DAO_USER dao = new DAO_USER();
		dao.insertDonHang(makh, giohang);
	}
	public ArrayList<DONHANG> getAllOrder_confirm(String makh) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllOrder_confirm(makh);
	}
	
	public ArrayList<DONHANG> getAllOrder_completed(String makh) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllOrder_completed(makh);
	}
	
	public ArrayList<DONHANG> getAllOrder_can(String makh) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllOrder_can(makh);
	}
	
	public ArrayList<CHITIETDONHANG> getAllOrderDetail(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllOrderDetail(madonhang);
	}
	
	public int getAllTotal(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getAllTotal(madonhang);
	}
	
	public float getAmountTotal(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getAmountTotal(madonhang);
	}
	
	public KHACHHANG getKH(String makhachhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getKH(makhachhang);
	}
	
	public KHACHHANG getKHang(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getKHang(madonhang);
	}
	
	public DONHANG getOrder(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getOrder(madonhang);
	}
	public int getSoluongGioHang(String makhachhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getSoluongGioHang(makhachhang);
	}
	public void updateGioHang(String makh, ArrayList<GIOHANG> giohang) {
		DAO_USER dao = new DAO_USER();
		dao.updateGioHang(makh, giohang);
	}
	public float getAmountTotal2(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getAmountTotal2(madonhang);
	}
	public int getTrangThai(String madonhang) {
		DAO_USER dao = new DAO_USER();
		return dao.getTrangThai(madonhang);
	}
}
