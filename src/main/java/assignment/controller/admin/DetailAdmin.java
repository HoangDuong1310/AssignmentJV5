package assignment.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.entitys.ProductEntity;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("/admin")
public class DetailAdmin {
	@Autowired
	ProductRepo repo;
	ProductEntity product = new ProductEntity();

	@GetMapping("card-detail/{id}")
	public String showcrad(@PathVariable("id") ProductEntity product, Model model) {
		repo.findAll();
		System.out.println(product);
		model.addAttribute("product", product);
		return "admin/CardDetailAdmin";
	}

}