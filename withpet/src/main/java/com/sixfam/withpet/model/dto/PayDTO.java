package com.sixfam.withpet.model.dto;

public class PayDTO {
	private String id;
	private String nick;
	private String content;
	private String pay;
	private int boardNo;
	
	public PayDTO() {
		super();
	}
	public PayDTO(String id, String nick, String content, String pay, int boardNo) {
		super();
		this.id = id;
		this.nick = nick;
		this.content = content;
		this.pay = pay;
		this.boardNo = boardNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
}
