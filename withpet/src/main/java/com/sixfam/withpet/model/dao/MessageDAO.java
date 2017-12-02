package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MessageDTO;

public interface MessageDAO {

	void writeMessage(MessageDTO message);
	
	int getTotalCountReceiveMsg(String id);
	
	int getTotalCountSendMsg(String id);

	List<MessageDTO> getAllReceiveMsgList(String id, PagingBean pagingBean);
	
	List<MessageDTO> getAllSendMsgList(String id, PagingBean pagingBean);
	
	int getNotReadMessageCount(String id);
	
	int getNotDeleteMessageCount(String id);
	
	MessageDTO readSendMessage(int messageNo);
	
	MessageDTO readReceiveMessage(int messageNo);
	
	int getSenderDeleteInfo(int messageNo);
	
	int getReceiverDeleteInfo(int messageNo);
	
	void messageReadChk(int messageNo);
	
	void updateSenderDFlag(int messageNo);
	
	void updateReceiverDFlag(int messageNo);
	
	void deleteMessage(int messageNo);
}
