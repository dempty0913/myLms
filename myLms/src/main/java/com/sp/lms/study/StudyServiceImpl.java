package com.sp.lms.study;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("study.studyService")
public class StudyServiceImpl implements StudyService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Study> studyList(Map<String, Object> map) {
		List<Study> list = null;
		try {
			list = dao.selectList("std.studyList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int studyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("std.studyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertStudy(Study dto) throws Exception {
		try {
			dao.insertData("std.insertStudy", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Study studyDetail(int studyNum) {
		Study dto = null;
		try {
			dto = dao.selectOne("std.studyDetail", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Study> myStudyList(Map<String, Object> map) {
		List<Study> list = null;
		try {
			list = dao.selectList("std.myStudyList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int myStudyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("std.myStudyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateStudy(Study dto) throws Exception {
		try {
			dao.insertData("std.updateStudy", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteStudy(int studyNum) throws Exception {
		try {
			dao.deleteData("std.deleteStudy", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> replyList(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("std.replyList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("std.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("std.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReply(Map<String, Object> paramMap) throws Exception {
		try {
			dao.deleteData("std.deleteReply", paramMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Reply> listReplyAnswer(int parent) {
		List<Reply> list = null;
		try {
			list = dao.selectList("std.listReplyAnswer", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int parent) {
		int result = 0;
		try {
			result = dao.selectOne("std.replyAnswerCount", parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Reply writerId(int studyNum) {
		Reply dto = null;
		try {
			dto = dao.selectOne("std.writerId", studyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}	

}
