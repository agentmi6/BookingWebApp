package com.web.booking.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.booking.model.Room;
import com.web.booking.model.RoomType;
import com.web.booking.service.RoomService;
import com.web.booking.service.RoomTypeService;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private RoomTypeService roomTypeService;

	@GetMapping("/rooms")
	public String getRooms(Model model) {

		List<Room> rooms = roomService.getAllRooms();
		model.addAttribute("rooms", rooms);

		return "room/room-list";
	}

	@GetMapping("/addRoom")
	public String addRoom(Model model) {

		List<RoomType> roomTypes = roomTypeService.getRoomTypes();

		model.addAttribute("room", new Room());
		model.addAttribute("roomTypes", roomTypes);

		return "room/room-form";
	}

	@PostMapping("/saveRoom")
	public String saveRoom(@ModelAttribute("room") @Valid Room room, BindingResult result) {

		if (result.hasErrors()) {
			return "room/room-form";
		}

		roomService.saveRoom(room);

		return "redirect:/room/rooms";
	}

	@GetMapping("/getRoom")
	public String getRoom(@RequestParam("roomId") int roomId, Model model) {

		Room room = roomService.getRoom(roomId);
		List<RoomType> roomTypes = roomTypeService.getRoomTypes();

		model.addAttribute("room", room);
		model.addAttribute("roomTypes", roomTypes);

		return "room/room-form";
	}

	@GetMapping("/delete")
	public String deleteRoom(@RequestParam("roomId") int roomId) {

		roomService.deleteRoom(roomId);
		return "redirect:/room/rooms";
	}

}
