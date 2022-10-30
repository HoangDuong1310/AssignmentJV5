package assignment.controller.errors;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("")
public class NotAccessController {
	@GetMapping("/errors")
	public String showError() {

		return "load";
	}

}
