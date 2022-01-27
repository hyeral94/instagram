package com.somsom.instagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.instagram.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestcontroller { //API 화면

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/sign_up")
	public Map<String, String> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/id_check")
	public Map<String, String> idDuplicateCheck(@RequestParam("userId") String userId) {
		int count = userBO.idDuplicateCheck(userId);
		
		Map<String, String> idCheck = new HashMap<>();
		
		if(count == 1) {
			idCheck.put("idCheck", "fail");
		}else {
			idCheck.put("idCheck", "success");
		}
		
		return idCheck;
	}
}
