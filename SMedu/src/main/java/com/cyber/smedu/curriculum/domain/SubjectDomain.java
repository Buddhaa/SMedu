package com.cyber.smedu.curriculum.domain;

import java.sql.Date;

public class SubjectDomain {
	private String subjectCode;
	private String departmentCode;
	private String subjectName;
	private String subjectSort;
	private int subjectPay;
	private int subjectCredit;
	private String subjectSummary;
	private String subjectGoal;
	private Date subjectDate;
	private String subjectState;
	
	private String departmentName;
	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getSubjectCode() {
		return subjectCode;
	}
	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}
	public String getDepartmentCode() {
		return departmentCode;
	}
	public void setDepartmentCode(String departmentCode) {
		this.departmentCode = departmentCode;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getSubjectSort() {
		return subjectSort;
	}
	public void setSubjectSort(String subjectSort) {
		this.subjectSort = subjectSort;
	}
	public int getSubjectPay() {
		return subjectPay;
	}
	public void setSubjectPay(int subjectPay) {
		this.subjectPay = subjectPay;
	}
	public int getSubjectCredit() {
		return subjectCredit;
	}
	public void setSubjectCredit(int subjectCredit) {
		this.subjectCredit = subjectCredit;
	}
	public String getSubjectSummary() {
		return subjectSummary;
	}
	public void setSubjectSummary(String subjectSummary) {
		this.subjectSummary = subjectSummary;
	}
	public String getSubjectGoal() {
		return subjectGoal;
	}
	public void setSubjectGoal(String subjectGoal) {
		this.subjectGoal = subjectGoal;
	}
	public Date getSubjectDate() {
		return subjectDate;
	}
	public void setSubjectDate(Date subjectDate) {
		this.subjectDate = subjectDate;
	}
	public String getSubjectState() {
		return subjectState;
	}
	public void setSubjectState(String subjectState) {
		this.subjectState = subjectState;
	}
	
	@Override
	public String toString() {
		return "BookDomain [subjectCode=" + subjectCode + ", departmentCode=" + departmentCode + ", subjectName="
				+ subjectName + ", subjectSort=" + subjectSort + ", subjectPay=" + subjectPay + ", subjectCredit="
				+ subjectCredit + ", subjectSummary=" + subjectSummary + ", subjectGoal=" + subjectGoal
				+ ", subjectDate=" + subjectDate + ", subjectState=" + subjectState + "]";
	}	

}
