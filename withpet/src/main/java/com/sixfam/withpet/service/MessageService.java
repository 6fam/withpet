package com.sixfam.withpet.service;

import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MessageDTO;

public interface MessageService {
	
	public void registerMessage(MessageDTO message);
	
	public MessageDTO findSendMessageByNo(int messageNo);
	
	public MessageDTO findReceiveMessageByNo(int messageNo);
	
	public ListDTO<MessageDTO> getAllReceiveMsgList(String id, int pageNo);
	
	public ListDTO<MessageDTO> getAllSendMsgList(String id, int pageNo);
	
	public int getNotReadMessageCount(String id);
	
	public int getNotDeleteMessageCount(String id);

	public void removeReceiveMessage(int messageNo);
	
	public void removeSendMessage(int messageNo);
}
