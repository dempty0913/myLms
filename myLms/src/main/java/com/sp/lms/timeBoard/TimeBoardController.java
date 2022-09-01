package com.sp.lms.timeBoard;

import java.util.Calendar;
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

@Controller("timeBoard.timeBoardController")
@RequestMapping("/timeBoard/*")
public class TimeBoardController {
	
	@Autowired
	private TimeBoardService service;
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String timeBoard(Model model, HttpSession session) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		
		List<TimeBoard> list = service.timeBoardList(map);
		
		Calendar now = Calendar.getInstance();
		String year = Integer.toString(now.get(Calendar.YEAR));
		int m = now.get(Calendar.MONTH) +1;
		if(m == 12) {
			m = 1;
		}
		String month = Integer.toString(m);
		String semester;
		if(m >= 8) {
			semester = "2";
		} else {
			semester = "1";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("semester", semester);

		return ".timeBoard.timeBoard";
	}
}
