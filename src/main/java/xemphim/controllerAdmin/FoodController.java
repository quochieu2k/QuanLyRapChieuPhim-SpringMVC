package xemphim.controllerAdmin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import xemphim.dao.FoodDAO;
import xemphim.model.Fastfood;
import xemphim.util.Util;

@Controller
@RequestMapping("/admin/food")
public class FoodController {
	
	private static final String UPLOAD_DIRECTORY = "/Assets/upload/food/";
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	FoodDAO foodDAO;
	
	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listFood", foodDAO.get());
		return "foodIndex";
	}
	
	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("food", new Fastfood());
		return "foodCreate";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("food") @Validated Fastfood fastfood, BindingResult bindingResult,
			@RequestParam("FoodImage") MultipartFile image) {
		// kiểm tra ảnh upload
		if (image.isEmpty() || !Util.isImage(image.getOriginalFilename())) {
			bindingResult.rejectValue("image", "error.fastfood", "Vui lòng tải lên file ảnh hợp lệ");
			return "foodCreate";
		}

		// kiểm tra binding dữ liệu
		if (bindingResult.hasErrors()) {
			return "foodCreate";
		}
		
		String fileFood = uploadFile(image);
		fastfood.setImage(fileFood);

		foodDAO.save(fastfood);
		return "redirect:/admin/food/";
	}
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Fastfood f = foodDAO.find(id);
		if (f != null)
			foodDAO.delete(f);
		return "redirect:/admin/food/";
	}
	
	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id, Model model) {
		Fastfood f = foodDAO.find(id);
		if (f == null)
			return "redirect:/admin/food/";

		model.addAttribute("food", f);
		return "foodEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id, @ModelAttribute("food") @Validated Fastfood fastfood,
			BindingResult bindingResult, @RequestParam("FoodImage") MultipartFile image) {
		if (bindingResult.hasErrors()) {
			return "foodEdit";
		}
		// kiểm tra ảnh upload
		if (!image.isEmpty()) {
			if (!Util.isImage(image.getOriginalFilename())) {
				bindingResult.rejectValue("image", "error.fastfood", "Vui lòng tải lên file ảnh hợp lệ");
				return "foodEdit";
			}
			String fileFood = uploadFile(image);
			fastfood.setImage(fileFood);
		}

		foodDAO.update(fastfood);
		return "redirect:/admin/food/";
	}
	
	private String uploadFile(MultipartFile multipartFile) {

		String realPathtoUploads = request.getServletContext().getRealPath(UPLOAD_DIRECTORY);
		return Util.uploadFile(multipartFile, realPathtoUploads);

	}

}
