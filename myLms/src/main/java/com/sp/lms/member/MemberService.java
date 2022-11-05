package com.sp.lms.member;

public interface MemberService {
	public Member loginMember(String userId, int status);
	public void joinMember(Member dto) throws Exception;
	public void updateMember(Member dto, String path) throws Exception;
	public Member memberInfo(String userId);
}
