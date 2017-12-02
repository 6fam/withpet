package com.sixfam.withpet.model.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @테이블정보
 * @테이블명
 * 	-Board<br>
 * @컬럼명
 * 	변수명		컬럼명			<br>
 * 	-boardNo	=> board_no		<br>
 *	-id			=> id			<br>
 *	-title 		=> title		<br>
 *	-content	=> content 		<br>
 *	-hits		=> hits			<br>
 *	-wdate		=> wdate		<br>
 *	-categoryNo	=> category_no	<br>
 * @클래스설명
 *  -게시판의 정보를 담고 있는 클래스입니다.	<br>
 */
public class BoardDTO extends UploadDTO {

	/*
	 * 게시글 번호 
	 * 컬럼명 : board_no
	 */
	private int boardNo;
	/*
	 * row_num
	 */
	private int rnum;
	/*
	 * 회원 아이디 
	 * 컬럼명 : id
	 */
	private String id;
	/*
	 * 글 제목
	 * 컬럼명 : title
	 */
	private String title;
	/*
	 * 글 내용
	 * 컬럼명 : content
	 */
	private String content;
	/*
	 * 조회수
	 * 컬럼명 : hits
	 */
	private int hits;
	/*
	 * 글 작성 일자 
	 * 컬럼명 : wdate
	 */
	private String wdate;
	/*
	 * 게시판 분류 번호 
	 * 컬럼명 : category_no
	 */
	private int categoryNo;
	/*
	 * 게시판 카테고리
	 */
	private String categoryName;
	/*
	 * 게시글의 리플 리스트
	 */
	
	private List<ReplyDTO> replyList;
	/**
	 * Default Constructor
	 */
	public BoardDTO() {
		super();
	}
	
	
	public BoardDTO(MultipartFile uploadFile) {
		super(uploadFile);
	}

	public BoardDTO(int boardNo, String title, int hits) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.hits = hits;
	}


	public BoardDTO(String id, String title, String content , int categoryNo) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
	}
	
	public BoardDTO(int boardNo, String id, String title, String content, List<ReplyDTO> replyList) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.replyList = replyList;
	}

	public BoardDTO(int boardNo, String id, String title, String content , int categoryNo) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.categoryNo = categoryNo;
	}


	public BoardDTO(int boardNo, String id, String title, String content, int hits, String wdate) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.wdate = wdate;
	}

	public BoardDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
			List<ReplyDTO> replyList) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.wdate = wdate;
		this.categoryNo = categoryNo;
		this.replyList = replyList;
	}
	
	
	public BoardDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
			List<ReplyDTO> replyList, MultipartFile uploadFile) {
		super(uploadFile);
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.wdate = wdate;
		this.categoryNo = categoryNo;
		this.replyList = replyList;
	}



	public BoardDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
			String categoryName, List<ReplyDTO> replyList) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.title = title;
		this.content = content;
		this.hits = hits;
		this.wdate = wdate;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.replyList = replyList;
	}
	
/**
 * All has Constructor
 */

	public BoardDTO(int boardNo, int rnum, String id, String title, String content, int hits, String wdate, int categoryNo,
		String categoryName, List<ReplyDTO> replyList) {
	super();
	this.boardNo = boardNo;
	this.rnum = rnum;
	this.id = id;
	this.title = title;
	this.content = content;
	this.hits = hits;
	this.wdate = wdate;
	this.categoryNo = categoryNo;
	this.categoryName = categoryName;
	this.replyList = replyList;
}

	/**
	 * 관리자 페이지 게시물리스트 생성자
	 * 
	 * @param boardNo 
	 * @param id
	 * @param title
	 * @param content
	 * @param hits
	 * @param wdate
	 * @param categoryNo
	 * @param categoryName
	 */
	public BoardDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
		String categoryName) {
	super();
	this.boardNo = boardNo;
	this.id = id;
	this.title = title;
	this.content = content;
	this.hits = hits;
	this.wdate = wdate;
	this.categoryNo = categoryNo;
	this.categoryName = categoryName;
	}
	
	public BoardDTO(String id, String title, String content) {
		this.id = id;
		this.title = title;
		this.content = content;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	

	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public List<ReplyDTO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyDTO> replyList) {
		this.replyList = replyList;
	}
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", rnum=" + rnum + ", id=" + id + ", title=" + title + ", content="
				+ content + ", hits=" + hits + ", wdate=" + wdate + ", categoryNo=" + categoryNo + ", categoryName="
				+ categoryName + ", replyList=" + replyList + "]";
	}

	
}
