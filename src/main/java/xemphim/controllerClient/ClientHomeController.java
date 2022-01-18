package xemphim.controllerClient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import xemphim.dao.BannerDAO;
import xemphim.dao.PhimDAO;

@Controller
public class ClientHomeController {
	
	@Autowired
	PhimDAO phimDAO;
	
	@Autowired
	BannerDAO bannerDAO;
	
	@RequestMapping("/")
	public String index(Model model) {
		model.addAttribute("banner", bannerDAO.get());
		model.addAttribute("phimmoi",phimDAO.get());
		return "index";
	}
	
	
}
