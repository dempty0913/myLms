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
	
	public void insertVideo(Video dto, String pathname) throws Exception;
}
