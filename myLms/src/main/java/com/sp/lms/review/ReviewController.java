package com.sp.lms.review;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("review.reviewController")
@RequestMapping("/review/*")
public class ReviewController {
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String review(Model model, HttpSession session) {

		return ".review.reviewList";
	}
}
