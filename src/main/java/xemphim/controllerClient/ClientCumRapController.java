package xemphim.controllerClient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import xemphim.dao.CumRapDAO;
import xemphim.model.Cumrap;

@Controller
public class ClientCumRapController {

	@Autowired
	CumRapDAO cumRapDAO;
	
	@RequestMapping("/cumrap")
	public String index(Model model) {
		model.addAttribute("cumrap",cumRapDAO.get());
		return "cumrap";
	}
	
	@RequestMapping("/cumrap/chitiet")
	public String index(@RequestParam int id,Model model) {
		Cumrap c = cumRapDAO.find(id);
		if(c == null)
			throw new ResponseStatusException(
			          HttpStatus.NOT_FOUND, "Theater Not Found");
		model.addAttribute("cumrap", c);
		return "chitietcumrap";
	}
}
