package com.cyber.smedu.plannerwork.domain;

public class PlannerStudentDomain {

	private String plannerStudentCode;
	private String plannerCode;
	private String cardinalCode;
	private String studentCode;
	
	public String getPlannerStudentCode() {
		return plannerStudentCode;
	}
	public void setPlannerStudentCode(String plannerStudentCode) {
		this.plannerStudentCode = plannerStudentCode;
	}
	public String getPlannerCode() {
		return plannerCode;
	}
	public void setPlannerCode(String plannerCode) {
		this.plannerCode = plannerCode;
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
	@Override
	public String toString() {
		return "PlannerStudentDomain [plannerStudentCode=" + plannerStudentCode + ", plannerCode=" + plannerCode
				+ ", cardinalCode=" + cardinalCode + ", studentCode=" + studentCode + "]";
	}
	
}
