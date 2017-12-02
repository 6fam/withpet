package com.sixidiot.doingtogether.model.dto;

public class ImgDTO {
	private int imgNo;
	private String imgPath;
	private int boardNo;
	public ImgDTO() {
		super();
	}
	public ImgDTO(String imgPath) {
		super();
		this.imgPath = imgPath;
	}
	public ImgDTO(int imgNo, String imgPath, int boardNo) {
		super();
		this.imgNo = imgNo;
		this.imgPath = imgPath;
		this.boardNo = boardNo;
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "ImgDTO [imgNo=" + imgNo + ", imgPath=" + imgPath + ", boardNo=" + boardNo + "]";
	}
	
	

}
