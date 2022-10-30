package assignment.controller.nonLogin;

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
@RequestMapping("/")
public class DeleteNonLoginController {
	@Autowired
	HttpServletResponse respone;
	@Autowired
	ProductRepo productRepo;

	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Integer id) throws IOException {
		ProductEntity pro = productRepo.getOne(id);
		pro.setAvailable(true);
		productRepo.save(pro);
//		respone.sendRedirect("http://localhost:8080/AssignmentJava5/admin/list");
		return "redirect:/list";
	}

}
