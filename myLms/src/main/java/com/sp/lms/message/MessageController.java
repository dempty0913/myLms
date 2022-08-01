package com.sp.lms.message;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("message.messageController")
@RequestMapping("/myMessage/*")
public class MessageController {

	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String myMessage(Model model) {

		return ".myMessage.messageList";
	}
}
