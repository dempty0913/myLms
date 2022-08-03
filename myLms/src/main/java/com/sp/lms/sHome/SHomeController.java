package com.sp.lms.sHome;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("home.sHomeController")
@RequestMapping("/home/*")
public class SHomeController {
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model) {

		return ".main.home";
	}
	
}
