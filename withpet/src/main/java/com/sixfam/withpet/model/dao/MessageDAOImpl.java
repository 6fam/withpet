package com.sixfam.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MessageDTO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Resource
	SqlSessionTemplate template;

	@Override
	public void writeMessage(MessageDTO message) {
		template.insert("message.writeMessage", message);
	}

	@Override
	public List<MessageDTO> getAllReceiveMsgList(String id, PagingBean pagingBean) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRNum", pagingBean.getStartRowNumber());
		map.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("message.receiverMessage", map);
	}

	@Override
	public List<MessageDTO> getAllSendMsgList(String id, PagingBean pagingBean) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("startRNum", pagingBean.getStartRowNumber());
		map.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("message.senderMessage", map);
	}

	@Override
	public int getTotalCountReceiveMsg(String id) {
		return template.selectOne("message.getTotalCountReceiveMsg", id);
	}

	@Override
	public int getTotalCountSendMsg(String id) {
		return template.selectOne("message.getTotalCountSendMsg", id);
	}

	@Override
	public int getNotReadMessageCount(String id) {
		return template.selectOne("message.getNotReadMessageCount", id);
	}

	@Override
	public int getNotDeleteMessageCount(String id) {
		return template.selectOne("message.getNotDeleteMessageCount", id);
	}

	@Override
	public MessageDTO readSendMessage(int messageNo) {
		return template.selectOne("message.readSendMessage",messageNo);
	}

	@Override
	public MessageDTO readReceiveMessage(int messageNo) {
		return template.selectOne("message.readReceiveMessage", messageNo);
	}

	@Override
	public int getSenderDeleteInfo(int messageNo) {
		return template.selectOne("message.getSenderDeleteInfo",messageNo);
	}

	@Override
	public int getReceiverDeleteInfo(int messageNo) {
		return template.selectOne("message.getReceiverDeleteInfo",messageNo);
	}

	@Override
	public void updateSenderDFlag(int messageNo) {
		template.update("message.updateSenderDFlag",messageNo);
	}

	@Override
	public void updateReceiverDFlag(int messageNo) {
		template.update("message.updateReceiverDFlag",messageNo);
	}

	@Override
	public void deleteMessage(int messageNo) {
		template.delete("message.deleteMessage",messageNo);	
	}

	@Override
	public void messageReadChk(int messageNo) {
		template.update("message.messageReadChk", messageNo);
	}


}
