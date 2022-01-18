package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the fastfood database table.
 * 
 */
@Entity
@Table(name="fastfood")
@NamedQuery(name="Fastfood.findAll", query="SELECT f FROM Fastfood f")
public class Fastfood implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false)
	@NotNull(message="Giá không được để trống !")
	@Min(value=500,message="Giá không hợp lệ !")
	private int gia;

	@Column(length=1000)
	private String image;

	@Column(length=500)
	private String mota;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Tên món không được để trống !")
	private String tenmon;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to VeFood
	@OneToMany(mappedBy="fastfood")
	private List<VeFood> veFoods;

	public Fastfood() {
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

	public int getGia() {
		return this.gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getMota() {
		return this.mota;
	}

	public void setMota(String mota) {
		this.mota = mota;
	}

	public String getTenmon() {
		return this.tenmon;
	}

	public void setTenmon(String tenmon) {
		this.tenmon = tenmon;
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

	public List<VeFood> getVeFoods() {
		return this.veFoods;
	}

	public void setVeFoods(List<VeFood> veFoods) {
		this.veFoods = veFoods;
	}

	public VeFood addVeFood(VeFood veFood) {
		getVeFoods().add(veFood);
		veFood.setFastfood(this);

		return veFood;
	}

	public VeFood removeVeFood(VeFood veFood) {
		getVeFoods().remove(veFood);
		veFood.setFastfood(null);

		return veFood;
	}

}