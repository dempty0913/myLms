package com.sp.lms.timeBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("timeBoard.timeBoardController")
@RequestMapping("/timeBoard/*")
public class TimeBoardController {
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String timeBoard(Model model) {

		return ".timeBoard.timeBoard";
	}
}
