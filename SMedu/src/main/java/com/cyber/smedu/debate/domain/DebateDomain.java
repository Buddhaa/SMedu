package com.cyber.smedu.debate.domain;

import java.sql.Date;

public class DebateDomain {

	private String debateCode;
	private String professorCode;
	private String openSubjectCode;
	private String academicCalendarCode;
	private String debateSubject;
	private String debateContent;
	private Date debateRegisterDate;
	
	public String getDebateCode() {
		return debateCode;
	}
	public void setDebateCode(String debateCode) {
		this.debateCode = debateCode;
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
	public String getDebateSubject() {
		return debateSubject;
	}
	public void setDebateSubject(String debateSubject) {
		this.debateSubject = debateSubject;
	}
	public String getDebateContent() {
		return debateContent;
	}
	public void setDebateContent(String debateContent) {
		this.debateContent = debateContent;
	}
	public Date getDebateRegisterDate() {
		return debateRegisterDate;
	}
	public void setDebateRegisterDate(Date debateRegisterDate) {
		this.debateRegisterDate = debateRegisterDate;
	}
	@Override
	public String toString() {
		return "DebateDomain [debateCode=" + debateCode + ", professorCode=" + professorCode + ", openSubjectCode="
				+ openSubjectCode + ", academicCalendarCode=" + academicCalendarCode + ", debateSubject="
				+ debateSubject + ", debateContent=" + debateContent + ", debateRegisterDate=" + debateRegisterDate
				+ "]";
	}
	
}
