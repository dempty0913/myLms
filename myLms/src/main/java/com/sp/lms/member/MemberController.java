package com.sp.lms.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
@RequestMapping(value = "/member/*")
public class MemberController {
	
	@Autowired
	private MemberService service;

	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String loginSubmit(@RequestParam String userId,
							  @RequestParam String userPwd,
							  @RequestParam int status,
							  HttpSession session,
							  Model model) {
		
		Member dto = service.loginMember(userId, status);
		
		if (dto == null || !userPwd.equals(dto.getUserPwd())) {
			model.addAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "/login/logIn";
		}
		
		// 세션에 로그인 정보 저장
		SessionInfo info = new SessionInfo();
		info.setUserId(dto.getUserId());
		info.setUserName(dto.getUserName());
		info.setUserEmail(dto.getUserEmail());
		info.setStatus(dto.getStatus());
		
		session.setAttribute("member", info);
		
		if(dto.getStatus() == 0) {
			return "redirect:/home/home";
		} else {
			return "redirect:/teacher/home/home";
		}
	}
	
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {

		session.removeAttribute("member");
		session.invalidate();

		return "redirect:/";
	}
}
