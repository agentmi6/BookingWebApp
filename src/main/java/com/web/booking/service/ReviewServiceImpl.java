package com.web.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.booking.dao.ReviewDao;
import com.web.booking.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;

	@Override
	@Transactional
	public List<Review> getAllReviews() {
		return reviewDao.getAllReviews();
	}

	@Override
	@Transactional
	public void addReview(Review review) {
		reviewDao.addReview(review);

	}

	@Override
	@Transactional
	public void deleteReview(int reviewId) {
		reviewDao.deleteReview(reviewId);

	}

}
