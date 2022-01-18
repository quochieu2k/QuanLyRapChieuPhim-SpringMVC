package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the cumrap database table.
 * 
 */
@Entity
@Table(name="cumrap")
@NamedQuery(name="Cumrap.findAll", query="SELECT c FROM Cumrap c")
public class Cumrap implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Địa chỉ cụm rạp không được để trống !")
	private String diachi;

	@Column(length=1000)
	private String maps;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Tên cụm rạp không được để trống !")
	private String tencum;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to Rap
	@OneToMany(mappedBy="cumrap")
	private List<Rap> raps;

	public Cumrap() {
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

	public String getDiachi() {
		return this.diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getMaps() {
		return this.maps;
	}

	public void setMaps(String maps) {
		this.maps = maps;
	}

	public String getTencum() {
		return this.tencum;
	}

	public void setTencum(String tencum) {
		this.tencum = tencum;
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

	public List<Rap> getRaps() {
		return this.raps;
	}

	public void setRaps(List<Rap> raps) {
		this.raps = raps;
	}

	public Rap addRap(Rap rap) {
		getRaps().add(rap);
		rap.setCumrap(this);

		return rap;
	}

	public Rap removeRap(Rap rap) {
		getRaps().remove(rap);
		rap.setCumrap(null);

		return rap;
	}

}