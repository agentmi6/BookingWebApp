package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.UserProfile;

public interface UserProfileDao {

	List<UserProfile> findAll();

	UserProfile findByType(String type);

	UserProfile findById(int id);
}
