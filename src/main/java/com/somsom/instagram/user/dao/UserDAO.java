package com.somsom.instagram.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.somsom.instagram.user.model.User;

@Repository
public interface UserDAO {
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	// 아이디 중복체크
	public int selectDuplicateId(@Param("loginId") String loginId);
	
	public User selectIdPassword(
			@Param("loginId") String loginID,
			@Param("password") String password);
}
