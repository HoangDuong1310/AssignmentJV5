package assignment.controller.nonLogin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import assignment.beans.ShoppingCartItem;
import assignment.service.ShoppingService;

@Controller
@RequestMapping("/cart")
public class CartNonLoginController {
	@Autowired
	ShoppingService cartService;

	@GetMapping("")
	public String showCart(Model model) {
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "nonLogin/CartNonLogin";
	}

	@GetMapping("add/{id}")
	public String add(@PathVariable("id") Integer id, Model model) {
		cartService.add(id);
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/list";
	}

	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Integer id) {

		ShoppingCartItem item;
		return "redirect:/CartNonLogin";
	}

	@GetMapping("/clear")
	public String clearCart() {
		cartService.clear();
		return "redirect:/CartNonLogin";
	}

	@GetMapping("/delete/{id}")
	public String deleteByID(@PathVariable("id") Integer id, Model model) {
		cartService.remove(id);
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/cart";
	}

}
