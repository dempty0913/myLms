package com.sp.lms.teacher.lecture;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.FileManager;
import com.sp.lms.common.dao.CommonDAO;

@Service("teacher.lecture.lectureService")
public class LectureServiceImpl implements LectureService {

	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
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

	@Override
	public Lecture lectureDetail(int lectureNum) {
		Lecture dto = null;
		try {
			dto = dao.selectOne("tLecture.lectureDetail", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateLecture(Lecture dto) throws Exception {
		try {
			dao.updateData("tLecture.updateLecture", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteLecture(int lectureNum) throws Exception {
		try {
			dao.deleteData("tLecture.deleteLecture", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Lecture> lectureNameList(Map<String, Object> map) {
		List<Lecture> list = null;
		try {
			list = dao.selectList("tLecture.lectureNameList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertVideo(Video dto, String pathname) throws Exception {
		try {
			String videoFileName = fileManager.doFileUpload(dto.getVideoSelectFile(), pathname);
			dto.setVideoFileName(videoFileName);
			
			dao.insertData("tLecture.insertVideo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Video> videoList(Map<String, Object> map) {
		List<Video> dto = null;
		try {
			dto = dao.selectList("tLecture.videoList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertProject(Project dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.insertData("tLecture.insertProject", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Project> projectList(Map<String, Object> map) {
		List<Project> list = null;
		try {
			list = dao.selectList("tLecture.projectList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
}
