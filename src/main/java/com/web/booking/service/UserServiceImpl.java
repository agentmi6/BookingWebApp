package com.web.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.booking.dao.UserDao;
import com.web.booking.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public User findById(int id) {
		return dao.findById(id);
	}

	public User findByUsername(String username) {
		return dao.findByUsername(username);
	}

	public void save(User user) {

		user.setPassword(passwordEncoder.encode(user.getPassword()));
		dao.save(user);
	}

	public List<User> getAllUsers() {
		return dao.getAllUsers();
	}

}
