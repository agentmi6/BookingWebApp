package com.websystique.springsecurity.service;

import java.util.List;

import com.websystique.springsecurity.model.Review;

public interface ReviewService {

	public List<Review> getAllReviews();

	public void addReview(Review review);

	public void deleteReview(int reviewId);
}
