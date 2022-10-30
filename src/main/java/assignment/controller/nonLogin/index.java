package assignment.controller.nonLogin;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.entitys.CategoryEntity;
import assignment.entitys.ProductEntity;
import assignment.repository.CategoryRepo;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("/")
public class index {
	@Autowired
	ProductRepo ProductRepo;
	@Autowired
	CategoryRepo categoryRepo;

	@GetMapping("/index")
	public String index(Model model) {
		List<ProductEntity> list = ProductRepo.findAll();
		model.addAttribute("list", list);
		return "nonLogin/Index";
	}

	@GetMapping("/list")
	public String list(@RequestParam("p") Optional<Integer> p, Model model) {
		System.out.println("test");
//	List<ProductEntity> list = ProductRepo.findAll();
//	model.addAttribute("list", list);
		List<CategoryEntity> listCate = categoryRepo.findAll();
		model.addAttribute("listCate", categoryRepo.findAll());
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		Page<ProductEntity> page = ProductRepo.findAll(pageable);
		model.addAttribute("list", page);
		return "nonLogin/ListNonLogin";
	}
}
