package assignment.controller.admin;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.beans.CategorysBean;
import assignment.entitys.CategoryEntity;
import assignment.repository.CategoryRepo;

@Controller
@RequestMapping("admin")
public class CategoryAdmin {
	private final CategoryEntity cateE = new CategoryEntity();
	@Autowired
	CategorysBean categorysBean;
	@Autowired
	CategoryRepo categoryRepo;
	@Autowired
	HttpServletResponse res;

	@GetMapping("insertCate")
	public String showCate(Model model) {
		List<CategoryEntity> list = categoryRepo.findAll();
		model.addAttribute("list", list);
		model.addAttribute("insertCate", categorysBean);
		return ("admin/FormInsertCate");

	}

	@PostMapping("insertCate")
	public String insertCate(@ModelAttribute("insertCate") CategorysBean insertCate, Model model) {
		cateE.setId(insertCate.getId());
		cateE.setName(insertCate.getName());
		categoryRepo.save(cateE);
		return "redirect:/admin/list";
	}

	@GetMapping("deleteCate/{id}")
	public String deleteCate(@PathVariable("id") Integer id, Model model) {
		CategoryEntity cate = categoryRepo.getOne(id);
		categoryRepo.delete(cate);
		return ("redirect:/admin/insertCate");
	}

}
