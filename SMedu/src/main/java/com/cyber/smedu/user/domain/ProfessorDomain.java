package com.cyber.smedu.user.domain;

public class ProfessorDomain {
	private String professorCode;
	private String userCode;
	private String professorBachelor;
	private String professorMaster;
	private String professorDoctor;
	private String professorCareer;
	
	public String getProfessorCode() {
		return professorCode;
	}
	public void setProfessorCode(String professorCode) {
		this.professorCode = professorCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getProfessorBachelor() {
		return professorBachelor;
	}
	public void setProfessorBachelor(String professorBachelor) {
		this.professorBachelor = professorBachelor;
	}
	public String getProfessorMaster() {
		return professorMaster;
	}
	public void setProfessorMaster(String professorMaster) {
		this.professorMaster = professorMaster;
	}
	public String getProfessorDoctor() {
		return professorDoctor;
	}
	public void setProfessorDoctor(String professorDoctor) {
		this.professorDoctor = professorDoctor;
	}
	public String getProfessorCareer() {
		return professorCareer;
	}
	public void setProfessorCareer(String professorCareer) {
		this.professorCareer = professorCareer;
	}
	
	@Override
	public String toString() {
		return "ProfessorDomain [professorCode=" + professorCode + ", userCode=" + userCode + ", professorBachelor="
				+ professorBachelor + ", professorMaster=" + professorMaster + ", professorDoctor=" + professorDoctor
				+ ", professorCareer=" + professorCareer + "]";
	}
}
