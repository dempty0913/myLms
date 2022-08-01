package com.sp.lms.mySchedule;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mySchedule.myScheduleController")
@RequestMapping("/mySchedule/*")
public class MyScheduleController {

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String mySchedule(Model model) {

		return ".mySchedule.mySchedule";
	}
}
