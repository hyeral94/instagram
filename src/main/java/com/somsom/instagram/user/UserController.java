package com.somsom.instagram.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class UserController { //view 화면 

	@GetMapping("/signup_view")
	public String signUpView() {
		return "user/signUp";
	}
	
	@GetMapping("/singin_view")
	public String signInView() {
		return "user/signIn";
	}
}
