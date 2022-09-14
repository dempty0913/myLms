package com.sp.lms.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	public List<Review> reviewList(Map<String, Object> map);
	public int dataCount();
	
	public List<Review> reviewDetail(Map<String, Object> map);
	public int reviewDetailCount(Map<String, Object> map);
	public Review lectureInfo(Map<String, Object> map);
	
	public void insertReview(Review dto) throws Exception;
	public Review myReview(Map<String, Object> map);
	public void updateReview(Review dto) throws Exception;
	public void deleteReview(int lectureReviewNum) throws Exception;
	
	public Level reviewAvg(Map<String, Object> map);
}
