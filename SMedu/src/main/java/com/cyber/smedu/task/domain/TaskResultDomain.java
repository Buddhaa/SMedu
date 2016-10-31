package com.cyber.smedu.task.domain;

import java.sql.Date;

public class TaskResultDomain {

	private String taskResultCode;
	private String taskCode;
	private String studentCode;
	private String taskResultTitle;
	private String taskResultContent;
	private Date taskResultDate;
	private String taskFileName;
	private String taskFileExt;
	private int taskFileSize;
	private String taskFileType;
	private String taskOriginFileName;
	
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
	public int getTaskFileSize() {
		return taskFileSize;
	}
	public void setTaskFileSize(int taskFileSize) {
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
				+ ", taskResultDate=" + taskResultDate + ", taskFileName=" + taskFileName + ", taskFileExt="
				+ taskFileExt + ", taskFileSize=" + taskFileSize + ", taskFileType=" + taskFileType
				+ ", taskOriginFileName=" + taskOriginFileName + "]";
	}
	
}
