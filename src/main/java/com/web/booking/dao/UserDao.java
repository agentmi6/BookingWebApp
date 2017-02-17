package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.User;

public interface UserDao {

	User findById(int id);

	User findByUsername(String username);

	public void save(User user);

	public List<User> getAllUsers();

}
