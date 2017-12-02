package com.sixidiot.doingtogether.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-Reply<br>
 * @컬럼명
 * 	변수명		컬럼명			<br>
 *	-replyNo	=> reply_no		<br>
 *	-content 	=> content		<br>
 *	-id			=> id			<br>
 *	-boardNo	=> board_no		<br>
 * @클래스설명
 *  -게시판의 덧글 정보를 담고 있는 클래스입니다.<br>
 */
public class ReplyDTO {
	

	/*
	 * 덧글 번호
	 * 컬럼명 : reply_no
	 */
	private int replyNo;
	/*
	 * 덧글 내용
	 * 컬럼명 : content
	 */
	private String content;
	/*
	 * 덧글 작성자
	 * 컬럼명 : id
	 */
	private String id;
	/*
	 * 덧글 작성자 닉네임
	 */
	private String nick;
	/*
	 * 덧글 해당 글 번호
	 * 컬럼명 : board_no
	 */
	private int boardNo;
	/**
	 * Default Constructor
	 */
	public ReplyDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public ReplyDTO(int replyNo, String content, String id, int boardNo) {
		super();
		this.replyNo = replyNo;
		this.content = content;
		this.id = id;
		this.boardNo = boardNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyNo=" + replyNo + ", content=" + content + ", id=" + id + ", boardNo=" + boardNo + "]";
	}
}
