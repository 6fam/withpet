package com.sixfam.withpet.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.MeetingService;

@Controller
public class ViewPagerController {
	
	@Resource
	private MeetingService meetingService;
	
	/**
	 * 홈페이지
	 */
	@RequestMapping("home.do")
	public String homeRequest(Model model, Authentication authentication) {
		try {
			  
			MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
			String id = mdto.getId();
			
		}catch(NullPointerException e){
			
		}
		
		int meetingCount = meetingService.getMeetingCount();
		PagingBean pb = new PagingBean(12, meetingCount);
		
		meetingService.setMeetingState(WithPet.MEETING_CLOSE);
		List<MeetingDTO> list = meetingService.getAllMeetingList(pb);
		ListDTO<MeetingDTO> meetingListDTO = new ListDTO<MeetingDTO>(list, pb);
		
		model.addAttribute("meetingList", meetingListDTO);
		return "home.tiles";
	}
	
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping("join.do")
	public String joinRequest() {
		return "join.tiles";
	}
	
	/**
	 * 로그인 페이지
	 */
	@RequestMapping("loginForm.do")
	public String loginRequest() {
		return "loginForm.tiles";
	}
	
	/**
	 * 로그인 실패 페이지
	 */
	@RequestMapping("login_fail.do")
	public String loginfailRequest() {
		return "login_fail.tiles";
	}
	
	/**
	 * 모임 목록 페이지
	 */
	/*
	@RequestMapping("meeting.do")
	public String meeting() {
		return "meeting.tiles";
	}*/
	
	/**
	 * 모임 개설 페이지
	 */
	@RequestMapping("meetingwrite.do")
	public String meetingwriteRequest() {
		return "meetingwrite.tiles";
	}
	
	/*
	 *  댕댕이 등록 
	 */
	@RequestMapping("dog_check.do")
	public String dogCheckFormRequest() {
		return "dog_check.tiles";
	}
	
	/*
	 * 타일즈 테스트
	 */
	@RequestMapping("togetherpagemove.do")
	public String togetherDogMoveRequest() {
		return "together/togetherpagemove.tiles";
	}
}
