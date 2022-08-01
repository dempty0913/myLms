package com.sp.lms.dashBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("dashBoard.dashBoardController")
@RequestMapping("/dashBoard/*")
public class DashBoardController {
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String dashBoard(Model model) {

		return ".dashBoard.dashBoard";
	}
}
