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

import xemphim.dao.PhimDAO;
import xemphim.dao.RapDAO;
import xemphim.dao.SuatChieuDAO;
import xemphim.model.Suatchieu;

@Controller
@RequestMapping("/admin/suatchieu")
public class SuatChieuController {

	@Autowired
	SuatChieuDAO suatChieuDAO;

	@Autowired
	PhimDAO phimDAO;

	@Autowired
	RapDAO rapDAO;

	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listSuatChieu", suatChieuDAO.get());
		return "suatchieuIndex";
	}

	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("suatchieu", new Suatchieu());
		model.addAttribute("phimList", phimDAO.get());
		model.addAttribute("rapList", rapDAO.get());
		return "suatchieuCreate";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("suatchieu") @Validated Suatchieu suatchieu, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("phimList", phimDAO.get());
			model.addAttribute("rapList", rapDAO.get());
			return "suatchieuCreate";
		}
		suatChieuDAO.save(suatchieu);
		return "redirect:/admin/suatchieu/";
	}

	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Suatchieu sc = suatChieuDAO.find(id);
		if (sc != null)
			suatChieuDAO.delete(sc);
		return "redirect:/admin/suatchieu/";
	}

	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id, Model model) {
		Suatchieu sc = suatChieuDAO.find(id);
		if (sc == null)
			return "redirect:/admin/suatchieu/";

		model.addAttribute("phimList", phimDAO.get());
		model.addAttribute("rapList", rapDAO.get());
		model.addAttribute("suatchieu", sc);
		return "suatchieuEdit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id, @ModelAttribute("suatchieu") @Validated Suatchieu suatchieu,
			BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("phimList", phimDAO.get());
			model.addAttribute("rapList", rapDAO.get());
			return "suatchieuEdit";
		}
		suatChieuDAO.update(suatchieu);
		return "redirect:/admin/suatchieu/";
	}

}
