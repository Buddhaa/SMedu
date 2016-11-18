package com.cyber.smedu.debate.domain;

import java.sql.Timestamp;

public class DebateResultDomain {

	private String debateResultCode;
	private String debateCode;
	private String studentCode;
	private String userName;
	private String debateComment;
	private Timestamp debateRegisterDate;
	
	private String userCode;
	
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getDebateResultCode() {
		return debateResultCode;
	}
	public void setDebateResultCode(String debateResultCode) {
		this.debateResultCode = debateResultCode;
	}
	public String getDebateCode() {
		return debateCode;
	}
	public void setDebateCode(String debateCode) {
		this.debateCode = debateCode;
	}
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDebateComment() {
		return debateComment;
	}
	public void setDebateComment(String debateComment) {
		this.debateComment = debateComment;
	}
	public Timestamp getDebateRegisterDate() {
		return debateRegisterDate;
	}
	public void setDebateRegisterDate(Timestamp debateRegisterDate) {
		this.debateRegisterDate = debateRegisterDate;
	}
	@Override
	public String toString() {
		return "DebateResultDomain [debateResultCode=" + debateResultCode + ", debateCode=" + debateCode
				+ ", studentCode=" + studentCode + ", debateComment=" + debateComment + ", debateRegisterDate="
				+ debateRegisterDate + "]";
	}
	
}
