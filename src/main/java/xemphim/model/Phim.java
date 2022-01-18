package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the phim database table.
 * 
 */
@Entity
@Table(name="phim")
@NamedQuery(name="Phim.findAll", query="SELECT p FROM Phim p")
public class Phim implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Đạo diễn không được để trống !")
	private String daodien;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Diễn viên không được để trống !")
	private String dienvien;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@NotNull(message="Vui lòng chọn ngày công chiếu")
	private Date ngaycongchieu;

	@Column(length=3000)
	@NotEmpty(message="Nội dung phim không được để trống !")
	private String noidungphim;

	@Column(length=255)
	private String poster;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Tên phim không được để trống !")
	private String ten;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Thể loại không được để trống !")
	private String theloai;

	@Column(nullable=false)
	@NotNull(message="Thời lượng không được để trống !")
	@Min(value=1,message="Thời lượng không hợp lệ !")
	private int thoiluong;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Trailer không được để trống !")
	private String trailer;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to Suatchieu
	@OneToMany(mappedBy="phim")
	private List<Suatchieu> suatchieus;

	public Phim() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getDaodien() {
		return this.daodien;
	}

	public void setDaodien(String daodien) {
		this.daodien = daodien;
	}

	public String getDienvien() {
		return this.dienvien;
	}

	public void setDienvien(String dienvien) {
		this.dienvien = dienvien;
	}

	public Date getNgaycongchieu() {
		//return new SimpleDateFormat("dd/MM/yyyy").format(this.ngaycongchieu);
		return this.ngaycongchieu;
	}

	public void setNgaycongchieu(Date ngaycongchieu) {
		this.ngaycongchieu = ngaycongchieu;
	}

	public String getNoidungphim() {
		return this.noidungphim;
	}

	public void setNoidungphim(String noidungphim) {
		this.noidungphim = noidungphim;
	}

	public String getPoster() {
		return this.poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public String getTen() {
		return this.ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getTheloai() {
		return this.theloai;
	}

	public void setTheloai(String theloai) {
		this.theloai = theloai;
	}

	public int getThoiluong() {
		return this.thoiluong;
	}

	public void setThoiluong(int thoiluong) {
		this.thoiluong = thoiluong;
	}

	public String getTrailer() {
		return this.trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public Timestamp getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public int getXoa() {
		return this.xoa;
	}

	public void setXoa(int xoa) {
		this.xoa = xoa;
	}

	public List<Suatchieu> getSuatchieus() {
		return this.suatchieus;
	}

	public void setSuatchieus(List<Suatchieu> suatchieus) {
		this.suatchieus = suatchieus;
	}

	public Suatchieu addSuatchieus(Suatchieu suatchieus) {
		getSuatchieus().add(suatchieus);
		suatchieus.setPhim(this);

		return suatchieus;
	}

	public Suatchieu removeSuatchieus(Suatchieu suatchieus) {
		getSuatchieus().remove(suatchieus);
		suatchieus.setPhim(null);

		return suatchieus;
	}

}