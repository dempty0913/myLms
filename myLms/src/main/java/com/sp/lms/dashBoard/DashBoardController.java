package com.sp.lms.dashBoard;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.lms.common.FileManager;
import com.sp.lms.common.MyUtil;
import com.sp.lms.member.SessionInfo;
import com.sp.lms.teacher.lecture.Project;

@Controller("dashBoard.dashBoardController")
@RequestMapping("/dashBoard/*")
public class DashBoardController {
	
	@Autowired
	private DashBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
	public String detailDash(@RequestParam int lectureNum, @RequestParam int lectureApplyNum, 
							@RequestParam(defaultValue="0") double saveTime, @RequestParam int mode,
							@RequestParam(defaultValue="0") int videoFileNum, Model model) {
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			if(saveTime != 0) {
				map.put("lectureApplyNum", lectureApplyNum);
				map.put("saveTime", saveTime);
				map.put("videoFileNum", videoFileNum);
				
				service.saveTime(map);
			}
			
			DashBoard dto = service.detailDash(lectureNum);
			
			model.addAttribute("dto", dto);
			model.addAttribute("mode", mode);
			model.addAttribute("lectureApplyNum", lectureApplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".dashBoard.dashBoardLecture";
	}
	
	@RequestMapping(value = "checkList")
	public String checkList(HttpSession session,
								@RequestParam int lectureApplyNum,
								Model model) throws Exception {
		
		
		return "dashBoard/checkList";
	}
	
	@RequestMapping(value = "checkWrite")
	@ResponseBody
	public Map<String, Object> checkWrite(HttpSession session,
								@RequestParam int lectureApplyNum,
								@RequestParam int lectureNum
								) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("lectureApplyNum", lectureApplyNum);
		map.put("lectureNum", lectureNum);
		
		List<Attendance> list = service.attendanceWeek(map);
		for(Attendance dto : list) {
			dto.setLectureApplyNum(lectureApplyNum);
			Attendance at = service.findAttendance(dto);
			if(at == null) {
				System.out.println(lectureApplyNum + "??? " + dto.getWeek() + "?????? ?????? ?????? ??????------??????");
				service.insertAttendance(dto);
			}
		}
		
		List<Attendance> atList = service.attendanceList(map);
		
		Map<String, Object> model = new HashMap<>();
		
		model.put("list", atList);
		
		return model;
	}
	
	
	@RequestMapping(value = "videoList")
	public String videoList(@RequestParam int lectureNum,
			HttpSession session,
			@RequestParam int lectureApplyNum,
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
		
		int listNum, n = 0;
		for(Video dto : videoList) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
			
			int time = (int)dto.getVideoTotalTime();
			        
	        int hour = time/(60*60);
	        int minute = time/60-(hour*60);
	        int second = time%60;
	        
	        String timeStr = hour + "?????? " + minute + "??? " + second + "???";
	        dto.setTimeStr(timeStr);
		}
		

