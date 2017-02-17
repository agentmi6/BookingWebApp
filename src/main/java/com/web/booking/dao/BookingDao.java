package com.web.booking.dao;

import java.util.List;

import com.web.booking.model.Booking;

public interface BookingDao {

	public List<Booking> getAllBookings();

	public void saveBooking(Booking booking);

	public void deleteBooking(int bookingId);

	public Booking getBooking(int bookingId);

	public int getRoomNumber(int bookingId);

	public void updateRoomStatus(int roomId);

	public void freeRoom(int roomId);

	public List<Booking> getBookingsForUserId(int userId);

	public void checkBookingDate();

	public void deleteExpiredBookings();
}
