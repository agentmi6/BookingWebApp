package com.websystique.springsecurity.dao;

import java.util.List;

import com.websystique.springsecurity.model.Product;

public interface ProductDAO {

	public List<Product> getAllProducts();

	public void saveProduct(Product product);

	public void deleteProduct(int productId);

	public Product getProduct(int productId);

}
