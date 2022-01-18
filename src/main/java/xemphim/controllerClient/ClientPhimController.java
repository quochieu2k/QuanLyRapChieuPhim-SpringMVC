package xemphim.controllerClient;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;

import xemphim.dao.PhimDAO;
import xemphim.dao.SuatChieuDAO;
import xemphim.model.Phim;
import xemphim.model.Suatchieu;

@Controller
public class ClientPhimController {

	@Autowired
	PhimDAO phimDAO;

	@Autowired
	SuatChieuDAO suatChieuDAO;

	@RequestMapping("/phim")
	public String index(Model model) {
		model.addAttribute("listPhim", phimDAO.get());
		return "phim";
	}

	@RequestMapping("/phim/chitiet")
	public String detail(@RequestParam int id, Model model) {
		Phim phim = phimDAO.find(id);
		if (phim == null)
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Movie Not Found");
		model.addAttribute("phim", phim);
		return "chitietphim";
	}

	@RequestMapping("/phim/timkiem")
	public String search(@RequestParam String query, Model model) {
		model.addAttribute("listPhim", phimDAO.search(query));
		return "phim";
	}

	@RequestMapping("/phim/lichchieu")
	public String lichChieu(@RequestParam int id, Model model) {
		Phim phim = phimDAO.find(id);
		if (phim == null)
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Movie Not Found");

		model.addAttribute("phim", phim);
		return "lichchieu";
	}

	@RequestMapping("/phim/api/showtime")
	public String showTime(@RequestParam("date") String dateStr, @RequestParam("idPhim") int id, Model model) {
		Date date;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(dateStr);
		} catch (ParseException e) {
			model.addAttribute("data", null);
			return "showtime";
		}

		if (phimDAO.find(id) == null || suatChieuDAO.getByMovieAndDate(id,date).size() < 1) {
			model.addAttribute("data", null);
		} else {
			// convert list to hashmap
			List<Suatchieu> list = suatChieuDAO.getByMovieAndDate(id,date);
			Map<String, List<Suatchieu>> map = new HashMap<String, List<Suatchieu>>();
			for (Suatchieu sc : list) {
				String key = sc.getRap().getCumrap().getTencum();
				if(map.get(key) == null) {
					map.put(key, new ArrayList<Suatchieu>());
				}
				map.get(key).add(sc);
			}
			
			model.addAttribute("data", map);
		}
		return "showtime";
	}
}
