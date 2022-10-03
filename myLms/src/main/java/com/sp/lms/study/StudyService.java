package com.sp.lms.study;

import java.util.List;
import java.util.Map;

public interface StudyService {
	public List<Study> studyList(Map<String, Object> map);
	public int studyCount(Map<String, Object> map);
	public void insertStudy(Study dto) throws Exception;
	public Study studyDetail(int studyNum);
	
	public List<Study> myStudyList(Map<String, Object> map);
	public int myStudyCount(Map<String, Object> map);
	
	public void updateStudy(Study dto) throws Exception;
	public void deleteStudy(int studyNum) throws Exception;
	
	public List<Reply> replyList(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void insertReply(Reply dto) throws Exception;
	public void deleteReply(Map<String, Object> paramMap) throws Exception;
	
	public List<Reply> listReplyAnswer(int parent);
	public int replyAnswerCount(int parent);
	
	public Reply writerId(int studyNum);
}
