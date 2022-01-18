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
import xemphim.dao.RapDAO;
import xemphim.model.Rap;

@Controller
@RequestMapping("/admin/rap")
public class RapController {

	@Autowired
	RapDAO rapDAO;
	
	@Autowired
	CumRapDAO cumRapDAO;
	
	
	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listRap", rapDAO.get());
		return "rapIndex";
	}
	
	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("rap", new Rap());
		model.addAttribute("cumrapList",cumRapDAO.get());
		return "rapCreate";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("rap") @Validated Rap rap, BindingResult bindingResult,Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("cumrapList",cumRapDAO.get());
	        return "rapCreate";
	      }
		rapDAO.save(rap);
		return "redirect:/admin/rap/";
	}

	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Rap r = rapDAO.find(id);
		if(r != null)
			rapDAO.delete(r);
		return "redirect:/admin/rap/";
	}
	
	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id,Model model) {
		Rap r = rapDAO.find(id);
		if(r == null) 
			return "redirect:/admin/rap/";
		
		model.addAttribute("cumrapList",cumRapDAO.get());
		model.addAttribute("rap", r);
		return "rapEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id,@ModelAttribute("rap") @Validated Rap rap, BindingResult bindingResult,Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("cumrapList",cumRapDAO.get());
	        return "rapEdit";
	      }
		rapDAO.update(rap);
		return "redirect:/admin/rap/";
	}
}
