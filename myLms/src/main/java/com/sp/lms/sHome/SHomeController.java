package com.sp.lms.sHome;

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

@Controller("home.sHomeController")
@RequestMapping("/home/*")
public class SHomeController {
	
	@Autowired
	private SHomeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(@RequestParam(value = "page", defaultValue = "1") int currentPage,
					  HttpServletRequest req,
					  HttpSession session, 
					  Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		int rows = 5;
		int totalPage = 0;
		int dataCount = 0;
		
		dataCount = service.dataCount();
		
		if(dataCount != 0) {
			totalPage = myUtil.pageCount(rows, dataCount);
		}
		
		if(currentPage > totalPage) {
			currentPage = totalPage;
		}
		
		int start = (currentPage - 1) * rows + 1;
		int end = currentPage * rows;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		
		map.put("start", start);
		map.put("end", end);
		
		List<SHome> list = service.sHomeList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/home/home";
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

		return ".main.home";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String addLecture(@RequestParam int lectureNum, HttpSession session) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("lectureNum", lectureNum);
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			map.put("userId", userId);
			
			service.addLecture(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/home/home";
	}
	
}
