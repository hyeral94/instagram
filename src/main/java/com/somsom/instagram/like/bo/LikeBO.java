package com.somsom.instagram.like.bo;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.somsom.instagram.like.dao.LikeDAO;

@Service
public class LikeBO {

	@Autowired
	private	LikeDAO likeDAO;
	
	public int addLike(int postId, int userId) {
		return likeDAO.insertLike(postId, userId);
	}
	
	// postId로 좋아요 갯수 조회
	public int getLikeCount(int postId) {
		return likeDAO.selectLikeCount(postId);
	}
	
	// postId와 userId로 내가 좋아요를 눌렀는지 여부 확인
	public boolean isLike(int postId, int userId) {
		int count = likeDAO.selectLikeCountByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		}else {
			return true;
		}
		
		// or return !(count == 0);
		// or return !(likeDAO.selectLikeCountByUserId(postId, userId) == 0);
	}
}
