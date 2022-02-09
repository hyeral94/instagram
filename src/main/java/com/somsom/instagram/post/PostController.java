package com.somsom.instagram.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String timelineView() {
		return "post/timeline";
	}
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/create";
	}
	
	@GetMapping("/createList_view")
	public String createListView(HttpServletRequest request,
			Model model) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postlist = postBO.getPostList(userId);
		model.addAttribute("postList", postlist);
		return "post/createList";
	}
}
