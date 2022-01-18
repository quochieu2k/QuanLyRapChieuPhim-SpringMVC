package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;


/**
 * The persistent class for the ve_food database table.
 * 
 */
@Entity
@Table(name="ve_food")
@NamedQuery(name="VeFood.findAll", query="SELECT v FROM VeFood v")
public class VeFood implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false)
	private int soluong;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	//bi-directional many-to-one association to Fastfood
	@ManyToOne
	@JoinColumn(name="fastfood_id", nullable=false)
	private Fastfood fastfood;

	//bi-directional many-to-one association to Ve
	@ManyToOne
	@JoinColumn(name="ve_id", nullable=false)
	private Ve ve;

	public VeFood() {
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

	public int getSoluong() {
		return this.soluong;
	}

	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}

	public Timestamp getUpdatedAt() {
		return this.updatedAt;
	}

	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}

	public Fastfood getFastfood() {
		return this.fastfood;
	}

	public void setFastfood(Fastfood fastfood) {
		this.fastfood = fastfood;
	}

	public Ve getVe() {
		return this.ve;
	}

	public void setVe(Ve ve) {
		this.ve = ve;
	}

}