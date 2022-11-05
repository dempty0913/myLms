package com.sp.lms.review;

import java.net.URLDecoder;
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

@Controller("review.reviewController")
@RequestMapping("/review/*")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "home")
	public String review(@RequestParam(value = "page", defaultValue = "1") int currentPage,
							@RequestParam(defaultValue = "") String keyword,
							HttpServletRequest req,
							Model model, HttpSession session) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			if (req.getMethod().equalsIgnoreCase("GET")) {
				keyword = URLDecoder.decode(keyword, "UTF-8");
			}
			
			map.put("keyword", keyword);

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
			
			map.put("start", start);
			map.put("end", end);
			
			List<Review> list = service.reviewList(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/review/home";
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
			model.addAttribute("keyword", keyword);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".review.reviewList";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam(value = "page", defaultValue = "1") int currentPage,
								HttpServletRequest req, @RequestParam int lectureNum, 
								Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		int rows = 10;
		int totalPage = 0;
		int dataCount = 0;
		
		map.put("lectureNum", lectureNum);
		
		dataCount = service.reviewDetailCount(map);
		
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
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		
		List<Review> list = service.reviewDetail(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/review/home";
		String query = "rows=" + rows;
		
		listUrl += "?" + query;
		
		String paging = myUtil.paging(currentPage, totalPage, listUrl);
		
		Review dto = service.lectureInfo(map);
		Review myRev = service.myReview(map);
		
		Level level = service.reviewAvg(map);
		
		model.addAttribute("list", list);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("page", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("rows", rows);
		model.addAttribute("dto", dto);
		model.addAttribute("myRev", myRev);
		model.addAttribute("level", level);
		
		return ".review.reviewDetail";
	}
	
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String insertReview(@RequestParam int lectureApplyNum, @RequestParam int lectureNum,
								Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNum", lectureNum);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		
		Review dto = service.lectureInfo(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "add");
	
		return ".review.reviewWrite";
	}	
	
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String submitReview(@RequestParam int lectureApplyNum, @RequestParam int lectureNum,
								Review dto,
								Model model, HttpSession session) {
		
		try {
			service.insertReview(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:/review/detail?lectureNum="+lectureNum;
	}	
	
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateReview(@RequestParam int lectureApplyNum, @RequestParam int lectureNum,
								Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lectureNum", lectureNum);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		
		Review dto = service.lectureInfo(map);
		Review myRev = service.myReview(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("myRev", myRev);
		model.addAttribute("mode", "update");
	
		return ".review.reviewWrite";
	}	
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmitReview(@RequestParam int lectureApplyNum, @RequestParam int lectureNum,
								Review dto,
								Model model, HttpSession session) {
		try {
			service.updateReview(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "redirect:/review/detail?lectureNum="+lectureNum;
	}	
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteReview(@RequestParam int lectureReviewNum, @RequestParam int lectureNum,
								Model model, HttpSession session) {
		
		try {
			service.deleteReview(lectureReviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/review/detail?lectureNum="+lectureNum;
	}
	
}
