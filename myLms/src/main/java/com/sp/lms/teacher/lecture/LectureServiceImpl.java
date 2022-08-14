package com.sp.lms.teacher.lecture;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("teacher.lecture.lectureService")
public class LectureServiceImpl implements LectureService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertLecture(Lecture dto) throws Exception {
		try {
			dao.insertData("tLecture.insertLecture", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Lecture> lectureList(Map<String, Object> map) {
		List<Lecture> list = null;
		try {
			list = dao.selectList("tLecture.lectureList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int count = 0;
		try {
			count = dao.selectOne("tLecture.lectureCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
}
