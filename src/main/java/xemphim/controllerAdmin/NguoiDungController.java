package xemphim.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import xemphim.dao.NguoiDungDAO;
import xemphim.model.Nguoidung;

@Controller
@RequestMapping("/admin/nguoidung")
public class NguoiDungController {
	
	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listUser", nguoiDungDAO.get());
		return "nguoidungIndex";
	}
	
	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("user", new Nguoidung());
		return "nguoidungCreate";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("user") @Validated Nguoidung nguoidung, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
	         return "nguoidungCreate";
	      }
		nguoiDungDAO.save(nguoidung);
		return "redirect:/admin/nguoidung/";
	}
	
	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id,Model model) {
		Nguoidung n = nguoiDungDAO.find(id);
		if(n == null) 
			return "redirect:/admin/nguoidung/";
		
		model.addAttribute("user", n);
		return "nguoidungEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id,@ModelAttribute("user") @Validated Nguoidung nguoidung, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
	         return "nguoidungEdit";
	      }
		nguoiDungDAO.update(nguoidung);
		return "redirect:/admin/nguoidung/";
	}
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Nguoidung n = nguoiDungDAO.find(id);
		if (n != null)
			nguoiDungDAO.delete(n);
		return "redirect:/admin/nguoidung/";
	}
	

}
