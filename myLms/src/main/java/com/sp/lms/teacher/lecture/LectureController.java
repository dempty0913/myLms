package com.sp.lms.teacher.lecture;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("teacher.lecture.lectureController")
@RequestMapping("/teacher/lecture/*")
public class LectureController {
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String lectureList(Model model) {
		
		return ".teacher.lecture.lectureList";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String lectureAdd(Model model) {
		
		return ".teacher.lecture.lectureAdd";
	}
}
