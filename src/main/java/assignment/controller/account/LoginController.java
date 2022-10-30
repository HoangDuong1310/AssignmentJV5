package assignment.controller.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import assignment.beans.AccountBean;
import assignment.entitys.AccountEntity;
import assignment.entitys.role;
import assignment.repository.AccountRepo;
import assignment.service.AccountService;

@Controller
public class LoginController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse res;
	@Autowired
	AccountRepo accRepo;
	@Autowired
	AccountService accountService;
//	@Autowired
//	AuthenticationService authenticationService;
	@Autowired
	HttpSession session;

	@GetMapping("/login")
	public String loginView(@ModelAttribute("acc") AccountBean acc, Model model) {
		return "account/login";
	}

	@PostMapping("/login")
	public String submit() {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		AccountEntity account = accountService.getByUserName(username, password);
		session.setAttribute("account", account);
		session.setAttribute("username", account.getUsername());
		session.setAttribute("password", account.getPassword());
		session.setAttribute("fullname", account.getFullname());
		session.setAttribute("role", account.getRole());

		if (account.getRole() == role.ADMIN) {
			return "redirect:admin/index";
		} else {
			return "redirect:user/index";
		}

	}
}
