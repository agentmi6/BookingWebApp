package com.websystique.springsecurity.dao;

import com.websystique.springsecurity.model.User;

public interface UserDao {

	User findById(int id);

	User findByUsername(String username);

	public void save(User user);
}
