package com.sp.lms.dashBoard;

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

@Controller("dashBoard.dashBoardController")
@RequestMapping("/dashBoard/*")
public class DashBoardController {
	
	@Autowired
	private DashBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String dashBoard(@RequestParam(value = "page", defaultValue = "1") int currentPage,
							  HttpServletRequest req,
							  HttpSession session, 
							  Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();

		int rows = 6;
		int totalPage = 0;
		int dataCount = 0;
		
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
		
		List<DashBoard> list = service.dashBoardList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/dashBoard/home";
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

		return ".dashBoard.dashBoard";
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteDash(@RequestParam int lectureApplyNum) {
		
		try {
			service.deleteDash(lectureApplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/dashBoard/home";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detailDash(@RequestParam int lectureNum, Model model) {
		
		try {
			DashBoard dto = service.detailDash(lectureNum);
			
			model.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".dashBoard.dashBoardLecture";
	}
	
	
	@RequestMapping(value = "videoList")
	public String videoList(@RequestParam int lectureNum,
			HttpSession session,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("lectureNum", lectureNum);

		dataCount = service.videoCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		
		List<Video> videoList = service.videoList(map);

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("videoList", videoList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "dashBoard/videoList";
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String videoArticle(@RequestParam int videoFileNum, Model model) {
		Video dto = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("videoFileNum", videoFileNum);
			dto = service.videoArticle(map);
			
			model.addAttribute("dto", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return ".dashBoard.videoArticle";
	}
}
