package com.cyber.smedu.task.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class TaskResultDomain {

	private String taskResultCode;
	private String taskCode;
	private String studentCode;
	private String taskResultTitle;
	private String taskResultContent;
	private Date taskResultDate;
	private MultipartFile taskFile;
	private String taskFileName;
	private String taskFileExt;
	private long taskFileSize;
	private String taskFileType;
	private String taskOriginFileName;
	private String taskSubject;
	private String taskContent;
	private String taskRegisterDate;
	private int taskScore;
	private Date taskScoreDate;
	
	public String getTaskContent() {
		return taskContent;
	}
	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}
	public String getTaskRegisterDate() {
		return taskRegisterDate;
	}
	public void setTaskRegisterDate(String taskRegisterDate) {
		this.taskRegisterDate = taskRegisterDate;
	}
	public int getTaskScore() {
		return taskScore;
	}
	public void setTaskScore(int taskScore) {
		this.taskScore = taskScore;
	}
	public Date getTaskScoreDate() {
		return taskScoreDate;
	}
	public void setTaskScoreDate(Date taskScoreDate) {
		this.taskScoreDate = taskScoreDate;
	}
	public String getTaskSubject() {
		return taskSubject;
	}
	public void setTaskSubject(String taskSubject) {
		this.taskSubject = taskSubject;
	}
	public String getTaskResultCode() {
		return taskResultCode;
	}
	public void setTaskResultCode(String taskResultCode) {
		this.taskResultCode = taskResultCode;
	}
	public String getTaskCode() {
		return taskCode;
	}
	public void setTaskCode(String taskCode) {
		this.taskCode = taskCode;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getTaskResultTitle() {
		return taskResultTitle;
	}
	public void setTaskResultTitle(String taskResultTitle) {
		this.taskResultTitle = taskResultTitle;
	}
	public String getTaskResultContent() {
		return taskResultContent;
	}
	public void setTaskResultContent(String taskResultContent) {
		this.taskResultContent = taskResultContent;
	}
	public Date getTaskResultDate() {
		return taskResultDate;
	}
	public void setTaskResultDate(Date taskResultDate) {
		this.taskResultDate = taskResultDate;
	}
	public MultipartFile getTaskFile() {
		return taskFile;
	}
	public void setTaskFile(MultipartFile taskFile) {
		this.taskFile = taskFile;
	}
	public String getTaskFileName() {
		return taskFileName;
	}
	public void setTaskFileName(String taskFileName) {
		this.taskFileName = taskFileName;
	}
	public String getTaskFileExt() {
		return taskFileExt;
	}
	public void setTaskFileExt(String taskFileExt) {
		this.taskFileExt = taskFileExt;
	}
	public long getTaskFileSize() {
		return taskFileSize;
	}
	public void setTaskFileSize(long taskFileSize) {
		this.taskFileSize = taskFileSize;
	}
	public String getTaskFileType() {
		return taskFileType;
	}
	public void setTaskFileType(String taskFileType) {
		this.taskFileType = taskFileType;
	}
	public String getTaskOriginFileName() {
		return taskOriginFileName;
	}
	public void setTaskOriginFileName(String taskOriginFileName) {
		this.taskOriginFileName = taskOriginFileName;
	}
	
	@Override
	public String toString() {
		return "TaskResultDomain [taskResultCode=" + taskResultCode + ", taskCode=" + taskCode + ", studentCode="
				+ studentCode + ", taskResultTitle=" + taskResultTitle + ", taskResultContent=" + taskResultContent
				+ ", taskResultDate=" + taskResultDate + ", taskFile=" + taskFile + ", taskFileName=" + taskFileName
				+ ", taskFileExt=" + taskFileExt + ", taskFileSize=" + taskFileSize + ", taskFileType=" + taskFileType
				+ ", taskOriginFileName=" + taskOriginFileName + "]";
	}	
}
