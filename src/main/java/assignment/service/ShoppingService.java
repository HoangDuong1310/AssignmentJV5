package assignment.service;

import java.util.Collection;

import assignment.beans.ShoppingCartItem;

public interface ShoppingService {
	void add(Integer id);

	void remove(Integer id);

	ShoppingCartItem update(Integer id, int qty);

	void clear();

	Collection<ShoppingCartItem> getItems();

	int getCount();

	double getAmount();

}
