package assignment.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import assignment.entitys.ProductEntity;
import assignment.repository.ProductRepo;

@Controller
@RequestMapping("admin")
public class DeleteAdmin {
	@Autowired
	HttpServletResponse respone;
	@Autowired
	ProductRepo productRepo;

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id) throws IOException {
		ProductEntity pro = productRepo.getOne(id);
		if (pro.getAvailable() == true) {
			pro.setAvailable(false);
			productRepo.save(pro);
		} else {
			pro.setAvailable(true);
			productRepo.save(pro);
		}
		pro.setAvailable(true);
		return "redirect:/admin/list";
	}

}
