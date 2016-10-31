package com.cyber.smedu.board.domain;

public class BoardFileDomain {
	
	private String boardFileCode;
	private String boardArticleCode;
	private String boardFileName;
	private String boardFileExt;
	private int boardFileSize;
	private String boardFileType;
	private String boardOriginFileName;
	
	public String getBoardFileCode() {
		return boardFileCode;
	}
	public void setBoardFileCode(String boardFileCode) {
		this.boardFileCode = boardFileCode;
	}
	public String getBoardArticleCode() {
		return boardArticleCode;
	}
	public void setBoardArticleCode(String boardArticleCode) {
		this.boardArticleCode = boardArticleCode;
	}
	public String getBoardFileName() {
		return boardFileName;
	}
	public void setBoardFileName(String boardFileName) {
		this.boardFileName = boardFileName;
	}
	public String getBoardFileExt() {
		return boardFileExt;
	}
	public void setBoardFileExt(String boardFileExt) {
		this.boardFileExt = boardFileExt;
	}
	public int getBoardFileSize() {
		return boardFileSize;
	}
	public void setBoardFileSize(int boardFileSize) {
		this.boardFileSize = boardFileSize;
	}
	public String getBoardFileType() {
		return boardFileType;
	}
	public void setBoardFileType(String boardFileType) {
		this.boardFileType = boardFileType;
	}
	public String getBoardOriginFileName() {
		return boardOriginFileName;
	}
	public void setBoardOriginFileName(String boardOriginFileName) {
		this.boardOriginFileName = boardOriginFileName;
	}
	
	@Override
	public String toString() {
		return "BoardFileDomain [boardFileCode=" + boardFileCode + ", boardArticleCode=" + boardArticleCode
				+ ", boardFileName=" + boardFileName + ", boardFileExt=" + boardFileExt + ", boardFileSize="
				+ boardFileSize + ", boardFileType=" + boardFileType + ", boardOriginFileName=" + boardOriginFileName
				+ "]";
	}
	
	
}
