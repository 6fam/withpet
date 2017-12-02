package com.sixidiot.doingtogether.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dao.MessageDAO;
import com.sixidiot.doingtogether.model.dto.ListDTO;
import com.sixidiot.doingtogether.model.dto.MessageDTO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Resource
	MessageDAO message;

	@Override
	public void writeMessage(MessageDTO messageDTO) {
		message.writeMessage(messageDTO);
	}

	@Override
	public ListDTO<MessageDTO> getAllReceiveMsgList(String id, int pageNo) {
		int totalCount=message.getTotalCountReceiveMsg(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10, 5, totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 5, totalCount);
		
		return new ListDTO<MessageDTO>(message.getAllReceiveMsgList(id,pagingBean), pagingBean);
	}

	@Override
	public ListDTO<MessageDTO> getAllSendMsgList(String id, int pageNo) {
		int totalCount=message.getTotalCountSendMsg(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,5,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 5, totalCount);
		
		return new ListDTO<MessageDTO>(message.getAllSendMsgList(id,pagingBean), pagingBean);
	}

	@Override
	public int getNotReadMessageCount(String id) {
		return message.getNotReadMessageCount(id);
	}

	@Override
	public int getNotDeleteMessageCount(String id) {
		return message.getNotDeleteMessageCount(id);
	}

	@Override
	public MessageDTO readSendMessage(int messageNo) {
		return message.readSendMessage(messageNo);
	}

	@Override
	public MessageDTO readReceiveMessage(int messageNo) {
		message.messageReadChk(messageNo);
		return message.readReceiveMessage(messageNo);
	}

	@Override
	public void deleteReceiveMessage(int messageNo) {
		int flag = message.getSenderDeleteInfo(messageNo);
		if(flag == 1)
			message.updateReceiverDFlag(messageNo);
		else
			message.deleteMessage(messageNo);
	}

	@Override
	public void deleteSendMessage(int messageNo) {
		int flag = message.getReceiverDeleteInfo(messageNo);
		if(flag == 1)
			message.updateSenderDFlag(messageNo);
		else
			message.deleteMessage(messageNo);
	}


}
