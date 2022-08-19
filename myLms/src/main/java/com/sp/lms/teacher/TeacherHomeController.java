package com.sp.lms.teacher;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.lms.member.SessionInfo;
import com.sp.lms.teacher.lecture.Lecture;
import com.sp.lms.teacher.lecture.LectureService;
import com.sp.lms.teacher.lecture.Project;
import com.sp.lms.teacher.lecture.Video;

@Controller("teacher.teacherHomeController")
@RequestMapping("/teacher/home/*")
public class TeacherHomeController {
	
	@Autowired
	private LectureService service;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();

			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			map.put("userId", userId);
			List<Lecture> list = service.lectureNameList(map);
			List<Project> projectList = service.projectList(map);
			List<Video> videoList = service.videoList(map);
			
			model.addAttribute("list", list);
			model.addAttribute("projectList", projectList);
			model.addAttribute("videoList", videoList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ".teacher.main.home";
	}
	
}
