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

import xemphim.dao.PhimDAO;
import xemphim.model.Phim;
import xemphim.util.*;

@Controller
@RequestMapping("/admin/phim")
public class PhimController {

	private static final String UPLOAD_DIRECTORY = "/Assets/upload/poster/";

	@Autowired
	PhimDAO phimDAO;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listPhim", phimDAO.get());
		return "phimIndex";
	}

	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("phim", new Phim());
		return "phimCreate";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("phim") @Validated Phim phim, BindingResult bindingResult,
			@RequestParam("PosterImage") MultipartFile image) {
		// kiểm tra ảnh upload
		if (image.isEmpty() || !Util.isImage(image.getOriginalFilename())) {
			bindingResult.rejectValue("poster", "error.phim", "Vui lòng tải lên file ảnh hợp lệ");
			return "phimCreate";
		}

		// kiểm tra binding dữ liệu
		if (bindingResult.hasErrors()) {
			return "phimCreate";
		}

		String filePoster = uploadFile(image);
		phim.setPoster(filePoster);

		phimDAO.save(phim);
		return "redirect:/admin/phim/";
	}

	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Phim p = phimDAO.find(id);
		if (p != null)
			phimDAO.delete(p);
		return "redirect:/admin/phim/";
	}

	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id, Model model) {
		Phim p = phimDAO.find(id);
		if (p == null)
			return "redirect:/admin/phim/";

		model.addAttribute("phim", p);
		return "phimEdit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id, @ModelAttribute("phim") @Validated Phim phim,
			BindingResult bindingResult, @RequestParam("PosterImage") MultipartFile image) {
		if (bindingResult.hasErrors()) {
			return "phimEdit";
		}
		// kiểm tra ảnh upload
		if (!image.isEmpty()) {
			if (!Util.isImage(image.getOriginalFilename())) {
				bindingResult.rejectValue("poster", "error.phim", "Vui lòng tải lên file ảnh hợp lệ");
				return "phimEdit";
			}
			String filePoster = uploadFile(image);
			phim.setPoster(filePoster);
		}

		phimDAO.update(phim);
		return "redirect:/admin/phim/";
	}

	private String uploadFile(MultipartFile multipartFile) {

		String realPathtoUploads = request.getServletContext().getRealPath(UPLOAD_DIRECTORY);
		return Util.uploadFile(multipartFile, realPathtoUploads);

	}

}
