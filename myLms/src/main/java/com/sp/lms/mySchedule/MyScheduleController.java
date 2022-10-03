package com.sp.lms.mySchedule;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.lms.member.SessionInfo;


@Controller("mySchedule.myScheduleController")
@RequestMapping("/mySchedule/*")
public class MyScheduleController {
	
	@Autowired
	private MyScheduleService service;

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String mySchedule(Model model, HttpSession session) {

		return ".mySchedule.mySchedule";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> myPlan(@RequestParam String sDate,
										@RequestParam String eDate, 
										HttpSession session) throws Exception {
		System.out.println(sDate);
		System.out.println(eDate);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("sDate", sDate);
		map.put("eDate", eDate);
		
		List<Schedule> list = service.scheduleList(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		
		return model;
		
	}
	
}
