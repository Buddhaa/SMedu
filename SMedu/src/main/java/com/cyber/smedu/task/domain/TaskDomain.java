package com.cyber.smedu.task.domain;

import java.sql.Date;

public class TaskDomain {
	
	private String taskCode;
	private String professorCode;
	private String openSubjectCode;
	private String academicCalendarCode;
	private String taskSubject;
	private String taskContent;
	private Date taskRegisterDate;
	
	public Date getTaskRegisterDate() {
		return taskRegisterDate;
	}
	public void setTaskRegisterDate(Date taskRegisterDate) {
		this.taskRegisterDate = taskRegisterDate;
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
	public String getOpenSubjectCode() {
		return openSubjectCode;
	}
	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}
	public String getAcademicCalendarCode() {
		return academicCalendarCode;
	}
	public void setAcademicCalendarCode(String academicCalendarCode) {
		this.academicCalendarCode = academicCalendarCode;
	}
	public String getTaskSubject() {
		return taskSubject;
	}
	public void setTaskSubject(String taskSubject) {
		this.taskSubject = taskSubject;
	}
	public String getTaskContent() {
		return taskContent;
	}
	public void setTaskContent(String taskContent) {
		this.taskContent = taskContent;
	}
	
	@Override
	public String toString() {
		return "TaskDomain [taskCode=" + taskCode + ", professorCode=" + professorCode + ", openSubjectCode="
				+ openSubjectCode + ", academicCalendarCode=" + academicCalendarCode + ", taskSubject=" + taskSubject
				+ ", taskContent=" + taskContent + ", taskRegisterCode=" + taskRegisterDate + "]";
	}

}
