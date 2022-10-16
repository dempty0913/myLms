package com.sp.lms.dashBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.FileManager;
import com.sp.lms.common.dao.CommonDAO;
import com.sp.lms.teacher.lecture.Project;

@Service("dashBoard.dashBoardService")
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<DashBoard> dashBoardList(Map<String, Object> map) {
		List<DashBoard> list = null;
		try {
			list = dao.selectList("dash.dashBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("dash.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteDash(int lectureApplyNum) throws Exception {
		try {
			dao.deleteData("dash.deleteDash", lectureApplyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public DashBoard detailDash(int lectureNum) {
		DashBoard dto = null;
		try {
			dto = dao.selectOne("dash.detailList", lectureNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int videoCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("dash.videoCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Video> videoList(Map<String, Object> map) {
		List<Video> list = null;
		List<Video> sList = null;
		try {
			list = dao.selectList("dash.videoList", map);
			sList = dao.selectList("dash.videoTime", map);
			for (int i = 0; i < list.size(); i++){
				for (int j = 0; j < list.size(); j++){
					if(list.get(i).getVideoFileNum() == sList.get(j).getVideoFileNum()) {
						System.out.println(list.get(i).getVideoFileNum()+"----------");
						System.out.println(sList.get(i).getVideoFileNum()+"----------");
						int time = (int) sList.get(j).getSaveTime();
						list.get(i).setSaveTime(time);
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Video videoArticle(Map<String, Object> map) {
		Video dto = null;
		try {
			dto = dao.selectOne("dash.videoArticle", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int projectCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("dash.projectCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Project> projectList(Map<String, Object> map) {
		List<Project> list = null;
		List<ProjectStatus> sList = null;
		try {
			list = dao.selectList("dash.projectList", map);
			sList = dao.selectList("dash.submitStatus", map);
			for (int i = 0; i < list.size(); i++){
				String ofile = sList.get(i).getOriginalFileName();
				list.get(i).setOriginalFileName2(ofile);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ProjectSubmit projectDetail(Map<String, Object> map) {
		ProjectSubmit dto = null;
		ProjectStatus sDto = null;
		try {
			dto = dao.selectOne("dash.projectDetail", map);
			sDto = dao.selectOne("dash.submitStatus", map);
			dto.setSubmitNum(sDto.getSubmitNum());
			dto.setLectureApplyNum(sDto.getLectureApplyNum());
			dto.setOriginalFileName2(sDto.getOriginalFileName());
			dto.setSubmitDate(sDto.getSubmitDate());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void submitProject(ProjectSubmit dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.insertData("dash.submitProject", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public ProjectStatus submitStatus(Map<String, Object> map) {
		ProjectStatus dto = null;
		try {
			dto = dao.selectOne("dash.submitStatus", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateProject(ProjectSubmit dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				if(dto.getSaveFileName() != null && dto.getSaveFileName().length() != 0) {
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
				
				dto.setSaveFileName(saveFilename);
				dto.setOriginalFileName(dto.getSelectFile().getOriginalFilename());
			}
			
			dao.updateData("dash.updateProject", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void saveTime(Map<String, Object> map) {
		int time, totalTime, saveTime;
		try {
			time = dao.selectOne("dash.getSaveTime", map);
			totalTime = dao.selectOne("dash.getTotalTime", map);
			saveTime = (int)Double.parseDouble(String.valueOf(map.get("saveTime")));
			if(time != 0 && time < saveTime) {
				dao.updateData("dash.updateSaveTime", map);
				if(saveTime == totalTime) {
					dao.updateData("dash.updateVideoStatus", map);
				}
			} else if(time == 0 && saveTime == totalTime) {
				dao.insertData("dash.saveTime", map);
				dao.updateData("dash.updateVideoStatus", map);
			} else if(time == 0) {
				dao.insertData("dash.saveTime", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Attendance> attendanceWeek(Map<String, Object> map) {
		List<Attendance> list = null;
		try {
			list = dao.selectList("dash.attendanceWeek", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertAttendance(Attendance dto) throws Exception {
		try {
			dao.insertData("dash.insertAttendance", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Attendance findAttendance(Attendance dto) {
		Attendance at = null;
		try {
			at = dao.selectOne("dash.findAttendance", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return at;
	}

	@Override
	public List<Attendance> attendanceList(Map<String, Object> map) {
		List<Attendance> list = null;
		try {
			list = dao.selectList("dash.attendanceList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
