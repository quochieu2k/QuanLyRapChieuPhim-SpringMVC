package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the suatchieu database table.
 * 
 */
@Entity
@Table(name="suatchieu")
@NamedQuery(name="Suatchieu.findAll", query="SELECT s FROM Suatchieu s")
public class Suatchieu implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false)
	@NotNull(message="Vui lòng nhập giá vé !")
	@Min(value=1000,message="Giá vé không hợp lệ !")
	private int giave;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	@NotNull(message="Ngày chiếu không được để trống !")
	private Date ngay;

	@DateTimeFormat(pattern = "HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	@NotNull(message="Thời gian bắt đầu không được để trống !")
	private Date thoidiembatdau;

	@DateTimeFormat(pattern = "HH:mm")
	@Temporal(TemporalType.TIMESTAMP)
	@Column(nullable=false)
	@NotNull(message="Thời gian kết thúc không được để trống !")
	private Date thoidiemketthuc;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to Phim
	@ManyToOne
	@JoinColumn(name="phim_id", nullable=false)
	@NotNull(message="Vui lòng chọn phim !")
	private Phim phim;

	//bi-directional many-to-one association to Rap
	@ManyToOne
	@JoinColumn(name="rap_id", nullable=false)
	@NotNull(message="Vui lòng chọn rạp !")
	private Rap rap;

	//bi-directional many-to-one association to Ve
	@OneToMany(mappedBy="suatchieu")
	private List<Ve> ves;

	public Suatchieu() {
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

	public int getGiave() {
		return this.giave;
	}

	public void setGiave(int giave) {
		this.giave = giave;
	}

	public Date getNgay() {
		return this.ngay;
	}

	public void setNgay(Date ngay) {
		this.ngay = ngay;
	}

	public Date getThoidiembatdau() {
		return this.thoidiembatdau;
	}

	public void setThoidiembatdau(Date thoidiembatdau) {
		this.thoidiembatdau = thoidiembatdau;
	}

	public Date getThoidiemketthuc() {
		return this.thoidiemketthuc;
	}

	public void setThoidiemketthuc(Date thoidiemketthuc) {
		this.thoidiemketthuc = thoidiemketthuc;
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

	public Phim getPhim() {
		return this.phim;
	}

	public void setPhim(Phim phim) {
		this.phim = phim;
	}

	public Rap getRap() {
		return this.rap;
	}

	public void setRap(Rap rap) {
		this.rap = rap;
	}

	public List<Ve> getVes() {
		return this.ves;
	}

	public void setVes(List<Ve> ves) {
		this.ves = ves;
	}

	public Ve addVe(Ve ve) {
		getVes().add(ve);
		ve.setSuatchieu(this);

		return ve;
	}

	public Ve removeVe(Ve ve) {
		getVes().remove(ve);
		ve.setSuatchieu(null);

		return ve;
	}

}