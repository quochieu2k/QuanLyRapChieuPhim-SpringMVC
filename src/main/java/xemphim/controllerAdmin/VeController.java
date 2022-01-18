package xemphim.controllerAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import xemphim.dao.VeDAO;
import xemphim.model.Ve;

@Controller
@RequestMapping("/admin/ve")
public class VeController {
	
	@Autowired
	VeDAO veDAO;

	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listVe", veDAO.get());
		return "veIndex";
	}
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Ve v = veDAO.find(id);
		if (v != null)
			veDAO.delete(v);
		return "redirect:/admin/ve/";
	}
	
	@RequestMapping("/detail")
	public String Edit(@RequestParam(name = "id") int id, Model model) {
		Ve ve = veDAO.find(id);
		if (ve == null)
			return "redirect:/admin/ve/";

		
		model.addAttribute("ve", ve);
		model.addAttribute("listVeFood",veDAO.getVeFood(ve.getId()));
		return "veDetail";
	}
}
