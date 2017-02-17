package com.web.booking.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.booking.dao.BookingDao;
import com.web.booking.model.Booking;

@Service
public class BookingServiceImpl implements BookingService {

	@Autowired
	private BookingDao bookingDao;

	@Override
	@Transactional
	public List<Booking> getAllBookings() {
		return bookingDao.getAllBookings();
	}

	@Override
	@Transactional
	public void saveBooking(Booking booking) {
		bookingDao.saveBooking(booking);
	}

	@Override
	@Transactional
	public void deleteBooking(int bookingId) {
		bookingDao.deleteBooking(bookingId);

	}

	@Override
	@Transactional
	public Booking getBooking(int bookingId) {
		return bookingDao.getBooking(bookingId);
	}

	@Override
	@Transactional
	public void updateRoomStatus(int roomId) {
		bookingDao.updateRoomStatus(roomId);
	}

	@Override
	@Transactional
	public int getRoomNumber(int bookingId) {
		return bookingDao.getRoomNumber(bookingId);
	}

	@Override
	@Transactional
	public void freeRoom(int roomId) {
		bookingDao.freeRoom(roomId);
	}

	@Override
	@Transactional
	public List<Booking> getBookingsForUserId(int userId) {
		return bookingDao.getBookingsForUserId(userId);
	}

	@Override
	@Transactional
	public void checkBookingDate() {
		bookingDao.checkBookingDate();
	}

	@Override
	@Transactional
	public void deleteExpiredBookings() {
		bookingDao.deleteExpiredBookings();
	}

}
