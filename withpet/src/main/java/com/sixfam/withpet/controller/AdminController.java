package com.sixfam.withpet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	/**
	 * 전체회원관리(총회원)
	 */
	@RequestMapping("allmember.do")
	public String allMemberRequest() {
		return "admin/allmember.tiles";
	}
	
	/**
	 * 일반회원관리(회원)
	 */
	@RequestMapping("normalmember.do")
	public String normalMemberRequest() {
		return "admin/normalmember.tiles";
	}
	
	/**
	 * 댕댕이주인 관리(견주)
	 */
	@RequestMapping("dogmommy.do")
	public String dogMommyRequest() {
		return "admin/dogmommy.tiles";
	}

	/**
	 * 예비주인 관리(견주대기자)
	 */
	@RequestMapping("yebimommy.do")
	public String yebiDogMommyRequest() {
		return "admin/yebimommy.tiles";
	}
	
	/**
	 * 관리자 관리(관리자)
	 */
	@RequestMapping("manager.do")
	public String managerRequest() {
		return "admin/manager.tiles";
	}
	
	/**
	 * 탈퇴회원관리(탈퇴자 & 강퇴자)
	 */
	@RequestMapping("exceptmember.do")
	public String exceptMemberRequest() {
		return "admin/exceptmember.tiles";
	}
	
	/**
	 * 모임관리
	 */
	@RequestMapping("allmeeting.do")
	public String allMeetingRequest() {
		return "admin/allmeeting.tiles";
	}

	/**
	 * 모임카테고리
	 */
	@RequestMapping("meetingcategory.do")
	public String meetingCategoryRequest() {
		return "admin/mcategory.tiles";
	}

	/**
	 * 모금함관리
	 */
	@RequestMapping("alldonation.do")
	public String allDonationRequest() {
		return "admin/alldonation.tiles";
	}

	/**
	 * 모금함대기
	 */
	@RequestMapping("donationwait.do")
	public String donationWaitRequest() {
		return "admin/donation_wait.tiles";
	}


	/**
	 * 모금중
	 */
	@RequestMapping("donatting.do")
	public String donationListRequest() {
		return "admin/donatting.tiles";
	}
	
	/**
	 * 모금마감
	 */
	@RequestMapping("donationfinish.do")
	public String donationFinishRequest() {
		return "admin/donation_finish.tiles";
	}
	
	/**
	 * 전체 커뮤니티글 목록
	 */
	@RequestMapping("allcommunity.do")
	public String communityRequest() {
		return "admin/allcommunity.tiles";
	}
	
	/**
	 * 커뮤니티 카테고리 관리
	 */
	@RequestMapping("communitycategory.do")
	public String communityCategoryRequest() {
		return "admin/cmcategory.tiles";
	}

}