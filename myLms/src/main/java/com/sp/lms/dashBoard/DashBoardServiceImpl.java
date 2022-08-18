package com.sp.lms.dashBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("dashBoard.dashBoardService")
public class DashBoardServiceImpl implements DashBoardService {
	
	@Autowired
	private CommonDAO dao;

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
		try {
			list = dao.selectList("dash.videoList", map);
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

}
