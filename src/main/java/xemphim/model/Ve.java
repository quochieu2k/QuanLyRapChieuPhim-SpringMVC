package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the ve database table.
 * 
 */
@Entity
@Table(name="ve")
@NamedQuery(name="Ve.findAll", query="SELECT v FROM Ve v")
public class Ve implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false, length=3)
	private String ghe;

	//bi-directional many-to-one association to Nguoidung
	@ManyToOne
	@JoinColumn(name="nguoidung_id", nullable=false)
	private Nguoidung nguoidung;

	//bi-directional many-to-one association to Suatchieu
	@ManyToOne
	@JoinColumn(name="suatchieu_id", nullable=false)
	private Suatchieu suatchieu;

	//bi-directional many-to-one association to VeFood
	@OneToMany(mappedBy="ve",fetch = FetchType.EAGER)
	private List<VeFood> veFoods;
	
	@Column(nullable=false)
	private int xoa;

	public Ve() {
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

	public Timestamp getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getGhe() {
		return this.ghe;
	}

	public void setGhe(String ghe) {
		this.ghe = ghe;
	}

	public Nguoidung getNguoidung() {
		return this.nguoidung;
	}

	public void setNguoidung(Nguoidung nguoidung) {
		this.nguoidung = nguoidung;
	}

	public Suatchieu getSuatchieu() {
		return this.suatchieu;
	}

	public void setSuatchieu(Suatchieu suatchieu) {
		this.suatchieu = suatchieu;
	}

	public List<VeFood> getVeFoods() {
		return this.veFoods;
	}

	public void setVeFoods(List<VeFood> veFoods) {
		this.veFoods = veFoods;
	}

	public VeFood addVeFood(VeFood veFood) {
		getVeFoods().add(veFood);
		veFood.setVe(this);

		return veFood;
	}

	public VeFood removeVeFood(VeFood veFood) {
		getVeFoods().remove(veFood);
		veFood.setVe(null);

		return veFood;
	}

	public int getXoa() {
		return this.xoa;
	}

	public void setXoa(int xoa) {
		this.xoa = xoa;
	}
}