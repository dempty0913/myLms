package com.sp.lms.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.FileManager;
import com.sp.lms.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

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

	@Override
	public void joinMember(Member dto) throws Exception {
		try {
			dao.insertData("member.joinMember", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto, String path) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), path);
			
			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getProfileImage().length() != 0) {
					fileManager.doFileDelete(dto.getProfileImage(), path);
				}

				dto.setProfileImage(saveFilename);
			}
			
			dao.updateData("member.updateMember", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Member memberInfo(String userId) {
		Member dto = null;
		try {
			dto = dao.selectOne("member.memberInfo", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
