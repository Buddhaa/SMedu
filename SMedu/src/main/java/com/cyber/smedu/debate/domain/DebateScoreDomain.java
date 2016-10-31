package com.cyber.smedu.debate.domain;

import java.sql.Date;

public class DebateScoreDomain {

	private String debateScoreCode;
	private String professorCode;
	private String debateCode;
	private String debateResultCode;
	private int debateScore;
	private Date debateScoreDate;
	
	public String getDebateScoreCode() {
		return debateScoreCode;
	}
	public void setDebateScoreCode(String debateScoreCode) {
		this.debateScoreCode = debateScoreCode;
	}
	public String getProfessorCode() {
		return professorCode;
	}
	public void setProfessorCode(String professorCode) {
		this.professorCode = professorCode;
	}
	public String getDebateCode() {
		return debateCode;
	}
	public void setDebateCode(String debateCode) {
		this.debateCode = debateCode;
	}
	public String getDebateResultCode() {
		return debateResultCode;
	}
	public void setDebateResultCode(String debateResultCode) {
		this.debateResultCode = debateResultCode;
	}
	public int getDebateScore() {
		return debateScore;
	}
	public void setDebateScore(int debateScore) {
		this.debateScore = debateScore;
	}
	public Date getDebateScoreDate() {
		return debateScoreDate;
	}
	public void setDebateScoreDate(Date debateScoreDate) {
		this.debateScoreDate = debateScoreDate;
	}
	@Override
	public String toString() {
		return "DebateScoreDomain [debateScoreCode=" + debateScoreCode + ", professorCode=" + professorCode
				+ ", debateCode=" + debateCode + ", debateResultCode=" + debateResultCode + ", debateScore="
				+ debateScore + ", debateScoreDate=" + debateScoreDate + "]";
	}
}
