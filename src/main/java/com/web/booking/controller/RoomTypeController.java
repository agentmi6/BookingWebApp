package com.web.booking.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.booking.model.RoomType;
import com.web.booking.service.RoomTypeService;

@Controller
@Secured(value = { "ADMIN" })
@RequestMapping("/roomType")
public class RoomTypeController {

	@Autowired
	private RoomTypeService roomTypeService;

	@GetMapping("/roomTypes")
	public String getRoomTypes(Model model) {

		List<RoomType> roomTypes = roomTypeService.getRoomTypes();

		model.addAttribute("roomTypes", roomTypes);

		return "roomType-list";
	}

	@GetMapping("/addRoomType")
	public String addRoomType(Model model) {

		model.addAttribute("roomType", new RoomType());

		return "roomType-form";
	}

	@PostMapping("/saveRoomType")
	public String saveRoomType(@ModelAttribute("roomType") @Valid RoomType roomType, BindingResult result) {

		if (result.hasErrors()) {
			return "roomType-form";
		}

		roomTypeService.saveRoomType(roomType);

		return "redirect:/roomType/roomTypes";

	}

	@GetMapping("/getRoomType")
	public String getRoomType(@ModelAttribute("roomTypeId") int roomTypeId, Model model) {

		RoomType roomType = roomTypeService.getRoomType(roomTypeId);

		model.addAttribute("roomType", roomType);

		return "roomType-form";
	}

	@GetMapping("/delete")
	public String deleteRoom(@RequestParam("roomTypeId") int roomTypeId) {
		roomTypeService.deleteRoomType(roomTypeId);

		return "redirect:/roomType/roomTypes";

	}

}
