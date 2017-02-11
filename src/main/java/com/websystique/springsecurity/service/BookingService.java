package com.websystique.springsecurity.service;

import java.util.List;

import com.websystique.springsecurity.model.Booking;

public interface BookingService {

	public List<Booking> getAllBookings();

	public void saveBooking(Booking booking);

	public void deleteBooking(int bookingId);

	public Booking getBooking(int bookingId);

	public int getRoomNumber(int bookingId);

	public void updateRoomStatus(int roomId);

	public void freeRoom(int roomId);

	public List<Booking> getBookingsForUserId(int userId);

}
