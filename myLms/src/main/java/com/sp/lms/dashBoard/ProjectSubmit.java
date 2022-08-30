package com.sp.lms.dashBoard;

import org.springframework.web.multipart.MultipartFile;

public class ProjectSubmit {
	private int projectNum;
	private int lectureNum;
	private int lectureApplyNum;
	private int submitNum;
	private String originalFileName;
	private String saveFileName;
	private String projectSubject;
	private String projectContent;
	private String regDate;
	private String eDate;
	private String submitDate;
	private String userID;
	
	// 내가 제출한 파일
	private String originalFileName2;
	private String saveFileName2;
	private MultipartFile selectFile;
	
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	public int getLectureNum() {
		return lectureNum;
	}
	public void setLectureNum(int lectureNum) {
		this.lectureNum = lectureNum;
	}
	public int getSubmitNum() {
		return submitNum;
	}
	public void setSubmitNum(int submitNum) {
		this.submitNum = submitNum;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getProjectSubject() {
		return projectSubject;
	}
	public void setProjectSubject(String projectSubject) {
		this.projectSubject = projectSubject;
	}
	public String getProjectContent() {
		return projectContent;
	}
	public void setProjectContent(String projectContent) {
		this.projectContent = projectContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getOriginalFileName2() {
		return originalFileName2;
	}
	public void setOriginalFileName2(String originalFileName2) {
		this.originalFileName2 = originalFileName2;
	}
	public String getSaveFileName2() {
		return saveFileName2;
	}
	public void setSaveFileName2(String saveFileName2) {
		this.saveFileName2 = saveFileName2;
	}
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}
	public int getLectureApplyNum() {
		return lectureApplyNum;
	}
	public void setLectureApplyNum(int lectureApplyNum) {
		this.lectureApplyNum = lectureApplyNum;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	
	
}
