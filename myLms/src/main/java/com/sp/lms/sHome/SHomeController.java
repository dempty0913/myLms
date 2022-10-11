package com.sp.lms.sHome;

import java.net.URLDecoder;
import java.net.URLEncoder;
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
	
	@RequestMapping(value = "home")
	public String home(@RequestParam(value = "page", defaultValue = "1") int currentPage,
					  @RequestParam(defaultValue = "") String keyword,	
					  HttpServletRequest req,
					  HttpSession session, 
					  Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		map.put("keyword", keyword);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);

		int rows = 5;
		int totalPage = 0;
		int dataCount = 0;
		
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
		
		List<SHome> list = service.sHomeList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/home/home";
		String query = "rows=" + rows;
		if (keyword.length() != 0) {
			query += "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		
		listUrl += "?" + query;
		
		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("page", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("rows", rows);
		model.addAttribute("keyword", keyword);

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
