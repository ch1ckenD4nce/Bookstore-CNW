package model.BO;

import java.sql.Date;
import java.util.ArrayList;

import model.BEAN.SACH;
import model.BEAN.TACGIA;
import model.BEAN.THELOAI;
import model.DAO.DAO_GUEST;

public class BO_GUEST {
	
	public BO_GUEST() {
	}
	
	public boolean checkLogin(String username, String password) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.CheckLogin(username, password);
	}
	
	public boolean Singup(String hoten,String gioitinh, Date ngaySinhDate,String diachi, String sdt, String email, String username, String password) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.Singup(hoten, gioitinh, ngaySinhDate, diachi, sdt, email, username, password);
	}
	
	public String getNameUser(String username) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getNameUser(username);
	}
	
	public String getQuyen(String username) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getQuyen(username);
	}
	
	public ArrayList<THELOAI> getAllTheLoai() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllTheLoai();
	}
	
	public ArrayList<SACH> getAllBook_theloai(int idtheloai) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllBook_theloai(idtheloai);
	}
	
	public ArrayList<SACH> getAllBook() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllBook();
	}
	
	public ArrayList<SACH> getAllBook_genre(int idtheloai) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllBook_genre(idtheloai);
	}
	
	public ArrayList<SACH> getAllBook_genre_search(int idtheloai, String search) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllBook_genre_search(idtheloai, search);
	}
	
	public ArrayList<SACH> getAllBook_genre_featured(int idtheloai) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllBook_genre_featured(idtheloai);
	}
	
	public ArrayList<TACGIA> getAllTacgia() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getAllTacgia();
	} 
	
	public ArrayList<SACH> getBookBanner() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookBanner();
	}
	
	public ArrayList<SACH> getBookFeatured() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookFeatured();
	}
	
	public ArrayList<SACH> getBookOffer() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookOffer();
	}
	
	public SACH getBookBestSelling() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookBestSelling();
	}
	
	public SACH getBook(String masachdetail) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBook(masachdetail);
	}
	
	public ArrayList<SACH> getBookRelated(String masachdetail) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookRelated(masachdetail);
	}
	
	public ArrayList<SACH> getBookSearch(String search, int idtheloai) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookSearch(search, idtheloai);
	}
	
	public String getNameGenre(int idtheloai) {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getNameGenre(idtheloai);
	}
	
	public ArrayList<SACH> getBookNewAuthor() {
		DAO_GUEST dao = new DAO_GUEST();
		return dao.getBookNewAuthor();
	}
}
