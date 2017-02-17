package com.web.booking.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.booking.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Review> getAllReviews() {
		Session session = sessionFactory.getCurrentSession();

		Query<Review> query = session.createQuery("from Review", Review.class);

		List<Review> reviews = query.getResultList();

		return reviews;

	}

	@Override
	public void addReview(Review review) {
		Session session = sessionFactory.getCurrentSession();

		session.save(review);

	}

	@Override
	public void deleteReview(int reviewId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Review where review_id=:reviewId");
		query.setParameter("reviewId", reviewId);

		query.executeUpdate();

	}

}
