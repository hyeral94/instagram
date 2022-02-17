package com.somsom.instagram.post.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.instagram.common.FileManagerService;
import com.somsom.instagram.post.comment.bo.CommentBO;
import com.somsom.instagram.post.comment.model.Comment;
import com.somsom.instagram.post.dao.PostDAO;
import com.somsom.instagram.post.like.bo.LikeBO;
import com.somsom.instagram.post.model.Post;
import com.somsom.instagram.post.model.PostDetail;


@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {

		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, content, filePath);
	}
	
	public List<PostDetail> getPostList(int userId) {
		// post리스트 가져오기
		// post 대응하는 댓글 좋아요 가져오기 
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		List<Post> postList = postDAO.selectPostList();
		
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			// 해당하는 post id로 댓글 가져오기 
			List<Comment> commentList = commentBO.getCommentList(post.getId());
			
			int likeCount = likeBO.getLikeCount(post.getId());
			boolean isLike = likeBO.isLike(post.getId(), userId);
			
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			postDetail.setLikeCount(likeCount);
			postDetail.setLike(isLike);
			
			postDetailList.add(postDetail);
		}
		
		return postDetailList;
		
		
//		return postDAO.selectPostList();
	}
	
	//게시글 삭제
	public int deletePost(int postId, int userId) {
		
		//내가 작성한 글만 확인할 수 있도록
		Post post = postDAO.selectPost(postId); 
		
		if(post.getUserId() != userId) {
			return 0;
		}
		
		//좋아요 삭제
		likeBO.deleteLikeByPostId(postId);
		
		//댓글삭제
		commentBO.deleteComment(postId);
		
		//이미지 파일 삭제
		FileManagerService.removeFile(post.getImagePath());
		
		
		//포트스 삭제
		return postDAO.deletePost(postId);
	}


}