package com.sixfam.withpet.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.AdminService;
import com.sixfam.withpet.service.DonationService;
import com.sixfam.withpet.service.MeetingService;

@Controller
public class AdminController {
   
   @Resource
   AdminService adminService;
   
   @Resource
   MeetingService meetingService;
   
   @Resource
   DonationService donationService;
	/*
	* **************************************회원관리**************************************
	*/
	//전체회원관리
	@RequestMapping("manager_allmember.do")
	public String managerAllMemberPageRequest(Model model, int pageNo) {
		ListDTO<MemberDTO> list = adminService.totalMemberList(pageNo);
		List<MemberDTO> tier = adminService.allTierList();
		model.addAttribute("amemberList", list);
		model.addAttribute("tier", tier);
		return "manager_allmember.tiles";
	}
	
	//일반회원관리
	@RequestMapping("manager_member.do")
	public String managerMemberPageRequest(Model model, int pageNo) {
		ListDTO<MemberDTO> list = adminService.allRoleMemberList(pageNo);
		model.addAttribute("mlist", list);
		return "manager_member.tiles";
	}
	
	//견주 회원관리
	@Secured("ROLE_MANAGER")
	@RequestMapping("manager_petowner.do")
	public String managerPetOwnerPageRequest(Model model, Authentication authentication, int pageNo) {
		ListDTO<MemberDTO> list = adminService.allRoleDogmomList(pageNo);
		model.addAttribute("dogmomlist", list);
		return "manager_petowner.tiles";
	}
	
	//견주대기자 회원관리
	@RequestMapping("manager_ownerwaiting.do")
	public String managerOwnerWaitingRequest(Model model, int pageNo) {
		ListDTO<MemberDTO> list = adminService.allRoleStandby(pageNo);
		model.addAttribute("standbylist", list);
		return "manager_ownerwaiting.tiles";
	}
	
	//회원등급 업데이트
	@Secured("ROLE_MANAGER")
	@RequestMapping(value = "managertierupdate.do", method = RequestMethod.POST)
	public String managerTierUpdateRequest(Model model, Authentication authentication, MemberDTO memberDTO) {
		adminService.memberTierUpdate(memberDTO);
		return "redirect:manager_allmember.do?pageNo=1";
	}

	//견주탈퇴
	@Secured("ROLE_MANAGER")
	@RequestMapping("managermemberdelete.do")
	public String managerMemberDeleteRequest(Model model, MemberDTO memberDTO) {
		adminService.managerMemberDelete(memberDTO);
		return "redirect:manager_member.do?pageNo=1";
	}

	//견주강등
	@Secured("ROLE_MANAGER")
	@RequestMapping("managerdogmomdelete.do")
	public String managerDogmomDeleteRequest(Model model, MemberDTO memberDTO, Authentication authentication) {
		adminService.managerDogmomDelete(memberDTO);
		return "redirect:manager_petowner.do?pageNo=1";
	}

	//견주승인
	@Secured("ROLE_MANAGER")
	@RequestMapping("managerdogmompermit.do")
	public String managerDogmomPermitRequest(Model model, MemberDTO memberDTO, Authentication authentication) {
		adminService.managerDogmomPermit(memberDTO);
		return "redirect:manager_ownerwaiting.do?pageNo=1";
	}
	
	//미팅 참여하기
	@RequestMapping("mypage_myattenders.do")
	public String myMeetingManagerRequest(Model model, int pageNo) {
		return "mypage_management.tiles";
	}
 /*
  * **************************************게시물관리**************************************
 */	
   
    //전체 게시글 관리
   @RequestMapping("manager_allboard.do")
   public String managerAllBoardPageRequest(Model model, int pageNo) {
	   model.addAttribute("ablist",adminService.allBoardList(pageNo));
      return "manager_allboard.tiles";
   }
   
/*   
    * 미팅게시글 관리
   @RequestMapping("manager_meeting.do")
   public String managerMeetingBoard(Model model,int pageNo) {
	   int categoryNo=1;
	   model.addAttribute("ablist",adminService.allMeetingList(pageNo,categoryNo));
	   return "manager_meeting.tiles";
   }
   
    * 돌보미게시글 관리
   @RequestMapping("manager_carer.do")
   public String managerCarerBoard(Model model,int pageNo) {
	   int categoryNo=2;
	   model.addAttribute("ablist",adminService.allMeetingList(pageNo,categoryNo));
	   return "manager_carer.tiles";
   }
   
    * 나눔마켓게시글 관리
   @RequestMapping("manager_sharemarket.do")
   public String managerShareMarketBoard(Model model,int pageNo) {
	   int categoryNo=3;
	   model.addAttribute("ablist",adminService.allMeetingList(pageNo,categoryNo));
	   return "manager_sharemarket.tiles";
   }
 */ 
/*   
   //타입별 게시글 목록
   @RequestMapping("manager_boardtype.do")
   public String managerBoardType(Model model,int pageNo,int categoryNo) {
	   String path=null;
	   switch (categoryNo) {
	   case 1 : 
		   model.addAttribute("ablist",adminService.allMeetingList(pageNo));
		   path="manager_meeting.tiles";
		   break;
	   case 2 : 
		   model.addAttribute("ablist",adminService.boardTypeList(pageNo,2));
		   path="manager_carer.tiles";
		   break;
	   case 3 : 
		   model.addAttribute("ablist",adminService.boardTypeList(pageNo,3));
		   path="manager_sharemarket.tiles";
		   break;
	   }
	   return path;
   }
   */
   //모임 폐쇄
   @Secured("ROLE_MANAGER")
   @RequestMapping(value="managerDeleteMeeting.do", method=RequestMethod.POST)
   public String managerDeleteMeetingRequest(Model model,Authentication authentication,int boardNo) {
	   meetingService.deleteMeetingInfo(boardNo);
	   return "redirect:manager_boardtype.do?pageNo=1&categoryNo=1";
   }
   
   /*
    * **************************************모금함관리**************************************
   */	
   //전체 모금함 관리
  @RequestMapping("manager_alldonation.do")
  public String managerAllDonationPageRequest(Model model) {
	  model.addAttribute("dlist", adminService.allDonationList());
	  return "manager_alldonation.tiles";
  }
  //신청 모금함 관리
  @RequestMapping("manager_acceptDonationList.do")
  public String managerAcceptDonationListRequest(Model model) {
	  model.addAttribute("dlist",adminService.applyDonationList());
	  return "manager_applydonationlist.tiles";
  }
  //모금함 승인
  @RequestMapping("manager_acceptDonation.do")
  public String managerAcceptDonationRequest(Model model,int boardNo) {
	  adminService.acceptDonation(boardNo);
	  return "redirect:manager_acceptDonationList.do";
	  
  }
}