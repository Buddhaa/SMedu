package com.cyber.smedu.user.domain;

public class StudentDomain {
	private String studentCode;
	private String userCode;
	private String cardinalCode;
	private String studentPath;
	private String studentGoal;
	
	public String getStudentCode() {
		return studentCode;
	}
	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getCardinalCode() {
		return cardinalCode;
	}
	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}
	public String getStudentPath() {
		return studentPath;
	}
	public void setStudentPath(String studentPath) {
		this.studentPath = studentPath;
	}
	public String getStudentGoal() {
		return studentGoal;
	}
	public void setStudentGoal(String studentGoal) {
		this.studentGoal = studentGoal;
	}
	
	@Override
	public String toString() {
		return "StudentDomain [studentCode=" + studentCode + ", userCode=" + userCode + ", cardinalCode=" + cardinalCode
				+ ", studentPath=" + studentPath + ", studentGoal=" + studentGoal + "]";
	}
}
