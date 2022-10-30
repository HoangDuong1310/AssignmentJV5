package assignment.controller.user;

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
@RequestMapping("/user/cart")
public class CartUserController {
	@Autowired
	ShoppingService cartService;

	@GetMapping("")
	public String showCart(Model model) {
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "user/CartUser";
	}

	@GetMapping("add/{id}")
	public String add(@PathVariable("id") Integer id, Model model) {
		cartService.add(id);
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/user/list";
	}

	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Integer id) {

		ShoppingCartItem item;
		return "redirect:/user/CartUser";
	}

	@GetMapping("/clear")
	public String clearCart() {
		cartService.clear();
		return "redirect:/user/CartUser";
	}

	@GetMapping("/delete/{id}")
	public String deleteByID(@PathVariable("id") Integer id, Model model) {
		cartService.remove(id);
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/user/cart";
	}

}
