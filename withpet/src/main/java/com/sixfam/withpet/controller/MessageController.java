package com.sixfam.withpet.controller;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.MessageDTO;
import com.sixfam.withpet.service.MemberService;
import com.sixfam.withpet.service.MessageService;

@Controller
public class MessageController {
	
	@Resource
	MessageService service;
	
	@Resource
	MemberService member;

	/*
	 * 메세지 작성 페이지로 가기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("messagewrite.do")
	public String messageWriteViewRequest(Model model, Authentication authentication) {
		messageInfo(model, authentication);
		return "message_write.tiles";
	}
	
	/*
	 * 메세지 답장 페이지로 가기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("messageanswer.do")
	public String messageAnswerViewRequest(Model model, String sender, Authentication authentication) {
		model.addAttribute("sender", sender);
		messageInfo(model, authentication);
		return "message_answer.tiles";
	}
	
	/*
	 * 메세지 작성 하기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value = "writemessage.do", method= RequestMethod.POST)
	public String writeMessageRequest(MessageDTO message, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		message.setSender(mdto.getId());
		
		MemberDTO receiver = member.findMemberById(message.getReceiver());
		if(receiver == null)
			return "write_fail.tiles";
		
		if(mdto.getId().equals(receiver.getId()))
			return "write_info_fail.tiles";
		
		service.registerMessage(message);
		return "redirect:sendmessage.do?pageNo=1";
	}
	
	
	/*
	 * 보낸메세지 상세보기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("sendread.do")
	public String sendReadRequest(Model model, Authentication authentication, int messageNo) {
		model.addAttribute("readSendMessage", service.findSendMessageByNo(messageNo));
		messageInfo(model, authentication);
		return "message_sendread.tiles";
	}
	
	/*
	 * 받은메세지 상세보기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("receiveread.do")
	public String receiveReadRequest(Model model, Authentication authentication, int messageNo) {
		model.addAttribute("readReceiveMessage", service.findReceiveMessageByNo(messageNo));
		messageInfo(model, authentication);
		return "message_receiveread.tiles";
	}
	
	/*
	 * 받은메세지 목록
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("receivemessage.do")
	public String receiveMessageViewRequest(Model model, Authentication authentication, int pageNo) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		String id = mdto.getId();
		model.addAttribute("messageReceivelist", service.getAllReceiveMsgList(id, pageNo));
		messageInfo(model, authentication);
		return "receive_message.tiles";
	}
	
	/*
	 * 보낸메세지 목록
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("sendmessage.do")
	public String sendMessageViewRequest(Model model, Authentication authentication, int pageNo) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		String id = mdto.getId();
		model.addAttribute("messageSendlist", service.getAllSendMsgList(id, pageNo));
		messageInfo(model, authentication);
		return "send_message.tiles";
	}
	
	/*
	 * 보낸 메세지 삭제
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("deleteSendMessage.do")
	public String deleteSendMessageRequest(int messageNo) {
		service.removeSendMessage(messageNo);
		return "redirect:sendmessage.do?pageNo=1";
	}
	
	/*
	 * 받은 메세지 삭제
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("deleteReceiveMessage.do")
	public String deleteReceiveMessageRequest(int messageNo) {
		service.removeReceiveMessage(messageNo);
		return "redirect:receivemessage.do?pageNo=1";
	}
	
	
	public Model messageInfo(Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		String id = mdto.getId();
		model.addAttribute("memberAllCountMessage", service.getNotDeleteMessageCount(id));
		model.addAttribute("notReadMessageCount", service.getNotReadMessageCount(id));
		return model;
	}
}
