package com.sp.lms.teacher.lecture;

import java.util.List;
import java.util.Map;


public interface LectureService {
	public void insertLecture(Lecture dto) throws Exception;
	public List<Lecture> lectureList(Map<String, Object> map);
	public List<Lecture> lectureNameList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Lecture lectureDetail(int lectureNum);
	public void updateLecture(Lecture dto) throws Exception;
	public void deleteLecture(int lectureNum) throws Exception;
	public int applyCount(int lectureNum);
	
	public void insertVideo(Video dto, String pathname) throws Exception;
	public List<Video> videoList(Map<String, Object> map);
	public Video videoArticle(Map<String, Object> map);
	public void updateVideo(Video dto, String pathname) throws Exception;
	public void deleteVideo(int videoFileNum) throws Exception;
	
	public void insertProject(Project dto, String pathname) throws Exception;
	public List<Project> projectList(Map<String, Object> map);
	public Project projectDetail(Map<String, Object> map);
	public void updateProject(Project dto, String pathname) throws Exception;
	public void deleteProject(int projectNum) throws Exception;
	public int submitCount(Map<String, Object> map);
	public List<Submit> applyList(int projectNum);
	public Submit submitDetail(int submitNum);
}
