package assignment.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ForgotController {
	@GetMapping("/forgot")
	public String forgotView() {

		return "account/forgotPass";
	}
}
