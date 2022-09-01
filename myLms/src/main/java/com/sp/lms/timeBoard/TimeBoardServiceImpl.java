package com.sp.lms.timeBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("timeBoard.timeBoardService")
public class TimeBoardServiceImpl implements TimeBoardService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<TimeBoard> timeBoardList(Map<String, Object> map) {
		List<TimeBoard> list = null;
		try {
			list = dao.selectList("time.timeBoardList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int timeBoardCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("time.timeBoardCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
