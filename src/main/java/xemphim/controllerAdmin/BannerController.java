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

import xemphim.dao.BannerDAO;
import xemphim.model.Banner;
import xemphim.util.Util;

@Controller
@RequestMapping("/admin/quangcao")
public class BannerController {

	private static final String UPLOAD_DIRECTORY = "/Assets/upload/banner/";

	@Autowired
	BannerDAO bannerDAO;

	@Autowired
	private HttpServletRequest request;

	@RequestMapping("/")
	public String Index(Model model) {
		model.addAttribute("listBanner", bannerDAO.get());
		return "bannerIndex";
	}

	@RequestMapping("/create")
	public String Create(Model model) {
		model.addAttribute("banner", new Banner());
		return "bannerCreate";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String Create(@ModelAttribute("banner") @Validated Banner banner, BindingResult bindingResult,
			@RequestParam("BannerImage") MultipartFile image) {
		// kiểm tra ảnh upload
		if (image.isEmpty() || !Util.isImage(image.getOriginalFilename())) {
			bindingResult.rejectValue("image", "error.banner", "Vui lòng tải lên file ảnh hợp lệ");
			return "bannerCreate";
		}

		// kiểm tra binding dữ liệu
		if (bindingResult.hasErrors()) {
			return "bannerCreate";
		}
		
		String fileBanner = uploadFile(image);
		banner.setImage(fileBanner);

		bannerDAO.save(banner);
		return "redirect:/admin/quangcao/";
	}
	
	@RequestMapping("/delete")
	public String Delete(@RequestParam(name = "id") int id) {
		Banner b = bannerDAO.find(id);
		if (b != null)
			bannerDAO.delete(b);
		return "redirect:/admin/quangcao/";
	}
	
	@RequestMapping("/edit")
	public String Edit(@RequestParam(name = "id") int id, Model model) {
		Banner b = bannerDAO.find(id);
		if (b == null)
			return "redirect:/admin/quangcao/";

		model.addAttribute("banner", b);
		return "bannerEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String Edit(@RequestParam(name = "id") int id, @ModelAttribute("banner") @Validated Banner banner,
			BindingResult bindingResult, @RequestParam("BannerImage") MultipartFile image) {
		if (bindingResult.hasErrors()) {
			return "bannerEdit";
		}
		// kiểm tra ảnh upload
		if (!image.isEmpty()) {
			if (!Util.isImage(image.getOriginalFilename())) {
				bindingResult.rejectValue("image", "error.banner", "Vui lòng tải lên file ảnh hợp lệ");
				return "bannerEdit";
			}
			String fileBanner = uploadFile(image);
			banner.setImage(fileBanner);
		}

		bannerDAO.update(banner);
		return "redirect:/admin/quangcao/";
	}

	private String uploadFile(MultipartFile multipartFile) {

		String realPathtoUploads = request.getServletContext().getRealPath(UPLOAD_DIRECTORY);
		return Util.uploadFile(multipartFile, realPathtoUploads);

	}

}
