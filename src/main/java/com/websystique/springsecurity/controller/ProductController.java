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

import com.websystique.springsecurity.model.Product;
import com.websystique.springsecurity.model.User;
import com.websystique.springsecurity.service.ProductService;
import com.websystique.springsecurity.service.UserService;

@Controller
@RequestMapping("/p")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@GetMapping("/products")
	public String getProductList(Model model) {

		List<Product> products = productService.getAllProducts();

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();

		User user = userService.findBySso(userDetail.getUsername());
		int currentUserId = user.getId();

		model.addAttribute("currentUserId", currentUserId);
		model.addAttribute("products", products);
		model.addAttribute("currentUser", getPrincipal());

		return "product-list";
	}

	@GetMapping("/addProduct")
	public String addProduct(Model model) {

		Product product = new Product();
		model.addAttribute("product", product);

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();

		User user = userService.findBySso(userDetail.getUsername());
		int currentUserId = user.getId();

		model.addAttribute("currentUserId", currentUserId);

		return "product-form";
	}

	@PostMapping("/saveProduct")
	public String saveProduct(@ModelAttribute("product") @Valid Product product, BindingResult result) {

		if (result.hasErrors()) {
			return "product-form";
		}
		productService.saveProduct(product);

		return "redirect:/p/products";

	}

	@GetMapping("/getProduct")
	public String getProduct(@RequestParam("productId") int productId, Model model) {

		Product product = productService.getProduct(productId);

		model.addAttribute("product", product);

		return "product-form";

	}

	@GetMapping("/delete")
	public String deleteProduct(@RequestParam("productId") int productId) {

		productService.deleteProduct(productId);

		return "redirect:/p/products";
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

}
