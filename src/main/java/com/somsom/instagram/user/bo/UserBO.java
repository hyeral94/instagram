package com.somsom.instagram.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.instagram.common.EncryptUtils;
import com.somsom.instagram.user.dao.UserDAO;

@Service
public class UserBO {
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(String loginId, String password, String name, String email) {
		
		String encPassword = EncryptUtils.mb5(password);
		
		return userDAO.insertUser(loginId, encPassword, name, email);
	}
	
	public int idDuplicateCheck(String userId) {
		return userDAO.idDuplicateCheck(userId);
	}
}
