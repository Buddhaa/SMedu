package com.cyber.smedu.board.domain;

public class BoardCategoryDomain {
	
	private String boardCode;
	private String boardName;
	
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	
	@Override
	public String toString() {
		return "BoardCategoryDomain [boardCode=" + boardCode + ", boardName=" + boardName + "]";
	}
	
	
}
