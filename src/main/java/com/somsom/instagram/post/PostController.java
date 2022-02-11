package com.somsom.instagram.post;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.somsom.instagram.post.bo.PostBO;
import com.somsom.instagram.post.model.Post;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/timeline_view")
	public String timelineView(Model model) {
		
		List<Post> postList = postBO.getPostList();
		
		model.addAttribute("postList", postList);
		
		return "post/timeline";
	}


}
