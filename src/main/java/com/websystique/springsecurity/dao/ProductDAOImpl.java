package com.websystique.springsecurity.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.websystique.springsecurity.model.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Product> getAllProducts() {
		Session session = sessionFactory.getCurrentSession();

		Query<Product> query = session.createQuery("from Product", Product.class);

		List<Product> products = query.getResultList();

		return products;
	}

	@Override
	public void saveProduct(Product product) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(product);
	}

	@Override
	public void deleteProduct(int productId) {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Product where id=:productId");
		query.setParameter("productId", productId);

		query.executeUpdate();

	}

	@Override
	public Product getProduct(int productId) {

		Session session = sessionFactory.getCurrentSession();

		Product product = session.get(Product.class, productId);

		return product;
	}

}
