package com.sixidiot.doingtogether.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-InterestHistory<br>
 * @컬럼명
 * 	변수명		컬럼명			<br>
 *	-id 		=> id			<br>
 *	-boardNo	=> board_no 	<br>
 *	-categoryNo	=> category_no	<br>
 * @클래스설명
 *  -참여내역 데이터를 관리하는 클래스입니다.<br>
 *  -id	: 참여자의 회원 아이디가 올 수 있습니다.<br>
 *  -boardNo : 회원의 참여게시판 정보가 올 수 있습니다.<br>
 *  -categoryNo : 참여의 분류번호가 올 수 있습니다.<br>
 */
public class AttendDTO {
	/*
	 * 회원 아이디 
	 * 컬럼명 : id
	 */
	private String id;
	/*
	 * 회원 아이디 
	 * 컬럼명 : board_no
	 */
	private int boardNo;
	/*
	 * 분류 번호 
	 * 컬럼명 : category_no
	 */
	private int categoryNo;
	/**
	 * Default Constructor
	 */
	public AttendDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public AttendDTO(String id, int boardNo, int categoryNo) {
		super();
		this.id = id;
		this.boardNo = boardNo;
		this.categoryNo = categoryNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	@Override
	public String toString() {
		return "AttendDTO [id=" + id + ", boardNo=" + boardNo + ", categoryNo=" + categoryNo + "]";
	}
}
