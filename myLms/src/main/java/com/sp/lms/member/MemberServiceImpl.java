package com.sp.lms.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public Member loginMember(String userId, int status) {
		Member dto = null;
		
		try {
			if(status == 0) {
				dto = dao.selectOne("member.login", userId);
			} else {
				dto = dao.selectOne("member.loginTeacher", userId);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
