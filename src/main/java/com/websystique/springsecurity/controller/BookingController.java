package com.websystique.springsecurity.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.websystique.springsecurity.model.Booking;
import com.websystique.springsecurity.model.Room;
import com.websystique.springsecurity.model.RoomType;
import com.websystique.springsecurity.model.User;
import com.websystique.springsecurity.service.BookingService;
import com.websystique.springsecurity.service.RoomService;
import com.websystique.springsecurity.service.RoomTypeService;
import com.websystique.springsecurity.service.UserService;

@Controller
@RequestMapping("/booking")
public class BookingController {

	@Autowired
	private UserService userService;

	@Autowired
	private BookingService bookingService;

	@Autowired
	private RoomService roomService;

	@Autowired
	private RoomTypeService roomTypeService;

	///// bookings by user ////////

	@GetMapping("/bookings")
	public String getBookingsByUser(Model model) {

		List<Booking> bookings = bookingService.getBookingsForUserId(getCurrentUserId());

		model.addAttribute("bookings", bookings);
		model.addAttribute("currentUserId", getCurrentUserId());
		model.addAttribute("currentUser", getPrincipal());

		return "booking-list";
	}

	@GetMapping("/addBooking")
	public String addBooking(Model model) {

		List<Booking> bookings = bookingService.getAllBookings();
		List<Room> rooms = roomService.getAllRooms();
		List<RoomType> roomTypes = roomTypeService.getRoomTypes();

		model.addAttribute("currentUserId", getCurrentUserId());
		model.addAttribute("bookings", bookings);
		model.addAttribute("rooms", rooms);
		model.addAttribute("roomTypes", roomTypes);
		model.addAttribute("booking", new Booking());

		return "booking-form";
	}

	@PostMapping("/saveBooking")
	public String saveBooking(@ModelAttribute("booking") @Valid Booking booking,
			@RequestParam("room.roomId") int roomId, BindingResult result) {

		if (result.hasErrors()) {
			return "booking-form";
		}

		int roomNumber = roomId;
		bookingService.updateRoomStatus(roomNumber);

		bookingService.saveBooking(booking);

		return "redirect:/booking/bookings";
	}

	@GetMapping("/getBooking")
	public String getBooking(@RequestParam("bookingId") int bookingId, Model model) {

		List<Room> rooms = roomService.getAllRooms();
		List<RoomType> roomTypes = roomTypeService.getRoomTypes();

		Booking booking = bookingService.getBooking(bookingId);

		model.addAttribute("booking", booking);
		model.addAttribute("rooms", rooms);
		model.addAttribute("roomTypes", roomTypes);

		return "booking-form";
	}

	@GetMapping("/delete")
	public String deleteBooking(@RequestParam("bookingId") int bookingId) {

		int roomNumber = bookingService.getRoomNumber(bookingId);

		bookingService.freeRoom(roomNumber);

		bookingService.deleteBooking(bookingId);

		return "redirect:/booking/bookings";
	}

	private String getPrincipal() {

		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

	private int getCurrentUserId() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();

		User user = userService.findByUsername(userDetail.getUsername());
		int currentUserId = user.getId();

		return currentUserId;
	}

}
