package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MessageDTO;

public interface MessageDAO {

	public void isMessageReadChk(int messageNo);
	
	public void registerMessage(MessageDTO message);
	
	public MessageDTO findSendMessageByNo(int messageNo);
	
	public MessageDTO findReceiveMessageByNo(int messageNo);
	
	public int getSenderDeleteInfo(int messageNo);
	
	public int getReceiverDeleteInfo(int messageNo);
	
	public int getTotalCountReceiveMsg(String id);
	
	public int getTotalCountSendMsg(String id);

	public List<MessageDTO> getAllReceiveMsgList(String id, PagingBean pagingBean);
	
	public List<MessageDTO> getAllSendMsgList(String id, PagingBean pagingBean);
	
	public int getNotReadMessageCount(String id);
	
	public int getNotDeleteMessageCount(String id);
	
	public void setSenderDFlag(int messageNo);
	
	public void setReceiverDFlag(int messageNo);
	
	void removeMessage(int messageNo);
}
