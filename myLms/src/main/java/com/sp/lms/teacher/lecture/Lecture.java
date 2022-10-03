package com.sp.lms.teacher.lecture;

import java.util.List;

public class Lecture {
	private int lectureNum;
	private String userId;
	private String lectureName;
	private String lectureInfo;
	private String major;
	private String year;
	private String semester;
	private String day;
	private String time;
	private String regDate;
	private String midSDate;
	private String finSDate;
	
	private List<String> days;
	private List<String> times;
	
	private String sDate;
	
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public String getLectureInfo() {
		return lectureInfo;
	}
	public void setLectureInfo(String lectureInfo) {
		this.lectureInfo = lectureInfo;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getMidSDate() {
		return midSDate;
	}
	public void setMidSDate(String midSDate) {
		this.midSDate = midSDate;
	}
	public String getFinSDate() {
		return finSDate;
	}
	public void setFinSDate(String finSDate) {
		this.finSDate = finSDate;
	}
	public List<String> getDays() {
		return days;
	}
	public void setDays(List<String> days) {
		this.days = days;
	}
	public List<String> getTimes() {
		return times;
	}
	public void setTimes(List<String> times) {
		this.times = times;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	
	
}
