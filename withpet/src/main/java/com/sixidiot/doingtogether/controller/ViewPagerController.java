package com.sixidiot.doingtogether.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dto.ListDTO;
import com.sixidiot.doingtogether.model.dto.MeetingDTO;
import com.sixidiot.doingtogether.service.MeetingService;

@Controller
public class ViewPagerController {
	
	@Resource
	private MeetingService meetingService;
	
	/**
	 * 홈페이지
	 */
	@RequestMapping("home.do")
	public String home(Model model) {
		
		int meetingCount = meetingService.getMeetingCount();
		PagingBean pb = new PagingBean(12, meetingCount);

		List<MeetingDTO> list = meetingService.getAllMeetingList(pb);
		ListDTO<MeetingDTO> meetingListDTO = new ListDTO<MeetingDTO>(list, pb);
		
		model.addAttribute("meetingList", meetingListDTO);
		return "home.tiles";
	}
	
	
	/**
	 * 회원가입 페이지
	 */
	@RequestMapping("join.do")
	public String join() {
		return "join.tiles";
	}
	
	/**
	 * 로그인 페이지
	 */
	@RequestMapping("loginForm.do")
	public String login() {
		return "loginForm.tiles";
	}
	
	/**
	 * 로그인 실패 페이지
	 */
	@RequestMapping("login_fail.do")
	public String loginfail() {
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
	public String meetingwrite() {
		return "meetingwrite.tiles";
	}
	
	
	/**
	 * 나눔마켓작성
	 */
	@RequestMapping("sharemarket_write.do")
	public String sharemarketWrite() {
		return "sharemarket_write.tiles";
	}

	
	/**
	 * 나눔마켓상세보기
	 */
	@RequestMapping("sharemarket_detail.do")
	public String shareMarketDetail() {
		return "sharemarket_detail.tiles";
	}
	
	/**
	 * 나눔마켓 수정
	 */
	@RequestMapping("sharemarket_update.do")
	public String shareMarketUpdate() {
		return "sharemarket_update.tiles";
	}
	
	/*
	 *  댕댕이 등록 
	 */
	@RequestMapping("dog_check.do")
	public String dogCheckForm() {
		return "dog_check.tiles";
	}
	
	/*
	 * 타일즈 테스트
	 */
	@RequestMapping("togetherpagemove.do")
	public String togetherDogMove() {
		return "together/togetherpagemove.tiles";
	}
}
