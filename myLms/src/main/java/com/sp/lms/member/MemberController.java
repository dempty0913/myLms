package com.sp.lms.member;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
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
		info.setProfileImage(dto.getProfileImage());
		
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
	
	
	@RequestMapping(value = "join")
	public String join(HttpSession session) {


		return "/member/join";
	}	
	
	
	@RequestMapping(value = "joinSubmit")
	public String joinSubmit(Member dto, HttpSession session, Model model) {
		
		try {
			service.joinMember(dto);
		} catch (DuplicateKeyException e) {
			// 기본키 중복에 의한 제약 조건 위반
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
			return "/member/join";
		} catch (DataIntegrityViolationException e) {
			// 데이터형식 오류, 참조키, NOT NULL 등의 제약조건 위반
			model.addAttribute("message", "제약 조건 위반으로 회원가입이 실패했습니다.");
			return "/member/join";
		} catch (Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다.");
			return "/member/join";
		}

		return "redirect:/";
	}
	
	
	@RequestMapping(value = "updateInfo")
	public String updateInfo(@RequestParam String userId, HttpSession session, Model model) {

		Member dto = service.memberInfo(userId);
		model.addAttribute("dto", dto);

		return ".member.infoUpdate";
	}	
	
	@RequestMapping(value = "updateSubmit", method = RequestMethod.POST)
	public String updateSubmit(HttpSession session, Member dto) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		dto.setUserId(userId);
		
		System.out.println(dto.getProfileImage()+"--------");
		System.out.println(dto.getUserEmail()+"--------");
		System.out.println(dto.getUserPhone()+"--------");
		System.out.println(dto.getUserName()+"--------");
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + File.separator + "uploads" + File.separator + "profile";
		
		service.updateMember(dto, path);
		
		info.setUserName(dto.getUserName());
		info.setUserEmail(dto.getUserEmail());
		info.setProfileImage(dto.getProfileImage());
		
		
		return "redirect:/member/updateComplete";
	}
	
	@RequestMapping(value = "updateComplete")
	public String updateComplete(HttpSession session) {


		return ".member.updateComplete";
	}		
	
	
}
