package assignment.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.beans.ShoppingCartItem;
import assignment.service.ShoppingService;

@Controller
@RequestMapping("/admin/cart")
public class CartController {
	@Autowired
	ShoppingService cartService;

	@GetMapping("")
	public String showCart(Model model) {
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "admin/CartAdmin";
	}

	@GetMapping("add/{id}")
	public String add(@PathVariable("id") Integer id, Model model) {
		cartService.add(id);
		model.addAttribute("amount", cartService.getAmount());
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/admin/list";
	}

	@PostMapping("update/{id}")
	public String update(@PathVariable Integer productID, @RequestParam("quantity") Integer quantity) {
		cartService.update(productID, quantity);
		return "redirect:/admin/CartAdmin";
	}

	@GetMapping("/clear")
	public String clearCart() {
		cartService.clear();
		return "redirect:/admin/CartAdmin";
	}

	@GetMapping("/delete/{id}")
	public String deleteByID(@PathVariable("id") Integer id, Model model) {
		cartService.remove(id);
		model.addAttribute("listCart", cartService.getItems());
		return "redirect:/admin/cart";
	}

}
