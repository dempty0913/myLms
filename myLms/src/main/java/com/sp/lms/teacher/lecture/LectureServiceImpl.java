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

	@Override
	public Video videoArticle(Map<String, Object> map) {
		Video dto = null;
		try {
			dto = dao.selectOne("tLecture.videoArticle", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateVideo(Video dto, String pathname) throws Exception {
		try {
			String videoFileName = fileManager.doFileUpload(dto.getVideoSelectFile(), pathname);
			
			if (videoFileName != null) {
				if(dto.getVideoFileName() != null && dto.getVideoFileName().length() != 0) {
					fileManager.doFileDelete(dto.getVideoFileName(), pathname);
				}
				
				dto.setVideoFileName(videoFileName);
			}
			
			dao.insertData("tLecture.updateVideo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Project projectDetail(Map<String, Object> map) {
		Project dto = null;
		try {
			dto = dao.selectOne("tLecture.projectDetail", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateProject(Project dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if(dto.getSaveFileName() != null && dto.getSaveFileName().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
				
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("tLecture.updateProject", dto);
			if (saveFilename != null) {
				dao.updateData("tLecture.updateProjectFile", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteProject(int projectNum) throws Exception {
		try {
			dao.deleteData("tLecture.deleteProjectFile", projectNum);
			dao.deleteData("tLecture.deleteProject", projectNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int submitCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("tLecture.submitCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteVideo(int videoFileNum) throws Exception {
		try {
			dao.deleteData("tLecture.deleteVideoSave", videoFileNum);
			dao.deleteData("tLecture.deleteVideo", videoFileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int applyCount(int lectureNum) {
		int result = 0;
		try {
			result = dao.selectOne("tLecture.applyCount", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Submit> applyList(int projectNum) {
		List<Submit> list = null;
		try {
			list = dao.selectList("tLecture.applyList", projectNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Submit submitDetail(int submitNum) {
		Submit dto = null;
		try {
			dto = dao.selectOne("tLecture.submitDetail", submitNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
