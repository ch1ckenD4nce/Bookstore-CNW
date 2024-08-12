package model.BEAN;

public class TAIKHOAN {
	private int IdTaiKhoan;
	private String Username;
	private String Password;
	private String Quyen;

	public TAIKHOAN(int idTaiKhoan, String username, String password, String quyen) {
		super();
		IdTaiKhoan = idTaiKhoan;
		Username = username;
		Password = password;
		Quyen = quyen;
	}

	public int getIdTaiKhoan() {
		return IdTaiKhoan;
	}

	public void setIdTaiKhoan(int idTaiKhoan) {
		IdTaiKhoan = idTaiKhoan;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getQuyen() {
		return Quyen;
	}

	public void setQuyen(String quyen) {
		Quyen = quyen;
	}

}
