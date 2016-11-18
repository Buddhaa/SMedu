package com.cyber.smedu.helper;

public class HelperPaging {
	private int startRow;
    private int linePerPage;
	
    public HelperPaging(int page, int linePerPage) {
        this.linePerPage = linePerPage;
        this.startRow = (page-1)*linePerPage;
    }
    
    public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getLinePerPage() {
		return linePerPage;
	}
	public void setLinePerPage(int linePerPage) {
		this.linePerPage = linePerPage;
	}
	
	@Override
	public String toString() {
		return "BoardPageHelper [startRow=" + startRow + ", linePerPage=" + linePerPage + "]";
	}
}

