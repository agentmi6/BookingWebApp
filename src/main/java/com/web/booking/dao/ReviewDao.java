package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.Review;

public interface ReviewDao {

	public List<Review> getAllReviews();

	public void addReview(Review review);

	public void deleteReview(int reviewId);
}
