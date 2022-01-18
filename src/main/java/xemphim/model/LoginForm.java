package xemphim.model;

import javax.persistence.Column;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class LoginForm {
	
	@NotEmpty(message="Email không được để trống !")
	@Email(message="Vui lòng nhập đúng định dạng email")
	private String email;
	
	@NotEmpty(message="Mật khẩu không được để trống !")
	@Size(min=5,message="Mật khẩu phải có ít nhất 5 ký tự") 
	private String pass;
	
	public LoginForm() {
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
