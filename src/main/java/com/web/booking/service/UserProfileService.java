package com.web.booking.service;

import java.util.List;

import com.web.booking.model.UserProfile;

public interface UserProfileService {

	List<UserProfile> findAll();

	UserProfile findByType(String type);

	UserProfile findById(int id);
}