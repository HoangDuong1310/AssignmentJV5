package assignment.controller.account;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import assignment.beans.AccountBean;
import assignment.entitys.AccountEntity;
import assignment.repository.AccountRepo;

@Controller
public class RegisterController {
	private final AccountEntity accE = new AccountEntity();
	@Autowired
	AccountBean accountBean;
	@Autowired
	AccountRepo accountRepo;

	@GetMapping("/register")
	public String registerView(Model model) {
		model.addAttribute("register", accountBean);
		return "account/register";
	}

	@PostMapping("/register")
	public String submit(@ModelAttribute("register") AccountBean accountBean, Model model) {
		accE.setFullname(accountBean.getFullname());
		accE.setUsername(accountBean.getUsername());
		accE.setEmail(accountBean.getEmail());
		accE.setPassword(accountBean.getPassword());
		accountRepo.save(accE);
		return "redirect:login";
	}
}
