package com.cyber.smedu.pay.domain;

import java.sql.Date;

public class ClassRegistrationDomain {

	private String classRegistrationCode;
	private String cardinalCode;
	private String studentCode;
	private String openSubjectCode;
	private int classRegistrationAmount;
	private Date classRegistrationDate;
	private String payState;
	
	public String getClassRegistrationCode() {
		return classRegistrationCode;
	}
	public void setClassRegistrationCode(String classRegistrationCode) {
		this.classRegistrationCode = classRegistrationCode;
	}
	public String getCardinalCode() {
		return cardinalCode;
	}
	public void setCardinalCode(String cardinalCode) {
		this.cardinalCode = cardinalCode;
	}
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
	public int getClassRegistrationAmount() {
		return classRegistrationAmount;
	}
	public void setClassRegistrationAmount(int classRegistrationAmount) {
		this.classRegistrationAmount = classRegistrationAmount;
	}
	public Date getClassRegistrationDate() {
		return classRegistrationDate;
	}
	public void setClassRegistrationDate(Date classRegistrationDate) {
		this.classRegistrationDate = classRegistrationDate;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	
	@Override
	public String toString() {
		return "ClassRegistrationDomain [classRegistrationCode=" + classRegistrationCode + ", cardinalCode="
				+ cardinalCode + ", studentCode=" + studentCode + ", openSubjectCode=" + openSubjectCode
				+ ", classRegistrationAmount=" + classRegistrationAmount + ", classRegistrationDate="
				+ classRegistrationDate + ", payState=" + payState + "]";
	}	
}
