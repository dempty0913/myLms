package com.sp.lms.sHome;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("sHome.sHomeService")
public class SHomeServiceImpl implements SHomeService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<SHome> sHomeList(Map<String, Object> map) {
		List<SHome> list = null;
		try {
			list = dao.selectList("sHome.sHomeList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount() {
		int count = 0;
		try {
			count = dao.selectOne("sHome.sHomeCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public void addLecture(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("sHome.addLecture", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
