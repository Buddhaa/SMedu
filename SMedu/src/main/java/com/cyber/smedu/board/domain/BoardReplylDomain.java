package com.cyber.smedu.board.domain;

import java.sql.Timestamp;

public class BoardReplylDomain {

	private String commentCode;
	private String userCode;
	private String boardArticleCode;
	private String commentContent;
	private Timestamp commentDate;
	
	public String getCommentCode() {
		return commentCode;
	}
	public void setCommentCode(String commentCode) {
		this.commentCode = commentCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getBoardArticleCode() {
		return boardArticleCode;
	}
	public void setBoardArticleCode(String boardArticleCode) {
		this.boardArticleCode = boardArticleCode;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	
	@Override
	public String toString() {
		return "BoardReplylDomain [commentCode=" + commentCode + ", userCode=" + userCode + ", boardArticleCode="
				+ boardArticleCode + ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
	
	
}
