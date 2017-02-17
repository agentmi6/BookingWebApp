package com.web.booking.controller;

import java.util.List;
import java.util.stream.Collectors;

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

import com.web.booking.model.Review;
import com.web.booking.model.User;
import com.web.booking.service.ReviewService;
import com.web.booking.service.UserService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private UserService userService;

	@Autowired
	private ReviewService reviewService;

	@GetMapping("/reviews")
	public String getAllReviews(Model model) {

		List<Review> reviews = reviewService.getAllReviews();
		model.addAttribute("reviews", reviews);
		model.addAttribute("currentUser", getCurrentUser());

		return "review/reviews";
	}

	@GetMapping("/addReview")
	public String addReview(Model model) {

		List<Review> review = reviewService.getAllReviews().stream()
				.filter(r -> r.getUser().getId() == getCurrentUser().getId()).collect(Collectors.toList());

		model.addAttribute("reviews", review);
		model.addAttribute("currentUserId", getCurrentUser().getId());
		model.addAttribute("review", new Review());

		return "review/review-form";
	}

	@PostMapping("/saveReview")
	public String saveReview(@ModelAttribute("review") @Valid Review review, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "review/review-form";
		}

		reviewService.addReview(review);

		model.addAttribute("currentUser", getCurrentUser());

		return "review/reviewAdded";
	}

	private User getCurrentUser() {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();

		User user = userService.findByUsername(userDetail.getUsername());

		return user;

	}
}
