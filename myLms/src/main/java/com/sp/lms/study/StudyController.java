package com.sp.lms.study;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.lms.common.MyUtil;
import com.sp.lms.member.SessionInfo;

@Controller("study.studyController")
@RequestMapping("/study/*")
public class StudyController {
	
	@Autowired
	private StudyService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String study(@RequestParam(value = "page", defaultValue = "1") int currentPage,
						HttpServletRequest req,
						Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		int rows = 5;
		int totalPage = 0;
		int dataCount = 0;
		
		dataCount = service.studyCount(map);
		
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
		
		List<Study> list = service.studyList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/study/home";
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

		return ".study.myStudy";
	}
	
	@RequestMapping(value = "myTab", method = RequestMethod.GET)
	public String myStudyTab(@RequestParam(value = "page", defaultValue = "1") int currentPage,
						HttpServletRequest req,
						Model model, HttpSession session) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);

		int rows = 5;
		int totalPage = 0;
		int dataCount = 0;
		
		dataCount = service.myStudyCount(map);
		
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
		
		List<Study> list = service.myStudyList(map);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/study/myTab";
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

		return ".study.myStudyTab";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String insertStudyForm(Model model) {
		
		model.addAttribute("mode", "add");
		
		return ".study.studyWrite";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String insertStudySubmit(Model model, Study dto) {
		
		try {
			service.insertStudy(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/study/home";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String studyDetail(@RequestParam int studyNum, Model model) {
		
		Study dto = service.studyDetail(studyNum);
		
		model.addAttribute("dto", dto);
		
		return ".study.myStudyDetail";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String updateStudyForm(@RequestParam int studyNum, Model model) {
		
		Study dto = service.studyDetail(studyNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".study.studyWrite";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateStudySubmit(Model model, Study dto) {
		
		try {
			service.updateStudy(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/study/detail?studyNum=" + dto.getStudyNum();
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteStudy(Model model, @RequestParam int studyNum) {
		
		try {
			service.deleteStudy(studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/study/home";
	}
	
	@RequestMapping(value = "listReply")
	public String listReply(@RequestParam int studyNum, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("studyNum", studyNum);
		
		String writerId = service.writerId(studyNum).getWriterId();
		
		dataCount = service.replyCount(map);
		
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Reply> listReply = service.replyList(map);
		
		for (Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}

		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("writerId", writerId);
		
		return "study/listReply";
		
	}
	
	// 댓글 및 댓글의 답글 등록
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	// 댓글의 답글 리스트 : AJAX-TEXT
	@RequestMapping(value = "listReplyAnswer")
	public String listReplyAnswer(@RequestParam int studyNum, @RequestParam int parent, 
									Model model) throws Exception {
		
		String writerId = service.writerId(studyNum).getWriterId();
		
		List<Reply> listReplyAnswer = service.listReplyAnswer(parent);
		
		for (Reply dto : listReplyAnswer) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}

		model.addAttribute("listReplyAnswer", listReplyAnswer);
		model.addAttribute("writerId", writerId);
		
		return "study/listReplyAnswer";
	}

	// 댓글의 답글 개수 : AJAX-JSON
	@RequestMapping(value = "countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(@RequestParam(value = "parent") int parent) {
		int count = service.replyAnswerCount(parent);

		Map<String, Object> model = new HashMap<>();
		model.put("count", count);
		return model;
	}
	
}
