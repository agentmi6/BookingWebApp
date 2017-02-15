package com.websystique.springsecurity.dao;

import java.util.List;

import com.websystique.springsecurity.model.Review;

public interface ReviewDao {

	public List<Review> getAllReviews();

	public void addReview(Review review);

	public void deleteReview(int reviewId);
}
