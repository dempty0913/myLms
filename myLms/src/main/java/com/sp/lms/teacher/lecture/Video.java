package com.sp.lms.teacher.lecture;

import org.springframework.web.multipart.MultipartFile;

public class Video {
	private int videoFileNum;
	private int lectureNum;
	private double videoTotalTime;
	private String videoName;
	private String videoFileName;
	private String regDate;
	
	private MultipartFile videoSelectFile;
	
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
	
	
}