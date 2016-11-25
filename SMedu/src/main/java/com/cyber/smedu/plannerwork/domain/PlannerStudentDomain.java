package com.cyber.smedu.plannerwork.domain;



public class PlannerStudentDomain {

	private String plannerStudentCode;
	private String plannerCode;
	private String cardinalCode;
	private String studentCode;
	private String cardinal; //DB에없지만 추가
	
	private String departmentName; //DB에없지만 추가
	private String departmentCode; //DB에없지만 추가
	private String userName; //DB에없지만 추가
	private String userPhone; //DB에없지만 추가
	
	private String attendDate;
	private String examDate;
	private String debateRegisterDate;
	private String taskResultDate;
	
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
	public String getCardinal() {
		return cardinal;
	}
	public void setCardinal(String cardinal) {
		this.cardinal = cardinal;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getAttendDate() {
		return attendDate;
	}
	public void setAttendDate(String attendDate) {
		this.attendDate = attendDate;
	}
	public String getExamDate() {
		return examDate;
	}
	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}
	public String getDebateRegisterDate() {
		return debateRegisterDate;
	}
	public void setDebateRegisterDate(String debateRegisterDate) {
		this.debateRegisterDate = debateRegisterDate;
	}
	public String getTaskResultDate() {
		return taskResultDate;
	}
	public void setTaskResultDate(String taskResultDate) {
		this.taskResultDate = taskResultDate;
	}
	@Override
	public String toString() {
		return "PlannerStudentDomain [plannerStudentCode=" + plannerStudentCode + ", plannerCode=" + plannerCode
				+ ", cardinalCode=" + cardinalCode + ", studentCode=" + studentCode + ", cardinal=" + cardinal
				+ ", departmentName=" + departmentName + ", departmentCode=" + departmentCode + ", userName=" + userName
				+ ", userPhone=" + userPhone + ", attendDate=" + attendDate + ", examDate=" + examDate
				+ ", debateRegisterDate=" + debateRegisterDate + ", taskResultDate=" + taskResultDate + "]";
	}
	
	
}