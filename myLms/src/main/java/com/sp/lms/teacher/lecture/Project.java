package com.sp.lms.teacher.lecture;

import org.springframework.web.multipart.MultipartFile;

public class Project {
	private int projectNum;
	private int lectureNum;
	private String projectSubject;
	private String projectContent;
	private String regDate;
	private String eDate;
	
	private String lectureName;
	
	private int submitNum;
	private String originalFileName;
	private String saveFileName;
	private MultipartFile selectFile;
	
	private int lectureApplyNum;
	private String applyStatus;
	
	// 제출파일
	private String originalFileName2;
	
	private int listNum;
	
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
	public String getLectureName() {
		return lectureName;
	}
	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
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
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public int getLectureApplyNum() {
		return lectureApplyNum;
	}
	public void setLectureApplyNum(int lectureApplyNum) {
		this.lectureApplyNum = lectureApplyNum;
	}
	public String getApplyStatus() {
		return applyStatus;
	}
	public void setApplyStatus(String applyStatus) {
		this.applyStatus = applyStatus;
	}
	public String getOriginalFileName2() {
		return originalFileName2;
	}
	public void setOriginalFileName2(String originalFileName2) {
		this.originalFileName2 = originalFileName2;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
	
}
