package com.sixfam.withpet.model.dto;

public class SympathyDTO {
	private int boardNo;
	private String id;
	
	public SympathyDTO(int boardNo, String id) {
		super();
		this.boardNo = boardNo;
		this.id = id;
	}
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "SympathyDTO [boardNo=" + boardNo + ", id=" + id + "]";
	}
}
