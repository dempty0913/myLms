package com.sp.lms.study;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("study.studyController")
@RequestMapping("/study/*")
public class StudyController {

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String study(Model model, HttpSession session) {

		return ".study.myStudy";
	}
}
