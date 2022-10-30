package assignment.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.hibernate.cache.spi.support.AbstractReadWriteAccess.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

//import com.example.demo.beans.ShoppingCardItem;

import assignment.beans.ShoppingCartItem;
import assignment.entitys.ProductEntity;
import assignment.repository.ProductRepo;
import assignment.service.ShoppingService;

@Service
@SessionScope
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	ProductRepo ProductRepo;

	Map<Integer, ShoppingCartItem> listOrdering = new HashMap<Integer,ShoppingCartItem>();

	@Override
	public void add(Integer id) {
		ShoppingCartItem item = listOrdering.get(id);
		System.out.println("in1: " + id);
		if (item == null) {
//			System.out.println( "in1:2 " + id);
			ProductEntity product = ProductRepo.findById(id).get();
//			item.setId(product.getId());
//			System.out.println( "in: " + item.getId());
//			item.setName(product.getName());
//			item.setPrice(product.getPrice());
//			item.setImage(product.getImage());
//			item.setQty(1);
			item = new ShoppingCartItem(product.getId(), product.getName(), product.getPrice(), product.getImage(), 1);
			listOrdering.put(id, item);
		} else {
			item.setQty(item.getQty() + 1);
		}
//		return item;
	}

	@Override
	public void remove(Integer id) {
		listOrdering.remove(id);

	}

	@Override
	public ShoppingCartItem update(Integer id, int qty) {
		ShoppingCartItem item = listOrdering.get(id);
		item.setQty(qty);
		return item;
	}

	@Override
	public void clear() {
		listOrdering.clear();

	}

	@Override
	public Collection<ShoppingCartItem> getItems() {
//		List<ShoppingCartItem> list = new ArrayList<>(listOrdering.values());
		return listOrdering.values();
	}

	@Override
	public int getCount() {

		return listOrdering.values().stream().mapToInt(item -> item.getQty()).sum();
	}

	@Override
	public double getAmount() {

		return listOrdering.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
	}

}
