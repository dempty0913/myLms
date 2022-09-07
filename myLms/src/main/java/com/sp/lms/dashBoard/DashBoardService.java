package com.sp.lms.dashBoard;

import java.util.List;
import java.util.Map;

import com.sp.lms.teacher.lecture.Project;

public interface DashBoardService {
	public List<DashBoard> dashBoardList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void deleteDash(int lectureApplyNum) throws Exception;
	
	public DashBoard detailDash(int lectureNum);
	public int videoCount(Map<String, Object> map);
	public List<Video> videoList(Map<String, Object> map);
	public Video videoArticle(Map<String, Object> map);
	public void saveTime(Map<String, Object> map);
	
	public int projectCount(Map<String, Object> map);
	public List<Project> projectList(Map<String, Object> map);
	public ProjectSubmit projectDetail(Map<String, Object> map);
	public void submitProject(ProjectSubmit dto, String pathname) throws Exception;
	
	public ProjectStatus submitStatus(Map<String, Object> map);
	public void updateProject(ProjectSubmit dto, String pathname) throws Exception;
}
