package com.sp.lms.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.lms.common.dao.CommonDAO;

@Service("service.reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Review> reviewList(Map<String, Object> map) {
		List<Review> list = null;
		try {
			int count = 0;
			list = dao.selectList("rev.reviewList", map);
			for(Review re : list) {
				Map<String, Object> map2 = new HashMap<String, Object>();
				map2.put("lectureNum", re.getLectureNum());
				
				count = reviewDetailCount(map2);
				re.setReviewCount(count);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount() {
		int result = 0;
		try {
			result = dao.selectOne("rev.dataCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Review> reviewDetail(Map<String, Object> map) {
		List<Review> list = null;
		try {
			list = dao.selectList("rev.detailReview", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int reviewDetailCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("rev.reviewDetailCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Review lectureInfo(Map<String, Object> map) {
		Review dto = null;
		List<Review> list = null;
		try {
			dto = dao.selectOne("rev.lectureInfo", map);
			list = dao.selectList("rev.check", map);
			for(Review re : list) {
				if((int)map.get("lectureNum") == re.getLectureNum()) {
					dto.setCheck(1);
					dto.setLectureApplyNum(re.getLectureApplyNum());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertReview(Review dto) throws Exception {
		try {
			dao.insertData("rev.insertReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Review myReview(Map<String, Object> map) {
		Review dto = null;
		try {
			dto = dao.selectOne("rev.myReview", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateReview(Review dto) throws Exception {
		try {
			dao.updateData("rev.updateReview", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteReview(int lectureReviewNum) throws Exception {
		try {
			dao.deleteData("rev.deleteReview", lectureReviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Level reviewAvg(Map<String, Object> map) {
		int pct = 0;
		Level dto = new Level();
		try {

			List<Level> test = dao.selectList("rev.testLevel", map);
			List<Level> project = dao.selectList("rev.projectLevel", map);
			int count = reviewDetailCount(map);
			
			for(Level le : test) {
				pct = (int)(((double)le.getTestSum() / count) * 100);
				if(le.getTestLevel().equals("상")) {
					dto.settTop(pct);
				} else if(le.getTestLevel().equals("중")) {
					dto.settMid(pct);
				} else {
					dto.settBot(pct);
				}
			}
			
			for(Level le : project) {
				pct = (int)(((double)le.getProjectSum() / count) * 100);
				if(le.getProjectLevel().equals("상")) {
					dto.setpTop(pct);
				} else if(le.getProjectLevel().equals("중")) {
					dto.setpMid(pct);
				} else {
					dto.setpBot(pct);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
