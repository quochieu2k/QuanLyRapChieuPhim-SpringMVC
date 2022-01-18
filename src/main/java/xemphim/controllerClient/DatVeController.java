package xemphim.controllerClient;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import xemphim.dao.FoodDAO;
import xemphim.dao.NguoiDungDAO;
import xemphim.dao.SuatChieuDAO;
import xemphim.dao.VeDAO;
import xemphim.model.Fastfood;
import xemphim.model.Nguoidung;
import xemphim.model.Suatchieu;
import xemphim.model.Ve;
import xemphim.model.VeFood;

@Controller
public class DatVeController {

	@Autowired
	SuatChieuDAO suatChieuDAO;

	@Autowired
	NguoiDungDAO nguoiDungDAO;
	
	@Autowired
	FoodDAO foodDAO;

	@Autowired
	VeDAO veDAO;

	@RequestMapping("/datve/{id}")
	public String datVe(@PathVariable("id") int id, RedirectAttributes redirectAttributes, HttpSession session,
			Model model) {
		if (session.getAttribute("user") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		if (suatChieuDAO.find(id) == null) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "Not Found");
		}
		session.removeAttribute("listGheDaChon");
		session.removeAttribute("listComboDaChon");
		session.removeAttribute("suatchieu");
		Suatchieu suatchieu = suatChieuDAO.find(id);
		
		List<String> listGheDaDat = veDAO.getGheDaDat(id);
		model.addAttribute("suatchieu", suatchieu);
		model.addAttribute("listGheDaDat",listGheDaDat);
		return "datve";
	}

	@RequestMapping(value = "/datve/{id}", method = RequestMethod.POST)
	public String datVe(@PathVariable("id") int id, HttpServletRequest request, HttpSession session) {
		String seat[] = request.getParameterValues("seat");
		List<String> listGhe = Arrays.asList(seat);
		Suatchieu suatchieu = suatChieuDAO.find(id);
		Nguoidung nguoidung = (Nguoidung) session.getAttribute("user");

		List<Ve> listVe = new ArrayList<>(); // khởi tạo vé
		for (String ghe : listGhe) {
			Ve ve = new Ve();
			ve.setSuatchieu(suatchieu);
			ve.setGhe(ghe);
			ve.setNguoidung(nguoidung);
			ve.setXoa(0);
			listVe.add(ve);
		}

		session.setAttribute("listGheDaChon", listGhe);
		session.setAttribute("suatchieu", suatchieu);
		session.setAttribute("listVe", listVe);

		return "redirect:/datve-combo";
	}

	@RequestMapping("/datve-combo")
	public String datVeCombo(RedirectAttributes redirectAttributes, HttpSession session, Model model) {

		if (session.getAttribute("user") == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		if (session.getAttribute("listGheDaChon") == null) {
			return "redirect:/";
		}

		session.removeAttribute("listComboDaChon");
		List<Fastfood> listFood = foodDAO.get();
		model.addAttribute("listFood", listFood);
		return "datvecombo";
	}

	@RequestMapping(value = "/datve/api/combo", method = RequestMethod.POST)
	@ResponseBody
	public String ApiCombo(@RequestParam int id, @RequestParam int quantity, HttpSession session) {
		// hashmap key là id của food, value là số lượng
		HashMap<Integer, Integer> comboMap = (HashMap<Integer, Integer>) session.getAttribute("listComboDaChon");
		if (comboMap == null) {
			comboMap = new HashMap<>();
		}
		Fastfood food = foodDAO.find(id);
		if (food != null) {
			if(quantity == 0) {
				comboMap.remove(id);
			}else {
				comboMap.put(id, quantity);
			}
		}
		session.setAttribute("listComboDaChon", comboMap);
//		for (Integer name : comboMap.keySet()) {
//			System.out.println(name + " " + comboMap.get(name));
//		}
		return comboMap.size() + "";
	}

	@RequestMapping("/datve/confirm")
	public String success(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
		Suatchieu suatchieu = (Suatchieu) session.getAttribute("suatchieu");
		List<String> listGhe = (List<String>) session.getAttribute("listGheDaChon");
		HashMap<Integer, Integer> comboMap = (HashMap<Integer, Integer>) session.getAttribute("listComboDaChon");
		Nguoidung nguoidung = (Nguoidung) session.getAttribute("user");
		List<Ve> listVe = (List<Ve>) session.getAttribute("listVe");

		if (nguoidung == null) {
			redirectAttributes.addFlashAttribute("message", "Vui lòng đăng nhập trước");
			return "redirect:/login";
		}
		if (suatchieu == null || listGhe == null) {
			return "redirect:/";
		}

		if (comboMap != null) {

			List<VeFood> veFoods = new ArrayList<>();
			Iterator itCombo = comboMap.entrySet().iterator();
			while (itCombo.hasNext()) {
				Map.Entry<Integer, Integer> combo = (Entry<Integer, Integer>) itCombo.next();

				int comboID = combo.getKey();
				int quantity = combo.getValue();
				Fastfood food = foodDAO.find(comboID);
				VeFood vefood = new VeFood();
				vefood.setFastfood(food);
				vefood.setSoluong(quantity);
				veFoods.add(vefood);
			}
			listVe.get(0).setVeFoods(veFoods);

		}

		// lưu thông tin vé vào csdl
		for (Ve ve : listVe) {
			veDAO.save(ve);
			if (ve.getVeFoods() != null) {
				Iterator<VeFood> vefoods = ve.getVeFoods().iterator();
				while (vefoods.hasNext()) {
					VeFood vefood = vefoods.next();
					vefood.setVe(ve);
					veDAO.saveVeFood(vefood);
				}
			}
		}
//		for(Ve ve : listVe) {
//			System.out.print(ve.getId()+",");
//		}
//		for(VeFood vefood : veFoods) {
//			vefood.setVe(listVe.get(0));
//			veDAO.saveVeFood(vefood);
//		}
		model.addAttribute("nguoidung",nguoidung);
		model.addAttribute("suatchieu",suatchieu);
		model.addAttribute("listVe",listVe);
		
		//xóa dữ liệu
		session.removeAttribute("suatchieu");
		session.removeAttribute("listGheDaChon");
		session.removeAttribute("listComboDaChon");
		session.removeAttribute("listVe");
		return "success";
	}
}
