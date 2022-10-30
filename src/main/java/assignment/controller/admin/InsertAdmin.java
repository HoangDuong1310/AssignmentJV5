package assignment.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.beans.ProductBean;
import assignment.entitys.CategoryEntity;
import assignment.entitys.ProductEntity;
import assignment.repository.CategoryRepo;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("admin")
public class InsertAdmin {
	private final ProductEntity pro = new ProductEntity();
	@Autowired
	CategoryRepo categoryRepo;
	@Autowired
	ProductBean productBean;
	@Autowired
	ProductRepo productRepo;

	@GetMapping("insert")
	public String formInsert(Model model) {
		model.addAttribute("insert", productBean);
		model.addAttribute("listCategory", categoryRepo.findAll());
		return "admin/FormInsertAdmin";
	}

	@PostMapping("insert")
	public String Insert(@Valid @ModelAttribute("insert") ProductBean insert, BindingResult result, Model model) {
		if (result.hasErrors()) {
			System.out.println("lỗi");
			model.addAttribute("massage", "Không được để trống");
			return "/admin/FormInsertAdmin";
		}
		pro.setId(insert.getId());
		pro.setName(insert.getName());
		pro.setDescription(insert.getDescription());
		pro.setAvailable(insert.isAvailable());
		pro.setPrice(insert.getPrice());
		pro.setVideo(insert.getVideo());
		pro.setImage(insert.getImage());
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		pro.setCreatedDate(date);
//		CategoryEntity cate = new CategoryEntity();
//		cate.setId(insert.getId());
//		cate = categoryRepo.getOne(1);
//		System.out.println(cate);
//		pro.setCategory(cate);
//		System.out.println(pro.getCategory().getName());
		productRepo.save(pro);
		return "redirect:/admin/list";
	}
}
