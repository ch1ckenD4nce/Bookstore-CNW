package model.BEAN;

public class THELOAI {
	private int idtheloai;
	private String tentheloai;

	public THELOAI(int idtheloai, String tentheloai) {
		super();
		this.idtheloai = idtheloai;
		this.tentheloai = tentheloai;
	}

	public int getIdtheloai() {
		return idtheloai;
	}

	public void setIdtheloai(int idtheloai) {
		this.idtheloai = idtheloai;
	}

	public String getTentheloai() {
		return tentheloai;
	}

	public void setTentheloai(String tentheloai) {
		this.tentheloai = tentheloai;
	}

}
