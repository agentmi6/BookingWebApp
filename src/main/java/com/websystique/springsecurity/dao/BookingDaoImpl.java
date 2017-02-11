package com.websystique.springsecurity.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.websystique.springsecurity.model.Booking;

@Repository
public class BookingDaoImpl implements BookingDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Booking> getAllBookings() {
		Session session = sessionFactory.getCurrentSession();

		Query<Booking> query = session.createQuery("from Booking", Booking.class);

		List<Booking> bookings = query.getResultList();

		return bookings;
	}

	@Override
	public void saveBooking(Booking booking) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(booking);
	}

	@Override
	public void deleteBooking(int bookingId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Booking where id=:bookingId");
		query.setParameter("bookingId", bookingId);

		query.executeUpdate();

	}

	@Override
	public Booking getBooking(int bookingId) {
		Session session = sessionFactory.getCurrentSession();

		Booking booking = session.get(Booking.class, bookingId);

		return booking;
	}

	@Override
	public void updateRoomStatus(int roomId) {

		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("update Room set room_available = false where room_id = :roomNumber");
		query.setParameter("roomNumber", roomId);
		query.executeUpdate();
	}

	@Override
	public void freeRoom(int roomId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("update Room set room_available = true where room_id = :roomNumber");
		query.setParameter("roomNumber", roomId);
		query.executeUpdate();
	}

	@Override
	public int getRoomNumber(int bookingId) {
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("select room.roomId from Booking where bookingId=:bookingId");

		query.setParameter("bookingId", bookingId);

		/* int roomNumber = ((Number) query.getSingleResult()).intValue(); */

		int roomNumber = (int) query.getSingleResult();

		return roomNumber;
	}

	@Override
	public List<Booking> getBookingsForUserId(int userId) {
		Session session = sessionFactory.getCurrentSession();

		Query<Booking> query = session.createQuery("from Booking where user_id=:userId", Booking.class);
		query.setParameter("userId", userId);
		List<Booking> bookings = query.getResultList();

		return bookings;
	}

}