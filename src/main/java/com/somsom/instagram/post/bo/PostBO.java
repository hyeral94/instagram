package com.somsom.instagram.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.somsom.instagram.common.FileManagerService;
import com.somsom.instagram.post.dao.PostDAO;
import com.somsom.instagram.post.model.Post;


@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String userName, String content, MultipartFile file) {

		String filePath = FileManagerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, userName, content, filePath);
	}
	
	public List<Post> getPostList(){
		return postDAO.selectPostList();
		
	}
}
