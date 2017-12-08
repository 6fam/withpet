package com.sixfam.withpet.model.dto;

public class ServiceIntroDTO {
	/*
	 * 일정 번호 
	 * 컬럼명 : board_no
	 */
	private int boardNo;
	/*
	 * 일정 번호 
	 * 컬럼명 : content
	 */
	private String content;
	
	public ServiceIntroDTO() {
		super();
	}
	public ServiceIntroDTO(int boardNo, String content) {
		super();
		this.boardNo = boardNo;
		this.content = content;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ServiceIntroDTO [boardNo=" + boardNo + ", content=" + content + "]";
	}
}
