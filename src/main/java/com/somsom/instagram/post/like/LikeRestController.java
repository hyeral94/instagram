package com.somsom.instagram.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.somsom.instagram.post.like.bo.LikeBO;

@RestController
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@GetMapping("/post/like")
	public Map<String, Boolean> like(
			@RequestParam("postId") int postId,
			HttpServletRequest requset) {
					
		HttpSession session = requset.getSession();
		int userId = (Integer)session.getAttribute("userId");
		boolean isLike = likeBO.like(postId, userId);
		
		// 좋아요 {"isLike":true}
		// 좋아요 취소 {"isLike":false}
		
		Map<String, Boolean> result = new HashMap<>();
		if(isLike) {
			result.put("isLike", true);
		}else {
			result.put("isLike", false);
		}
		
		// or result.put("isLike", isLike);
		return result;
	}
	
	//좋아요 취소
	@GetMapping("/post/unlike")
	public Map<String, String> unlike(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = likeBO.deleteLike(postId, userId);

		Map<String, String> result = new HashMap<>();
		
		if(count == 0) {
			result.put("result", "fail");
		}else {
			result.put("result", "success");
		}
		
		return result;

	}
	
}