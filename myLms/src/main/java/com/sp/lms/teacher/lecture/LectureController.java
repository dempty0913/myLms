package com.sp.lms.teacher.lecture;

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

@Controller("teacher.lecture.lectureController")
@RequestMapping("/teacher/lecture/*")
public class LectureController {
	
	@Autowired
	private LectureService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
	
	@RequestMapping(value = "applyCount", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> applyCount(@RequestParam int lectureNum) {
		
		int count = service.applyCount(lectureNum);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("count", count);
		
		return model;
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
			System.out.println(pathname + "---------------");
			service.insertVideo(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/videoList";
	}
	
	
	@RequestMapping(value = "vArticle", method = RequestMethod.GET)
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
	
		return ".teacher.lecture.videoArticle";
	}
	
	@RequestMapping(value = "videoUpdate", method = RequestMethod.GET)
	public String videoUpdateForm(HttpSession session, @RequestParam int videoFileNum, 
								@RequestParam int lectureNum, Model model) {
		Video dto = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			
			map.put("userId", userId);
			List<Lecture> list = service.lectureNameList(map);
			
			map.put("videoFileNum", videoFileNum);
			dto = service.videoArticle(map);
			
			model.addAttribute("mode", "update");
			model.addAttribute("list", list);
			model.addAttribute("videoFileNum", videoFileNum);
			model.addAttribute("dto", dto);
			model.addAttribute("lectureNum", lectureNum);
			
			System.out.println(dto.getVideoTotalTime());
			
		} catch (Exception e) {
			e.printStackTrace();

		}
		return ".teacher.lecture.videoAdd";
	}
	
	@RequestMapping(value = "videoUpdate", method = RequestMethod.POST)
	public String videoUpdate(HttpSession session, Video dto) {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "video";
			
			service.updateVideo(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/videoList";
	}
	
	@RequestMapping(value = "deleteVideo", method = RequestMethod.GET)
	public String deleteVideo(@RequestParam int videoFileNum) {
		
		try {
			service.deleteVideo(videoFileNum);
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
	
	@RequestMapping(value = "pArticle", method = RequestMethod.GET)
	public String projectArticle(@RequestParam int projectNum, Model model) {
		Project dto = null;
		int count = 0;
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("projectNum", projectNum);
			dto = service.projectDetail(map);
			count = service.submitCount(map);
			
			model.addAttribute("dto", dto);
			model.addAttribute("count", count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return ".teacher.lecture.projectDetail";
	}
	
	
	@RequestMapping(value = "download")
	public void download(@RequestParam int projectNum,
						HttpServletRequest req,
						HttpServletResponse resp,
						HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "project";
		
		Project dto = null;
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
		
		// 다운로드가 실패한 경우
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일 다운로드가 실패했습니다.'); history.back();</script>");
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
	
	
	@RequestMapping(value = "project/update", method = RequestMethod.GET)
	public String projectUpdateForm(HttpSession session, @RequestParam int projectNum,
								@RequestParam int lectureNum, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		map.put("userId", userId);
		List<Lecture> list = service.lectureNameList(map);
		
		Project dto = null;
		map.put("projectNum", projectNum);
		dto = service.projectDetail(map);
		
		model.addAttribute("mode", "update");
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("lectureNum", lectureNum);
		
		return ".teacher.lecture.projectAdd";
	}
	
	
	@RequestMapping(value = "project/update", method = RequestMethod.POST)
	public String projectUpdate(Project dto, HttpSession session) {
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "project";
	       
			service.updateProject(dto, pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/projectList";
	}
	
	
	@RequestMapping(value = "project/delete", method = RequestMethod.GET)
	public String deleteProject(@RequestParam int projectNum, @RequestParam int lectureNum) {
		
		try {
			service.deleteProject(projectNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/lecture/projectList";
	}
	
	
	@RequestMapping(value = "project/applyList", method = RequestMethod.GET)
	public String projectApply(@RequestParam int projectNum, Model model) {
		try {
			List<Submit> list = service.applyList(projectNum);
			
			model.addAttribute("list", list);
			model.addAttribute("projectNum", projectNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "teacher/lecture/projectApply";
	}
	
	@RequestMapping(value = "project/download")
	public void projectDownload(@RequestParam int submitNum,
						HttpServletRequest req,
						HttpServletResponse resp,
						HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "projectSubmit";
		
		Submit dto = null;
		dto = service.submitDetail(submitNum);
		
		if(dto != null) {
			boolean b = fileManager.doFileDownload(dto.getSaveFileName(),
					dto.getOriginalFileName(), pathname, resp);
			
			if(b) {
				return;
			}
		}
		
		// 다운로드가 실패한 경우
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print("<script>alert('파일 다운로드가 실패했습니다.'); history.back();</script>");
	}
	
	
	@RequestMapping(value = "project/zipDownload")
	public void zipdownload(@RequestParam int projectNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "projectSubmit";
		
		boolean b = false;
		
		List<Submit> listFile = service.applyList(projectNum);
		
		if (listFile.size() > 0) {
			String[] sources = new String[listFile.size()];
			String[] originals = new String[listFile.size()];
			String zipFilename = projectNum + ".zip";

			for (int idx = 0; idx < listFile.size(); idx++) {
				sources[idx] = pathname + File.separator + listFile.get(idx).getSaveFileName();
				originals[idx] = File.separator + listFile.get(idx).getOriginalFileName();
			}

			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}

		if (! b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
}
