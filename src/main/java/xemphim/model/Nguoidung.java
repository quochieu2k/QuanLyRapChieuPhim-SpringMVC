package xemphim.model;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the nguoidung database table.
 * 
 */
@Entity
@Table(name="nguoidung")
@NamedQuery(name="Nguoidung.findAll", query="SELECT n FROM Nguoidung n")
public class Nguoidung implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int id;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	@NotNull(message="Ngày sinh không được để trống !")
	private Date birthday;

	@Column(name="created_at")
	@CreationTimestamp
	private Timestamp createdAt;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Email không được để trống !")
	@Email(message="Vui lòng nhập đúng định dạng email")
	private String email;

	@Column(nullable=false, length=3)
	@NotEmpty(message="Vui lòng chọn giới tính !")
	private String gender;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Họ tên không được để trống !")
	private String name;

	@Column(nullable=false, length=255)
	@NotEmpty(message="Mật khẩu không được để trống !")
	@Size(min=5,message="Mật khẩu phải có ít nhất 5 ký tự") 
	private String pass;

	@Column(nullable=false, length=5)
	private String permission;

	@Column(nullable=false, length=11)
	@NotEmpty(message="Số điện thoại không được để trống !")
	private String phone;

	@Column(name="updated_at")
	@UpdateTimestamp
	private Timestamp updatedAt;

	@Column(nullable=false)
	private int xoa;

	//bi-directional many-to-one association to Ve
	@OneToMany(mappedBy="nguoidung",fetch = FetchType.EAGER)
	private List<Ve> ves;

	public Nguoidung() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Timestamp getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return this.pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPermission() {
		return this.permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public List<Ve> getVes() {
		return this.ves;
	}

	public void setVes(List<Ve> ves) {
		this.ves = ves;
	}

	public Ve addVe(Ve ve) {
		getVes().add(ve);
		ve.setNguoidung(this);

		return ve;
	}

	public Ve removeVe(Ve ve) {
		getVes().remove(ve);
		ve.setNguoidung(null);

		return ve;
	}

}