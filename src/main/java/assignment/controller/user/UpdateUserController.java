package assignment.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.beans.ProductBean;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("user")
public class UpdateUserController {
	@Autowired
	ProductBean productBean;
	@Autowired
	ProductRepo productRepo;

	@GetMapping("update/{id}")
	public String getUpdate(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("update", productRepo.findById(id));
		System.out.println(id);
		return "user/FormUpdateUser";
	}
}
