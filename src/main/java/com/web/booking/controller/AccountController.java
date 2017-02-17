package com.web.booking.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.booking.model.User;
import com.web.booking.model.UserProfile;
import com.web.booking.service.UserProfileService;
import com.web.booking.service.UserService;

@Controller
public class AccountController {

	@Autowired
	private UserProfileService userProfileService;

	@Autowired
	private UserService userService;

	/*
	 * @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	 * public String homePage(ModelMap model) { model.addAttribute("user",
	 * getPrincipal()); return "welcome"; }
	 */

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "account/admin";
	}

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "account/accessDenied";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {
		model.addAttribute("user", new User());
		return "account/login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/";
	}

	// Registration GET //

	@RequestMapping(value = "/newUser", method = RequestMethod.GET)
	public String newRegistration(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "account/newuser";
	}

	// Registration POST //

	@RequestMapping(value = "/newUser", method = RequestMethod.POST)
	public String saveRegistration(@Valid User user, BindingResult result, ModelMap model) {

		if (result.hasErrors()) {
			System.out.println("There are errors");
			return "account/newuser";
		}

		// Set default UserProfle as USER
		Set<UserProfile> userProfiles = new HashSet<UserProfile>();
		UserProfile userProfile = userProfileService.findByType("USER");
		userProfiles.add(userProfile);
		user.setUserProfiles(userProfiles);

		try {
			userService.save(user);

		} catch (Exception e) {
			model.addAttribute("exception", e);
			model.addAttribute("checkUserName", "That username is already taken");
			return "account/newuser";
		}

		model.addAttribute("user", user.getFirstName());

		return "account/registrationsuccess";
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

	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
		return userProfileService.findAll();
	}

}