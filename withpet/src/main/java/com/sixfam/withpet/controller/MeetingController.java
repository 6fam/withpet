package com.sixfam.withpet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sixfam.withpet.download.UploadFileImage;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.DateDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;
import com.sixfam.withpet.service.CommonService;
import com.sixfam.withpet.service.MeetingService;

@Controller
public class MeetingController {

	@Resource
	MeetingService service;
	
	@Resource
	CommonService common;
	
	
	@Secured("ROLE_DOGMOM")
	@RequestMapping(value = "registerMeeting.do", method = RequestMethod.POST)
	public String registerMeeting(HttpServletRequest request, Authentication authentication, MeetingDTO meeting, DateDTO date) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		UploadFileImage<MeetingDTO> upload = new UploadFileImage<MeetingDTO>();
		upload.setImageUpload(request, meeting);
		// 카테고리 넘버 받아오는 코드 작성
		meeting.setCategoryNo(service.getCategoryNoByCategory(meeting.getCategoryName()));
		meeting.setId(mdto.getId());
		meeting.setPlace(meeting.getPlace() +" "+ meeting.getDetailPlace());
		// 협의 클릭 시 nullnull 값 입력 -> 협의로 변경
		if(meeting.getPlace().equals("null null"))
			meeting.setPlace("협의");
		
		meeting.setDate(date);
		service.insertMeeting(meeting);
		
		return "redirect:home.do";
	
	}//registerMeeting 매서드
	
	/**
	 * 메인페이지 모임 리스트
	 */
	@RequestMapping("ajaxHome.do")
	@ResponseBody
	public List<MeetingDTO> scrollByAjax(Model model, int pageNo) {
		int meetingCount = service.getMeetingCount();
		PagingBean pb = null;
		
		if(pageNo==0)
			pb = new PagingBean(12, meetingCount);
			
		else
			pb = new PagingBean(pageNo, 12, 0, meetingCount);
		
		return service.getAllMeetingList(pb);
	}
	
	
	/**
	 * 모임 상세페이지
	 */
	@RequestMapping("meetingDetail.do")
	public String meetingDetail(HttpServletRequest request, HttpServletResponse response, Authentication authentication,
			String boardNo, Model model) {
		try {
			
			MemberDTO member = (MemberDTO) authentication.getPrincipal();
			//조회수 증가
			common.hits(request, response, member.getId(), boardNo);
			
			//System.out.println(boardNo);
			MeetingDTO meetingDTO = service.getMeetingDetailByBoardNo(Integer.parseInt(boardNo));
			MemberDTO memberDTO = service.getMemberInfoByBoradNo(Integer.parseInt(boardNo));
			
			model.addAttribute("meetingDetailDTO", meetingDTO);
			model.addAttribute("memberDetailDTO", memberDTO);
			//System.out.println(meetingDTO.getDate().getGatheringStart());
			//System.out.println(meetingDTO.getDate().getGatheringEnd());
			
			return "meeting_detail.tiles";
		}catch(NullPointerException e){
			e.printStackTrace();
			return "layout/body/error";
		}
	}
	
	/**
	 * 모임 등록
	 */
	@RequestMapping("meetingAttend.do")
	public String meetingAttend(int boardNo, Model model,Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		boolean flag=service.attenderMember(mdto.getId(), boardNo);
		model.addAttribute("boardNo",boardNo);
		if (flag==false) {
			return "meeting_attend_fail.tiles";
		}
		else
			return "meeting_attend_ok.tiles";
	}
	
	
	/**
	 * 모임 폐쇄
	 */
	@RequestMapping("meeting_delete.do")
	public String deleteMeeting(int boardNo) {
		
		service.deleteMeetingInfo(boardNo);
		
		return "home.tiles";
	}
	
	
	/**
	 * 모임 수정
	 */
	@RequestMapping("meeting_update.do")
	public String updateMeeting(Model model, int boardNo) {
		
		MeetingDTO meetingDTO = service.selectMeetingByBoardNo(boardNo);
		
		model.addAttribute("meetingDTO", meetingDTO);
		
		return "meeting_update.tiles";
	}
	
	
	/**
	 * 카테고리 별 리스트 ajax
	 */
	@RequestMapping("ajaxCategory.do")
	@ResponseBody
	public List<MeetingDTO> scrollByCategoryByAjax(Model model, int pageNo, int categoryNo) {
		int meetingCount = service.getMeetingCountByCategory(categoryNo);
		PagingBean pb = null;
		
		if(pageNo==0)
			pb = new PagingBean(12, meetingCount);
			
		else
			pb = new PagingBean(pageNo, 12, 0, meetingCount);
		
		return service.getAllMeetingListByCategory(pb, categoryNo);
	}
	
	
	/**
	 * 모임 카테고리 별 리스트 보여주기
	 */
	@RequestMapping("meeting.do")
	public String meetingListByCategoryNo(Model model, int categoryNo) {
		
		int meetingCountByCategory = service.getMeetingCountByCategory(categoryNo);
		PagingBean pb = new PagingBean(12, meetingCountByCategory);

		List<MeetingDTO> list = service.getAllMeetingList(pb);
		ListDTO<MeetingDTO> meetingListDTO = new ListDTO<MeetingDTO>(list, pb);
		
		model.addAttribute("meetingList", meetingListDTO);
		
		return "meeting.tiles";
	}
	
	
	/**
	 * 모임 게시판 댓글 insert
	 */
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@RequestMapping(value="insertReply.do", method=RequestMethod.POST)
	public String insertReply(ReplyDTO rdto, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		rdto.setId(mdto.getId());
		
		// insert 매서드
		service.insertReply(rdto);
		
		return "ok";
	}
	
	/**
	 * 게시판 글번호에 대한 댓글 조회
	 * @param replyDTO 게시판 번호 얻을 DTO
	 * @return 댓글 리스트
	 */
	@RequestMapping("listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<ReplyDTO> listJson(ReplyDTO replyDTO){
        List<ReplyDTO> list = service.selectReply(replyDTO.getBoardNo());
        return list;
    }
	
	/*
	 * 댓글 삭제
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value = "deleteReply.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteReply(Authentication authentication, int replyNo) {
		System.out.println("//////////////CareController : replyNo////////////"+replyNo);
		service.deleteReply(replyNo);
		System.out.println("/////////////댓삭!!!!//////////////");
		return "gg";
	}
	
	@RequestMapping("meetingAttenderList.do")
	public String meetingAttenderList(int boardNo,Model model) {
		model.addAttribute("atlist",service.myMeetingAttender(boardNo));
		return "popup/popup.tiles";
	}
	
	@RequestMapping("replyCount.do")
	@ResponseBody
	public int replyCount(int boardNo) {
		System.out.println("///////////리플카운트 : "+service.replyCount(boardNo));
		return service.replyCount(boardNo);
	}
}
