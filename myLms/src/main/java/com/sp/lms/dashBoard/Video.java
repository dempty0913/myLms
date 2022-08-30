package com.sp.lms.dashBoard;

public class Video {
	private int lectureNum;
	
	private int videoFileNum;
	private String videoName;
	private String regDate;
	private double videoTotalTime;
	private String videoFileName;
	
	private int listNum;
	
	private double saveTime;
	private int status;
	
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public int getVideoFileNum() {
		return videoFileNum;
	}
	public void setVideoFileNum(int videoFileNum) {
		this.videoFileNum = videoFileNum;
	}
	public String getVideoName() {
		return videoName;
	}
	public void setVideoName(String videoName) {
		this.videoName = videoName;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public double getVideoTotalTime() {
		return videoTotalTime;
	}
	public void setVideoTotalTime(double videoTotalTime) {
		this.videoTotalTime = videoTotalTime;
	}
	public String getVideoFileName() {
		return videoFileName;
	}
	public void setVideoFileName(String videoFileName) {
		this.videoFileName = videoFileName;
	}
	public double getSaveTime() {
		return saveTime;
	}
	public void setSaveTime(double saveTime) {
		this.saveTime = saveTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	
}
