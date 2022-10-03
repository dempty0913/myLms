package com.sp.lms.mySchedule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("service.myScheduleService")
public class MyScheduleServiceImpl implements MyScheduleService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Schedule> scheduleList(Map<String, Object> map) {
		List<Schedule> list = null;
		List<Schedule> list2 = null;
		List<Schedule> join = new ArrayList<Schedule>(); 
		try {
			list = dao.selectList("cal.scheduleList", map);
			join.addAll(list);
			
			list2 = dao.selectList("cal.projectList", map);
			join.addAll(list2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return join;
	}
	
}
