package assignment.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import assignment.beans.ShoppingCartItem;
import assignment.entitys.AccountEntity;
import assignment.entitys.OrderDetailEntity;
import assignment.entitys.OrderEntity;
import assignment.entitys.ProductEntity;
import assignment.repository.OrderDetailRepo;
import assignment.repository.OrderRepo;
import assignment.repository.ProductRepo;
import assignment.service.ShoppingService;

@Controller
@RequestMapping("admin")
public class CheckOutAdminController {
	@Autowired
	HttpServletRequest req;
	@Autowired
	HttpServletResponse res;
	@Autowired
	HttpSession session;
	@Autowired
	OrderRepo orderRepo;
	@Autowired
	ShoppingService shoppingService;
	@Autowired
	ProductRepo productRepo;
	@Autowired
	OrderDetailRepo detailRepo;

	@GetMapping("checkout")
	public String showCheckout(Model model) {
		 session = req.getSession();
		Collection<ShoppingCartItem> shoppingCartItemss = shoppingService.getItems();
		model.addAttribute("listCart", shoppingCartItemss);
		model.addAttribute("total", shoppingService.getAmount());
		return "admin/CheckOutAdmin"; 
	}

	@PostMapping("pay")
	public String pay() {
		String address = req.getParameter("address");
		AccountEntity account = (AccountEntity) session.getAttribute("account");
		String username = account.getUsername();
		OrderEntity order = new OrderEntity();
		order.setAccount(account);
		order.setAddress(address);
		orderRepo.save(order);
		Collection<ShoppingCartItem> items = shoppingService.getItems();
		List<OrderEntity> listorder = orderRepo.findAll();
		List<ProductEntity> products = productRepo.findAll();
		OrderEntity orderID = listorder.get(listorder.size() - 1);
		List<OrderDetailEntity> listOrderDetail = new ArrayList<>();
		
		for (ShoppingCartItem item : items) {
			OrderDetailEntity orderDetail = new OrderDetailEntity();
			orderDetail.setOrder(orderID);
			orderDetail.setPrice(item.getPrice());
			orderDetail.setQuantity(item.getQty());
			for (ProductEntity p : products) {
				if (p.getId().equals(item.getId())) {
					orderDetail.setProduct(p);
				}
			}
			listOrderDetail.add(orderDetail);
		}
		detailRepo.saveAll(listOrderDetail);
		shoppingService.clear();
		return "redirect:/admin/list";
	}
}
