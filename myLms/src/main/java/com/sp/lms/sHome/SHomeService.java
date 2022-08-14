package com.sp.lms.sHome;

import java.util.List;
import java.util.Map;

public interface SHomeService {
	public List<SHome> sHomeList(Map<String, Object> map);
	public int dataCount();
}
