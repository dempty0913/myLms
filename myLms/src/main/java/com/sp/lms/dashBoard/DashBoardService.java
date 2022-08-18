package com.sp.lms.dashBoard;

import java.util.List;
import java.util.Map;

public interface DashBoardService {
	public List<DashBoard> dashBoardList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void deleteDash(int lectureApplyNum) throws Exception;
	
	public DashBoard detailDash(int lectureNum);
	public int videoCount(Map<String, Object> map);
	public List<Video> videoList(Map<String, Object> map);
	public Video videoArticle(Map<String, Object> map);
}
