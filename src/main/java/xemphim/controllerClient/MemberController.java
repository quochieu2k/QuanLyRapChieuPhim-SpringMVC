package xemphim.controllerClient;


import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import xemphim.dao.NguoiDungDAO;
import xemphim.model.LoginForm;
import xemphim.model.Nguoidung;
import xemphim.util.Util;

@Controller
public class MemberController {

	@Autowired
	NguoiDungDAO nguoiDungDAO;

	@RequestMapping("/member")
	public String member(RedirectAttributes redirectAttributes, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		Nguoidung nguoidung = (Nguoidung) session.getAttribute("user");
		model.addAttribute("user", nguoiDungDAO.find(nguoidung.getId()));
		return "member";
	}

	@RequestMapping(value = "/member", method = RequestMethod.POST)
	public String member(@ModelAttribute("user") @Validated Nguoidung nguoidung, BindingResult bindingResult,
			HttpSession session, RedirectAttributes redirectAttributes, Model model) {
		if (session.getAttribute("user") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		if (bindingResult.hasErrors()) {
			return "member";
		}

		nguoiDungDAO.update(nguoidung);
		nguoidung = nguoiDungDAO.find(nguoidung.getId());
		session.setAttribute("user", nguoidung);
//		model.addAttribute("message","Cập nhật thành công!");
//		model.addAttribute("user", (Nguoidung) session.getAttribute("user"));
//		return "member";

		redirectAttributes.addFlashAttribute("message", "Cập nhật thành công");
		return "redirect:/member";

	}

	@RequestMapping("/login")
	public String login(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/";
		}
		model.addAttribute("loginform", new LoginForm());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("loginform") @Validated LoginForm loginform, BindingResult bindingResult,
			HttpSession session) {
		if (bindingResult.hasErrors()) {
			return "login";
		}

		Nguoidung nguoidung = nguoiDungDAO.findByEmail(loginform.getEmail());

		if (nguoidung != null && loginform.getPass().equals(nguoidung.getPass())) {
			session.setAttribute("user", nguoidung);

			if (nguoidung.getPermission().equals("admin")) {
				return "redirect:/admin/";
			}
			return "redirect:/";
		} else {
			bindingResult.reject("error.loginform", "Email hoặc mật khẩu không đúng");
		}
		return "login";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/";
	}

	@RequestMapping("/register")
	public String register(Model model, HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/";
		}

		model.addAttribute("user", new Nguoidung());
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") @Validated Nguoidung nguoidung, BindingResult bindingResult,
			@RequestParam("passConfirm") String passConfirm, Model model) {
		if (bindingResult.hasErrors()) {
			return "register";
		}
		if (passConfirm.trim().length() < 1) {
			bindingResult.reject("error.user", "Bạn chưa nhập xác nhận mật khẩu");
			return "register";
		}
		if (!nguoidung.getPass().equals(passConfirm)) {
			bindingResult.reject("error.user", "Xác nhận mật khẩu không đúng");
			return "register";
		}
		if (!nguoiDungDAO.checkUser(nguoidung.getEmail())) {
			bindingResult.reject("error.user", "Tài khoản đã tồn tại");
			return "register";
		}

		nguoidung.setPermission("user");
		nguoiDungDAO.save(nguoidung);
		model.addAttribute("message", "Đăng ký thành công!");
		return "register";

	}

	@RequestMapping("/member/changepassword")
	public String changePass(RedirectAttributes redirectAttributes, HttpSession session) {
		if (session.getAttribute("user") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		return "changepassword";
	}

	@RequestMapping(value = "/member/changepassword", method = RequestMethod.POST)
	public String changePass(@RequestParam String old_password, @RequestParam String new_password,
			@RequestParam String confirm_password, Model model,HttpSession session) {
		if(old_password.trim().length() < 1) {
			model.addAttribute("message", "Bạn chưa nhập mật khẩu cũ");
			return "changepassword";
		}
		if(new_password.trim().length() < 1) {
			model.addAttribute("message", "Bạn chưa nhập mật khẩu mới");
			return "changepassword";
		}
		if(confirm_password.trim().length() < 1) {
			model.addAttribute("message", "Bạn chưa xác nhận mật khẩu mới");
			return "changepassword";
		}
		if(!new_password.equals(confirm_password)) {
			model.addAttribute("message", "Xác nhận mật khẩu không đúng");
			return "changepassword";
		}
		Nguoidung nguoidung = (Nguoidung) session.getAttribute("user");
		if(!nguoidung.getPass().equals(old_password)) {
			model.addAttribute("message", "Mật khẩu cũ không chính xác");
			return "changepassword";
		}
		
		nguoidung.setPass(new_password);
		nguoiDungDAO.update(nguoidung);
		model.addAttribute("message", "Đổi mật khẩu thành công!");
		return "changepassword";

	}
	
	
	//qrCode cho mã vé
	@RequestMapping(value = "/member/ve/{id}", method = RequestMethod.GET)
	public void qrcode(@PathVariable("id") String id, HttpServletResponse response) throws Exception {
		response.setContentType("image/png");
		OutputStream outputStream = response.getOutputStream();
		outputStream.write(Util.getQRCodeImage(id, 200, 200));
		outputStream.flush();
		outputStream.close();
	}

}
