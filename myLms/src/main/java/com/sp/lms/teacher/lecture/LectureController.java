package com.sp.lms.teacher.lecture;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.lms.common.MyUtil;
import com.sp.lms.member.SessionInfo;

@Controller("teacher.lecture.lectureController")
@RequestMapping("/teacher/lecture/*")
public class LectureController {
	
	@Autowired
	private LectureService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String lectureList(@RequestParam(value = "page", defaultValue = "1") int currentPage,
							  HttpServletRequest req,
							  HttpSession session, 
							  Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		int rows = 5;
		int totalPage = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		dataCount = service.dataCount(map);
		
		if(dataCount != 0) {
			totalPage = myUtil.pageCount(rows, dataCount);
		}
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * rows + 1;
		int end = currentPage * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Lecture> list = service.lectureList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/teacher/lecture/home";
		String query = "rows=" + rows;
		
		listUrl += "?" + query;
		
		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("page", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("rows", rows);
		
		return ".teacher.lecture.lectureList";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String lectureAdd(Model model) {
		
		model.addAttribute("mode", "add");
		
		return ".teacher.lecture.lectureAdd";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String lectureSubmit(Lecture dto, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			List<String> list = dto.getDays();
			String day = String.join(",", list);
	        list = dto.getTimes();
	        String time = String.join(",", list);
	        dto.setDay(day);
	        dto.setTime(time);
	        
	        service.insertLecture(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/home";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String lectureUpdate(@RequestParam int lectureNum, Model model) {
		
		Lecture dto = service.lectureDetail(lectureNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".teacher.lecture.lectureAdd";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(Lecture dto, HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			List<String> list = dto.getDays();
			String day = String.join(",", list);
	        list = dto.getTimes();
	        String time = String.join(",", list);
	        dto.setDay(day);
	        dto.setTime(time);
	        
	        service.updateLecture(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/home";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteLecture(@RequestParam int lectureNum) {
		
		try {
			service.deleteLecture(lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/home";
	}
	
	@RequestMapping(value = "videoList", method = RequestMethod.GET)
	public String videoList(HttpServletRequest req,
							  HttpSession session, 
							  Model model) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			map.put("userId", userId);
			
			List<Video> videoList = service.videoList(map);
			List<Lecture> list = service.lectureNameList(map);
			
			model.addAttribute("list", list);
			model.addAttribute("videoList", videoList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".teacher.lecture.lectureVideo";
	}
	
	@RequestMapping(value = "videoAdd", method = RequestMethod.GET)
	public String videoAdd(HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		List<Lecture> list = service.lectureNameList(map);
		
		model.addAttribute("mode", "add");
		model.addAttribute("list", list);
		
		return ".teacher.lecture.videoAdd";
	}
	
	@RequestMapping(value = "videoAdd", method = RequestMethod.POST)
	public String videoSubject(HttpSession session, Video dto) {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "video";
			
			service.insertVideo(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/videoList";
	}
	
	
	
	@RequestMapping(value = "projectList", method = RequestMethod.GET)
	public String projectList(HttpServletRequest req,
							  HttpSession session, 
							  Model model) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();

			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			map.put("userId", userId);
			
			List<Lecture> list = service.lectureNameList(map);
			List<Project> projectList = service.projectList(map);
			
			model.addAttribute("list", list);
			model.addAttribute("projectList", projectList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".teacher.lecture.projectList";
	}
	
	@RequestMapping(value = "project/add", method = RequestMethod.GET)
	public String projectAdd(HttpSession session, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		List<Lecture> list = service.lectureNameList(map);
		
		model.addAttribute("mode", "add");
		model.addAttribute("list", list);
		
		return ".teacher.lecture.projectAdd";
	}
	
	@RequestMapping(value = "project/add", method = RequestMethod.POST)
	public String projectSubmit(Project dto, HttpSession session) {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "project";
	       
			service.insertProject(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/projectList";
	}
}
