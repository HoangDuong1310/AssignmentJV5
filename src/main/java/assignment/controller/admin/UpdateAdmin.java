package assignment.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.beans.ProductBean;
import assignment.entitys.ProductEntity;
import assignment.repository.CategoryRepo;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("admin")
public class UpdateAdmin {
	@Autowired
	ProductBean productBean;
	@Autowired
	ProductRepo productRepo;
	@Autowired
	CategoryRepo categoryRepo;

	@GetMapping("update/{id}")
	public String getUpdate(@PathVariable("id") Integer id, Model model) {
//		model.addAttribute("listCate", categoryRepo.findAll());
		Optional<ProductEntity> listPro = productRepo.findById(id);
		model.addAttribute("update", listPro.get());
		return "admin/FormUpdateAdmin";
	}

	@PostMapping("update")
	public String getUpdate(@ModelAttribute("update") ProductBean bean, Model model) {
		ProductEntity proEntity = productRepo.getById(bean.getId());
		proEntity.setName(bean.getName());
		proEntity.setDescription(bean.getDescription());
		proEntity.setPrice(bean.getPrice());
		proEntity.setVideo(bean.getVideo());
		proEntity.setImage(bean.getImage());
		proEntity.setAvailable(bean.isAvailable());
		productRepo.save(proEntity);
		return "redirect:/admin/list";

	}
}
