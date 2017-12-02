package com.sixidiot.withpet.model.dto;

public class MessageDTO {
	private int messageNo;
	private String sender;
	private String receiver;
	private String receivemsg;
	private String regdate;
	private int flag;
	private int receiverDate;
	private int senderDflag;
	private int receiverDflag;

	/*
	 * Default Constructor
	 */
	public MessageDTO() {
		super();
	}
	
	/*
	 * SendMessage
	 */
	public MessageDTO(String sender, String receiver, String receivemsg) {
		this.sender = sender;
		this.receiver = receiver;
		this.receivemsg = receivemsg;
	}

	/*
	 * All Constructor
	 */
	public MessageDTO(int messageNo, String sender, String receiver, String receivemsg, String regdate, int flag,
			int receiverDate, int senderDflag, int receiverDflag) {
		this.messageNo = messageNo;
		this.sender = sender;
		this.receiver = receiver;
		this.receivemsg = receivemsg;
		this.regdate = regdate;
		this.flag = flag;
		this.receiverDate = receiverDate;
		this.senderDflag = senderDflag;
		this.receiverDflag = receiverDflag;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getReceivemsg() {
		return receivemsg;
	}

	public void setReceivemsg(String receivemsg) {
		this.receivemsg = receivemsg;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public int getReceiverDate() {
		return receiverDate;
	}

	public void setReceiverDate(int receiverDate) {
		this.receiverDate = receiverDate;
	}

	public int getSenderDflag() {
		return senderDflag;
	}

	public void setSenderDflag(int senderDflag) {
		this.senderDflag = senderDflag;
	}

	public int getReceiverDflag() {
		return receiverDflag;
	}

	public void setReceiverDflag(int receiverDflag) {
		this.receiverDflag = receiverDflag;
	}

	@Override
	public String toString() {
		return "MessageDTO [messageNo=" + messageNo + ", sender=" + sender + ", receiver=" + receiver + ", receivemsg="
				+ receivemsg + ", regdate=" + regdate + ", flag=" + flag + ", receiverDate=" + receiverDate
				+ ", senderDflag=" + senderDflag + ", receiverDflag=" + receiverDflag + "]";
	}
}
