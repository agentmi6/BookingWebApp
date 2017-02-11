package com.websystique.springsecurity.service;

import java.util.List;

import com.websystique.springsecurity.model.User;

public interface UserService {

	User findById(int id);

	User findByUsername(String username);

	void save(User user);

	public List<User> getAllUsers();

}