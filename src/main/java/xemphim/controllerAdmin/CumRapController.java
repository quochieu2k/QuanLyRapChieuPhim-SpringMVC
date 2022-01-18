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

import xemphim.dao.CumRapDAO;
import xemphim.model.Cumrap;

@Controller
@RequestMapping("/admin/cumrap")
public class CumRapController {

	@Autowired
	CumRapDAO cumRapDAO;
	
	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listCumrap", cumRapDAO.get());
		return "cumrapIndex";
	}
	
	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("cumrap", new Cumrap());
		return "cumrapCreate";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("cumrap") @Validated Cumrap cumrap, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
	         return "cumrapCreate";
	      }
		cumRapDAO.save(cumrap);
		return "redirect:/admin/cumrap/";
	}
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Cumrap c = cumRapDAO.find(id);
		if(c != null)
			cumRapDAO.delete(c);
		return "redirect:/admin/cumrap/";
	}
	
	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id,Model model) {
		Cumrap c = cumRapDAO.find(id);
		if(c == null) 
			return "redirect:/admin/cumrap/";
		
		model.addAttribute("cumrap", c);
		return "cumrapEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id,@ModelAttribute("cumrap") @Validated Cumrap cumrap, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
	         return "cumrapEdit";
	      }
		cumRapDAO.update(cumrap);
		return "redirect:/admin/cumrap/";
	}

}
