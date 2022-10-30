package assignment.controller.admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import assignment.beans.AccountBean;
import assignment.entitys.AccountEntity;
import assignment.repository.AccountRepo;

@Controller
@RequestMapping("admin")
public class AccountListAdminController {
	@Autowired
	AccountRepo accountRepo;
	@Autowired
	AccountBean accountBean;

	@GetMapping("accountlist")
	public String showListAcc(Model model) {
		List<AccountEntity> list = accountRepo.findAll();
		model.addAttribute("list", list);
		model.addAttribute("updateAcc", accountBean);
		return "admin/ListAccount";
	}

	@GetMapping("deleteAcc/{id}")
	public String deleteCate(@PathVariable("id") Integer id, Model model) {
		System.out.println(id);
		AccountEntity acc = accountRepo.getOne(id);
		accountRepo.delete(acc);
		return ("redirect:/admin/accountlist");
	}

	@GetMapping("updateAcc/{id}")
	public String updateAcc(@PathVariable("id") Integer id, Model model) {
		AccountEntity aEntity = accountRepo.findById(id).get();
		accountBean.setId(aEntity.getId());
		accountBean.setUsername(aEntity.getUsername());
		accountBean.setPassword(aEntity.getPassword());
		accountBean.setFullname(aEntity.getFullname());
		accountBean.setEmail(aEntity.getEmail());
		accountBean.setPhoto(aEntity.getPhoto());
		accountBean.setActivated(aEntity.getActivated());

		List<AccountEntity> list = accountRepo.findAll();
		model.addAttribute("list", list);
		model.addAttribute("updateAcc", accountBean);
		return "admin/ListAccount";
	}

	@PostMapping("updateAcc")
	public String updateAcc(@ModelAttribute("update") AccountBean accountBean, Model model) {
		AccountEntity accountEntity = accountRepo.getById(accountBean.getId());
		accountEntity.setId(accountBean.getId());
		accountEntity.setUsername(accountBean.getUsername());
		accountEntity.setPassword(accountBean.getPassword());
		accountEntity.setFullname(accountBean.getFullname());
		accountEntity.setEmail(accountBean.getEmail());
		accountEntity.setPhoto(accountBean.getPhoto());
		accountEntity.setActivated(accountBean.getActivated());
		accountRepo.save(accountEntity);
		return "redirect:/admin/list";
	}
}
