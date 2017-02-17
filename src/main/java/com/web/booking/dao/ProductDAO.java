package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.Product;

public interface ProductDAO {

	public List<Product> getAllProducts();

	public void saveProduct(Product product);

	public void deleteProduct(int productId);

	public Product getProduct(int productId);

}
