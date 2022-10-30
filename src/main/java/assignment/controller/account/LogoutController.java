package assignment.controller.account;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import assignment.service.ShoppingService;

@Controller
public class LogoutController {
	@Autowired
	HttpSession httpSession;
	@Autowired
	ShoppingService service;

	@GetMapping("logout")
	public String logout() {
		httpSession.setAttribute("username", null);
		httpSession.setAttribute("password", null);
		httpSession.setAttribute("role", null);
		httpSession.setAttribute("fullname", null);
		httpSession.setAttribute("account", null);
		service.clear();
		return "nonLogin/Index";
	}
}
