package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the rap database table.
 * 
 */
@Entity
@Table(name="rap")
@NamedQuery(name="Rap.findAll", query="SELECT r FROM Rap r")
public class Rap implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false)
	@NotNull(message="Vui lòng nhập kích thước dọc !")
	@Min(value=1,message="Kích thước dọc không hợp lệ !")
	@Max(value=100,message="Kích thước dọc không hợp lệ !")
	private int ktdoc;

	@Column(nullable=false)
	@NotNull(message="Vui lòng nhập kích thước ngang !")
	@Min(value=1,message="Kích thước ngang không hợp lệ !")
	@Max(value=100,message="Kích thước ngang không hợp lệ !")
	private int ktngang;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Loại rạp không được để trống !")
	private String loairap;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Tên rạp không được để trống !")
	private String tenrap;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to Cumrap
	@ManyToOne
	@JoinColumn(name="cumrap_id", nullable=false)
	private Cumrap cumrap;

	//bi-directional many-to-one association to Suatchieu
	@OneToMany(mappedBy="rap")
	private List<Suatchieu> suatchieus;

	public Rap() {
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

	public int getKtdoc() {
		return this.ktdoc;
	}

	public void setKtdoc(int ktdoc) {
		this.ktdoc = ktdoc;
	}

	public int getKtngang() {
		return this.ktngang;
	}

	public void setKtngang(int ktngang) {
		this.ktngang = ktngang;
	}

	public String getLoairap() {
		return this.loairap;
	}

	public void setLoairap(String loairap) {
		this.loairap = loairap;
	}

	public String getTenrap() {
		return this.tenrap;
	}

	public void setTenrap(String tenrap) {
		this.tenrap = tenrap;
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


	public Cumrap getCumrap() {
		return this.cumrap;
	}

	public void setCumrap(Cumrap cumrap) {
		this.cumrap = cumrap;
	}

	public List<Suatchieu> getSuatchieus() {
		return this.suatchieus;
	}

	public void setSuatchieus(List<Suatchieu> suatchieus) {
		this.suatchieus = suatchieus;
	}

	public Suatchieu addSuatchieus(Suatchieu suatchieus) {
		getSuatchieus().add(suatchieus);
		suatchieus.setRap(this);

		return suatchieus;
	}

	public Suatchieu removeSuatchieus(Suatchieu suatchieus) {
		getSuatchieus().remove(suatchieus);
		suatchieus.setRap(null);

		return suatchieus;
	}

}