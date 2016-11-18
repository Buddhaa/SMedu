package com.cyber.smedu.objection.domain;

import java.sql.Timestamp;

public class ObjectionDomain {
	
	private String objectionCode;
	private String studentCode;
	private String professorCode;
	private String openSubjectCode;
	private String objectionType;
	private String objectionTitle;
	private String objectionContent;
	private Timestamp objectionDate;
	private String objectionReply;
	private Timestamp objectionReplyDate;
	
	private String subjectName;	
	private String userName;

	public String getObjectionCode() {
		return objectionCode;
	}

	public void setObjectionCode(String objectionCode) {
		this.objectionCode = objectionCode;
	}

	public String getStudentCode() {
		return studentCode;
	}

	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
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

	public String getObjectionType() {
		return objectionType;
	}

	public void setObjectionType(String objectionType) {
		this.objectionType = objectionType;
	}

	public String getObjectionTitle() {
		return objectionTitle;
	}

	public void setObjectionTitle(String objectionTitle) {
		this.objectionTitle = objectionTitle;
	}

	public String getObjectionContent() {
		return objectionContent;
	}

	public void setObjectionContent(String objectionContent) {
		this.objectionContent = objectionContent;
	}

	public Timestamp getObjectionDate() {
		return objectionDate;
	}

	public void setObjectionDate(Timestamp objectionDate) {
		this.objectionDate = objectionDate;
	}

	public String getObjectionReply() {
		return objectionReply;
	}

	public void setObjectionReply(String objectionReply) {
		this.objectionReply = objectionReply;
	}

	public Timestamp getObjectionReplyDate() {
		return objectionReplyDate;
	}

	public void setObjectionReplyDate(Timestamp objectionReplyDate) {
		this.objectionReplyDate = objectionReplyDate;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "ObjectionDomain [objectionCode=" + objectionCode + ", studentCode=" + studentCode + ", professorCode="
				+ professorCode + ", openSubjectCode=" + openSubjectCode + ", objectionType=" + objectionType
				+ ", objectionTitle=" + objectionTitle + ", objectionContent=" + objectionContent + ", objectionDate="
				+ objectionDate + ", objectionReply=" + objectionReply + ", objectionReplyDate=" + objectionReplyDate
				+ ", userName=" + userName + "]";
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	
}
