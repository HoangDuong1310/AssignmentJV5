package assignment.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import assignment.repository.OrderDetailRepo;
import assignment.repository.OrderRepo;

@Controller
@RequestMapping("admin")
public class ListOrderController {
@Autowired
OrderRepo orderRepo;
@Autowired
OrderDetailRepo detailRepo;

	@GetMapping("purchasehistory")
	public String purchaseHistory(Model model) {
		model.addAttribute("listorderdetail", detailRepo.findAll());
		model.addAttribute("listorder", orderRepo.findAll());
		return"admin/BuyingHistory";
	}
}
