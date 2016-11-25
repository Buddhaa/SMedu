package com.cyber.smedu.task.domain;

import java.sql.Date;

public class TaskScoreDomain {

	private String taskScoreCode;
	private String taskResultCode;
	private String taskCode;
	private String professorCode;
	private int taskScore;
	private Date taskScoreDate;
	
	private String studentCode;
	private String openSubjectCode;
	
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getTaskScoreCode() {
		return taskScoreCode;
	}
	public void setTaskScoreCode(String taskScoreCode) {
		this.taskScoreCode = taskScoreCode;
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
	public String getProfessorCode() {
		return professorCode;
	}
	public void setProfessorCode(String professorCode) {
		this.professorCode = professorCode;
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
	
	@Override
	public String toString() {
		return "TaskScoreDomain [taskScoreCode=" + taskScoreCode + ", taskResultCode=" + taskResultCode + ", taskCode="
				+ taskCode + ", professorCode=" + professorCode + ", taskScore=" + taskScore + ", taskScoreDate="
				+ taskScoreDate + ", studentCode=" + studentCode + ", openSubjectCode=" + openSubjectCode + "]";
	}
}
