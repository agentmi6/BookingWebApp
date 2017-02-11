package com.websystique.springsecurity.dao;

import java.util.List;

import com.websystique.springsecurity.model.User;

public interface UserDao {

	User findById(int id);

	User findByUsername(String username);

	public void save(User user);

	public List<User> getAllUsers();

}
