package com.cyber.smedu.user.domain;

import java.sql.Timestamp;

public class StudentDomain {
	private String userCode;
	private String departmentCode;
	private String departmentName;
	private String userId;
	private String userPw;
	private String userName;
	private String userBirth;
	private String userGender;
	private String userAddress;
	private String userPhone;
	private String userEmail;
	private String userEducational;
	private String userLevel;
	private Timestamp userJoinDate;
	private String userState;
	private Timestamp userOutDate;	
	private String studentCode;
	private String cardinalCode;
	private String studentPath;
	private String studentGoal;
	
	private String openSubjectCode;
	private String finalResult;
	private String completeConfirmation;
	private String subjectName;
	private String year;
	private String semester;
	private String cardinal;
	
	private String debateScoreCode;

	
	public String getDebateScoreCode() {
		return debateScoreCode;
	}


	public void setDebateScoreCode(String debateScoreCode) {
		this.debateScoreCode = debateScoreCode;
	}


	public String getUserCode() {
		return userCode;
	}


	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}


	public String getDepartmentCode() {
		return departmentCode;
	}


	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}


	public String getDepartmentName() {
		return departmentName;
	}


	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserBirth() {
		return userBirth;
	}


	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}


	public String getUserGender() {
		return userGender;
	}


	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}


	public String getUserAddress() {
		return userAddress;
	}


	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public String getUserEducational() {
		return userEducational;
	}


	public void setUserEducational(String userEducational) {
		this.userEducational = userEducational;
	}


	public String getUserLevel() {
		return userLevel;
	}


	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}


	public Timestamp getUserJoinDate() {
		return userJoinDate;
	}


	public void setUserJoinDate(Timestamp userJoinDate) {
		this.userJoinDate = userJoinDate;
	}


	public String getUserState() {
		return userState;
	}


	public void setUserState(String userState) {
		this.userState = userState;
	}


	public Timestamp getUserOutDate() {
		return userOutDate;
	}


	public void setUserOutDate(Timestamp userOutDate) {
		this.userOutDate = userOutDate;
	}


	public String getStudentCode() {
		return studentCode;
	}


	public void setStudentCode(String studentCode) {
		this.studentCode = studentCode;
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


	public String getOpenSubjectCode() {
		return openSubjectCode;
	}


	public void setOpenSubjectCode(String openSubjectCode) {
		this.openSubjectCode = openSubjectCode;
	}


	public String getFinalResult() {
		return finalResult;
	}


	public void setFinalResult(String finalResult) {
		this.finalResult = finalResult;
	}


	public String getCompleteConfirmation() {
		return completeConfirmation;
	}


	public void setCompleteConfirmation(String completeConfirmation) {
		this.completeConfirmation = completeConfirmation;
	}


	public String getSubjectName() {
		return subjectName;
	}


	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}


	public String getYear() {
		return year;
	}


	public void setYear(String year) {
		this.year = year;
	}


	public String getSemester() {
		return semester;
	}


	public void setSemester(String semester) {
		this.semester = semester;
	}


	public String getCardinal() {
		return cardinal;
	}


	public void setCardinal(String cardinal) {
		this.cardinal = cardinal;
	}


	@Override
	public String toString() {
		return "StudentDomain [userCode=" + userCode + ", departmentCode=" + departmentCode + ", departmentName="
				+ departmentName + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userGender=" + userGender + ", userAddress=" + userAddress
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userEducational=" + userEducational
				+ ", userLevel=" + userLevel + ", userJoinDate=" + userJoinDate + ", userState=" + userState
				+ ", userOutDate=" + userOutDate + ", studentCode=" + studentCode + ", cardinalCode=" + cardinalCode
				+ ", studentPath=" + studentPath + ", studentGoal=" + studentGoal + ", openSubjectCode="
				+ openSubjectCode + ", finalResult=" + finalResult + ", completeConfirmation=" + completeConfirmation
				+ ", subjectName=" + subjectName + ", year=" + year + ", semester=" + semester + ", cardinal="
				+ cardinal + "]";
	}
	
	
}
