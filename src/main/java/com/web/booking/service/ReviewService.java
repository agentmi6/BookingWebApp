package com.web.booking.service;

import java.util.List;

import com.web.booking.model.Review;

public interface ReviewService {

	public List<Review> getAllReviews();

	public void addReview(Review review);

	public void deleteReview(int reviewId);
}
