package com.sixfam.withpet.controller;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.AdminService;
import com.sixfam.withpet.service.CommunityService;
import com.sixfam.withpet.service.MeetingService;
import com.sixfam.withpet.service.MemberService;

@Controller
public class AdminController {
	
	@Resource
	AdminService adminService;
	 
	@Resource
	MeetingService meetingService;
	 
	@Resource
	CommunityService communityService;
	 
	@Resource
	MemberService memberService;
	
	/**
	 * 전체회원관리(총회원)
	 */
	@RequestMapping("allmember.do")
	public String allMemberRequest(Model model, int pageNo) {
		model.addAttribute("allMember",adminService.getAllMemberList(pageNo));
		model.addAttribute("tier", adminService.getAllTierList());
		return "admin/allmember.tiles";
	}
	/**
	 * 전체회원관리(회원 등급 수정)
	 */
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "managertierupdate.do", method = RequestMethod.POST)
	public String managerTierUpdateRequest(Model model, MemberDTO memberDTO) {
		adminService.setMemberTier(memberDTO);
		return "redirect:/allmember.do";
	}
	/**
	 * 일반회원관리(회원)
	 */
	@RequestMapping("normalmember.do")
	public String normalMemberRequest(Model model,int pageNo) {
		model.addAttribute("normalMember",adminService.getAllRoleMemberList(pageNo));
		return "admin/normalmember.tiles";
	}
	
	/**
	 * 예비주인 관리(견주대기자)
	 */
	@RequestMapping("yebimommy.do")
	public String yebiDogMommyRequest(Model model,int pageNo) {
		model.addAttribute("yebilist",adminService.getAllRoleStandbyList(pageNo));
		return "admin/yebimommy.tiles";
	}
	/**
	 * 예비주인 관리(견주 승인)
	 */
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "managerdogmompermit.do" , method = RequestMethod.POST)
	public String managerDogmomPermitRequest(Model model, MemberDTO memberDTO) {
		adminService.setManagerDogmomPermit(memberDTO);
		return "redirect:yebimommy.do";
	}
	/**
	 * 댕댕이주인 관리(견주)
	 */
	@RequestMapping("dogmommy.do")
	public String dogMommyRequest(Model model,int pageNo) {
		model.addAttribute("dogmomlist",adminService.getAllRoleDogmomList(pageNo));
		return "admin/dogmommy.tiles";
	}
	/**
	 * 댕댕이주인 관리(견주 강등)
	 */
	@Secured("ROLE_MANAGER")
	@RequestMapping(value ="managerdogmomdelete.do", method = RequestMethod.POST)
	public String managerDogmomDeleteRequest(Model model, MemberDTO memberDTO) {
		adminService.removeManagerDogmom(memberDTO);
		return "redirect:dogmommy.do";
	}
	/**
	 * 관리자 관리(관리자)
	 */
	@RequestMapping("manager.do")
	public String managerRequest(Model model,int pageNo) {
		model.addAttribute("managerlist",adminService.getAllRoleManager(pageNo));
		return "admin/manager.tiles";
	}
	
	/**
	 * 탈퇴회원관리(탈퇴자 & 강퇴자)
	 */
	@RequestMapping("exceptmember.do")
	public String exceptMemberRequest(Model model,int pageNo) {
		model.addAttribute("excepterlist",adminService.getAllRoleExceptList(pageNo));
		return "admin/exceptmember.tiles";
	}
	
	/**
	 * 모임관리
	 */
	@RequestMapping("allmeeting.do")
	public String allMeetingRequest(Model model,int pageNo) {
		model.addAttribute("meetinglist",adminService.getAllMeetingList(pageNo));
		return "admin/allmeeting.tiles";
	}
	/**
	 * 모임관리(모임폐쇠)
	 */
	   @Secured("ROLE_MANAGER")
	   @RequestMapping(value="managerDeleteMeeting.do", method=RequestMethod.POST)
	   public String managerDeleteMeetingRequest(Model model,int boardNo) {
		   meetingService.removeMeetingInfo(boardNo);
		   return "redirect:allmeeting.do";
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
	public String allDonationRequest(Model model) {
		int pageNo=1;
		model.addAttribute("dolist",adminService.getAllDonationList(pageNo));
		return "admin/alldonation.tiles";
	}

	/**
	 * 모금함대기
	 */
	@RequestMapping("donationwait.do")
	public String donationWaitRequest(Model model) {
		int categoryNo=28;
		int pageNo=1;
		model.addAttribute("dolist",adminService.getDonationListPerState(pageNo, categoryNo));
		return "admin/donation_wait.tiles";
	}


	/**
	 * 모금중
	 */
	@RequestMapping("donatting.do")
	public String donationListRequest(Model model) {
		int categoryNo=29;
		int pageNo=1;
		model.addAttribute("dolist",adminService.getDonationListPerState(pageNo, categoryNo));
		return "admin/donatting.tiles";
	}
	
	/**
	 * 모금마감
	 */
	@RequestMapping("donationfinish.do")
	public String donationFinishRequest(Model model) {
		int categoryNo=30;
		int pageNo=1;
		model.addAttribute("dolist",adminService.getDonationListPerState(pageNo, categoryNo));
		return "admin/donation_finish.tiles";
	}
	/**
	 * 모금함 상태 변경
	 */
	@RequestMapping("donationstatechange.do")
	public String donationStateChangeRequest(Model model,int boardNo,int categoryNo) {
		adminService.setDonationStateChange(boardNo, categoryNo);
		return "redirect:alldonation.do";
	}
	
	/**
	 * 커뮤니티글 (전체)
	 */
	@RequestMapping("allcommunity.do")
	public String communityRequest(Model model) {
		int pageNo=1;
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		model.addAttribute("comlist",adminService.getAllCommunityList(pageNo));
		return "admin/allcommunity.tiles";
	}
	
	/**
	 * 커뮤니티 카테고리 관리
	 */
	@RequestMapping("communitycategory.do")
	public String communityCategoryRequest(Model model) {
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		return "admin/cmcategory.tiles";
	}

	/**
	 * 커뮤니티 (카테고리별 목록)
	 */
	@RequestMapping("activecommunity.do")
	public String communityActiveRequest(Model model, int categoryNo,String categoryName,int pageNo) {
		model.addAttribute("titletype",categoryName);
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		model.addAttribute("cmulist",communityService.getCommunityListPerCategory(categoryNo,pageNo));
		return "admin/activecommunity.tiles";
	}
	
	/**
	 * 커뮤니티 (삭제하기)
	 */
	@RequestMapping("removecommunity.do")
	public String removeCommunityRequest(int boardNo) {
		communityService.removeCommunityInfo(boardNo);
		return "redirect:allcommunity.do";
	}
	
	/**
	 * 커뮤니티 타입 목록
	 */
	@RequestMapping("communitytype.do")
	public String communityTypeRequest(Model model) {
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		return "community.tiles";
	}
	/**
	 * 커뮤니티 타입 추가
	 */
	@RequestMapping("addcommunitytype.do")
	public String addCommunityTypeRequest(Model model,String categoryName) {
		 adminService.registerAddCommunityType(categoryName);
		return "redirect:communitycategory.do";
	}
	/**
	 * 커뮤니티 타입 삭제
	 */
	@RequestMapping("deleteCommunityType.do")
	public String removeCommunityTypeRequest(Model model,int categoryNo) {
		adminService.removeCommunityType(categoryNo);
		return "redirect:communitycategory.do";
	}
	/**
	 * 일반회원관리(회원-개설내역)
	 */
	@RequestMapping("adminmypageopened.do")
	public String getAdminMypageOpened(String id,Model model) {
		int pageNo=1;
		model.addAttribute("listdto", memberService.getSetupListById(id, pageNo));
		return "mypage_opened.tiles";
	}
	/**
	 * 일반회원관리(회원-참여내역)
	 */
	@RequestMapping("adminmypageparticipate.do")
	public String getAdminMypageParticipate(String id,Model model) {
		int pageNo=1;
		model.addAttribute("listdto", memberService.getAttenderHistoryListById(id, pageNo));
		return "mypage_participate.tiles";
	}
}