		// AJAX ??? ?????????
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// ???????????? jsp??? ?????? ?????????
		model.addAttribute("videoList", videoList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("lectureNum", lectureNum);
		model.addAttribute("lectureApplyNum",lectureApplyNum);

		return "dashBoard/videoList";
	}
	
	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String videoArticle(@RequestParam int videoFileNum, @RequestParam int lectureApplyNum, Model model) {
		Video dto = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("videoFileNum", videoFileNum);
			dto = service.videoArticle(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("lectureApplyNum",lectureApplyNum);
			model.addAttribute("videoFileNum", videoFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return ".dashBoard.videoArticle";
	}
	
	
	@RequestMapping(value = "projectList")
	public String projectList(@RequestParam int lectureNum,
			@RequestParam int lectureApplyNum,
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

		dataCount = service.projectCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		map.put("lectureApplyNum", lectureApplyNum);
		
		List<Project> projectList = service.projectList(map);
		
		int listNum, n = 0;
		for(Project dto : projectList) {
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}

		// AJAX ??? ?????????
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// ???????????? jsp??? ?????? ?????????
		model.addAttribute("projectList", projectList);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("lectureNum", lectureNum);
		model.addAttribute("lectureApplyNum", lectureApplyNum);
		
		return "dashBoard/project";
	}
	
	@RequestMapping(value = "projectDetail", method = RequestMethod.GET)
	public String projectDetail(@RequestParam int projectNum, 
								@RequestParam int lectureNum,
								@RequestParam int lectureApplyNum,
								HttpSession session, Model model) {
		
		ProjectSubmit dto = null;
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectNum", projectNum);
			map.put("userId", userId);
			map.put("lectureNum", lectureNum);
			map.put("lectureApplyNum", lectureApplyNum);
			dto = service.projectDetail(map);
			
			
			ProjectStatus pst = service.submitStatus(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("pst", pst);
			model.addAttribute("lectureApplyNum", lectureApplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".dashBoard.projectDetail";
	}
	
	@RequestMapping(value = "download")
	public void download(@RequestParam int projectNum,
						HttpServletRequest req,
						HttpServletResponse resp,
						HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "project";
		
		ProjectSubmit dto = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("projectNum", projectNum);
		dto = service.projectDetail(map);
		
		if(dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFileName(),
					dto.getOriginalFileName(), pathname, resp);
			
			if(b) {
				return;
			}
		}
		
		// ??????????????? ????????? ??????
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('?????? ??????????????? ??????????????????.'); history.back();</script>");
	}
	
	@RequestMapping(value = "projectSubmit", method = RequestMethod.GET)
	public String projectSubmitForm(@RequestParam int projectNum, 
									@RequestParam int lectureNum,
									@RequestParam int lectureApplyNum,
									HttpSession session, Model model) {
		ProjectSubmit dto = null;
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("projectNum", projectNum);
			map.put("lectureNum", lectureNum);
			map.put("lectureApplyNum", lectureApplyNum);
			dto = service.projectDetail(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("projectNum", projectNum);
			model.addAttribute("lectureNum", lectureNum);
			model.addAttribute("lectureApplyNum", lectureApplyNum);
			model.addAttribute("mode", "submit");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".dashBoard.projectSubmitForm";
	}
	
	@RequestMapping(value = "projectSubmit", method = RequestMethod.POST)
	public String projectSubmit(ProjectSubmit dto, HttpSession session) {
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "projectSubmit";
	       
			service.submitProject(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String query = "projectNum="+dto.getProjectNum()+"&lectureNum="+dto.getLectureNum()+
							"&lectureApplyNum="+dto.getLectureApplyNum();
		return "redirect:/dashBoard/projectDetail?"+ query;
	}
	
	
	@RequestMapping(value = "projectUpdate", method = RequestMethod.GET)
	public String projectUpdateForm(@RequestParam int projectNum, 
									@RequestParam int lectureNum,
									@RequestParam int lectureApplyNum,
									HttpSession session, Model model) {
		ProjectSubmit dto = null;
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("projectNum", projectNum);
			map.put("lectureNum", lectureNum);
			map.put("lectureApplyNum", lectureApplyNum);
			dto = service.projectDetail(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("projectNum", projectNum);
			model.addAttribute("lectureNum", lectureNum);
			model.addAttribute("lectureApplyNum", lectureApplyNum);
			model.addAttribute("mode", "update");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".dashBoard.projectSubmitForm";
	}
	
	
	@RequestMapping(value = "projectUpdate", method = RequestMethod.POST)
	public String projectUpdate(ProjectSubmit dto, HttpSession session) {
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "projectSubmit";
	       
			service.updateProject(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		String query = "projectNum="+dto.getProjectNum()+"&lectureNum="+dto.getLectureNum()+
							"&lectureApplyNum="+dto.getLectureApplyNum();
		return "redirect:/dashBoard/projectDetail?"+ query;
	}
}
