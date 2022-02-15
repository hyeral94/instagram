package com.somsom.instagram.post.model;

import java.util.List;

import com.somsom.instagram.post.comment.model.Comment;

public class PostDetail {
	// post 하나 + 댓글 리스트 + 좋아요 갯수
	private Post post;
	private List<Comment> commentList;
	private int likeCount;
	private boolean isLike;
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
