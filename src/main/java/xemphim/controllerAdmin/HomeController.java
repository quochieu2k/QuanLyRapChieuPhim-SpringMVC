package xemphim.controllerAdmin;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import xemphim.dao.NguoiDungDAO;
import xemphim.dao.PhimDAO;
import xemphim.dao.VeDAO;
import xemphim.model.Nguoidung;

@Controller
public class HomeController {
	
	@Autowired
	PhimDAO phimDAO;
	
	@Autowired
	VeDAO veDAO;
	
	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@RequestMapping(value={"/admin", "/admin/"})
	public String Index(RedirectAttributes redirectAttributes, HttpSession session,Model model) {
		Nguoidung n = (Nguoidung) session.getAttribute("user");
		if (n == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		if(!n.getPermission().equals("admin")) {
			return "redirect:/";
		}
		
		
		model.addAttribute("sophim", phimDAO.get().size());
		model.addAttribute("sove", veDAO.get().size());
		model.addAttribute("doanhthu",veDAO.getDoanhThu());
		model.addAttribute("luongnguoidung", nguoiDungDAO.get().size());
		return "adminHome";
	}
}
