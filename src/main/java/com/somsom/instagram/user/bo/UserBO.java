package com.somsom.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.instagram.common.EncryptUtils;
import com.somsom.instagram.user.dao.UserDAO;
import com.somsom.instagram.user.model.User;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		//비밀번호 암호화
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.insertUser(loginId, encPassword, name, email);
	}
	
	public boolean isDuplicateId(String loginId) {
		if(userDAO.selectDuplicateId(loginId) == 0) {
			return false;
		} else {
			return true;
		}

	}
	
	public User signInUser(String loginId, String password) {
		
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.selectIdPassword(loginId, encPassword);
	}
}
