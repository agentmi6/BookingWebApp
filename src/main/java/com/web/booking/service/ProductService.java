package com.web.booking.service;

import java.util.List;

import com.web.booking.model.Product;

public interface ProductService {

	public List<Product> getAllProducts();

	public void saveProduct(Product product);

	public void deleteProduct(int productId);

	public Product getProduct(int productId);

}
