package com.web.booking.service;

import java.util.List;

import com.web.booking.model.User;

public interface UserService {

	User findById(int id);

	User findByUsername(String username);

	void save(User user);

	public List<User> getAllUsers();

}