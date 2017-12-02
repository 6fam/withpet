package com.sixidiot.withpet.service;

import com.sixidiot.withpet.model.dto.ListDTO;
import com.sixidiot.withpet.model.dto.MessageDTO;

public interface MessageService {
	
	void writeMessage(MessageDTO message);
	
	ListDTO<MessageDTO> getAllReceiveMsgList(String id, int pageNo);
	
	ListDTO<MessageDTO> getAllSendMsgList(String id, int pageNo);
	
	int getNotReadMessageCount(String id);
	
	int getNotDeleteMessageCount(String id);

	MessageDTO readSendMessage(int messageNo);
	
	MessageDTO readReceiveMessage(int messageNo);
	
	void deleteReceiveMessage(int messageNo);
	
	void deleteSendMessage(int messageNo);
}
