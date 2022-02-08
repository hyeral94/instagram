package com.somsom.instagram.post.dao;

import org.apache.ibatis.annotations.Param;

public interface PostDAO {

	public int insertPost(
			@Param("userId") int userId,
			@Param("content") String content,
			@Param("file") String file);
}
