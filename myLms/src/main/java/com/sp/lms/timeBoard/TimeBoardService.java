package com.sp.lms.timeBoard;

import java.util.List;
import java.util.Map;

public interface TimeBoardService {
	public List<TimeBoard> timeBoardList(Map<String, Object> map);
	public int timeBoardCount(Map<String, Object> map);
}
