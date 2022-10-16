package com.sp.lms.teacher.lecture;

import org.springframework.web.multipart.MultipartFile;

public class Video {
	private int videoFileNum;
	private int lectureNum;
	private double videoTotalTime;
	private String videoName;
	private String videoFileName;
	private String regDate;
	
	private String lectureName;
	
	private MultipartFile videoSelectFile;
	
	private int week;
	private String finDate;
	
	public int getVideoFileNum() {
		return videoFileNum;
	}
	public void setVideoFileNum(int videoFileNum) {
		this.videoFileNum = videoFileNum;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public double getVideoTotalTime() {
		return videoTotalTime;
	}
	public void setVideoTotalTime(double videoTotalTime) {
		this.videoTotalTime = videoTotalTime;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public MultipartFile getVideoSelectFile() {
		return videoSelectFile;
	}
	public void setVideoSelectFile(MultipartFile videoSelectFile) {
		this.videoSelectFile = videoSelectFile;
	}
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}
	public int getWeek() {
		return week;
	}
	public void setWeek(int week) {
		this.week = week;
	}
	public String getFinDate() {
		return finDate;
	}
	public void setFinDate(String finDate) {
		this.finDate = finDate;
	}
	
	
}
