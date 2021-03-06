package com.sixfam.withpet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.DateDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;
import com.sixfam.withpet.service.CommonService;
import com.sixfam.withpet.service.MeetingService;
import com.sixfam.withpet.upload.UploadFileImage;

@Controller
public class MeetingController {

	@Resource
	MeetingService service;
	
	@Resource
	CommonService common;
	
	  
	@Secured("ROLE_DOGMOM")
	@RequestMapping(value = "registerMeeting.do", method = RequestMethod.POST)
	public String registerMeetingRequest(HttpServletRequest request, Authentication authentication, MeetingDTO meeting, DateDTO date) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		UploadFileImage<MeetingDTO> upload = new UploadFileImage<MeetingDTO>();
		upload.setImageUpload(request, meeting);
		// 카테고리 넘버 받아오는 코드 작성
		meeting.setCategoryNo(service.getCategoryNoByCategory(meeting.getCategoryName()));
		   
		meeting.setId(mdto.getId());
		meeting.setPlace(meeting.getPlace() +" "+ meeting.getDetailPlace());
		
		meeting.setDate(date);
		
		if(meeting.getPlace().equals("null null"))
			meeting.setPlace("협의");
		
		try {
			Date gatheringStartDate; // 모입 접수 시작일
			Date gatheringEndDate;	// 모임 접수 끝일
			Date currentDate; // 현재날짜 Date

			String oTime = ""; // 현재날짜


			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );

			Date currentTime = new Date();
			oTime = mSimpleDateFormat.format ( currentTime ); //현재시간 (String)
			
			gatheringStartDate = mSimpleDateFormat.parse( meeting.getDate().getGatheringStart() );
			gatheringEndDate = mSimpleDateFormat.parse( meeting.getDate().getGatheringEnd() );
			currentDate =  mSimpleDateFormat.parse( oTime );
			
			int compareStart = currentDate.compareTo( gatheringStartDate ); // 날짜비교
			int compareEnd = currentDate.compareTo( gatheringEndDate ); // 날짜비교

			if(compareStart< 0 && compareEnd < 0)
				meeting.setCategoryStateNo(25);
			else if( compareStart < 0 && compareEnd > 0)
				meeting.setCategoryStateNo(27);
			else
				meeting.setCategoryStateNo(26);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		service.registerMeeting(meeting);
		
		return "redirect:home.do";
	
	}//registerMeeting 매서드
	
	/**
	 * 메인페이지 모임 리스트
	 */
	@RequestMapping("ajaxHome.do")
	@ResponseBody
	public List<MeetingDTO> scrollByAjaxRequest(Model model, int pageNo) {
		int meetingCount = service.getMeetingCount();
		PagingBean pb = null;
		
		if(pageNo==0)
			pb = new PagingBean(12, meetingCount);
		else
			pb = new PagingBean(pageNo, 12, 0, meetingCount);
		List<MeetingDTO> list = service.getAllMeetingList(pb); 
		System.out.println(list);
		
		return list;
	}
	
	
	/**
	 * 모임 상세페이지
	 */
	@RequestMapping("meetingDetail.do")
	public String meetingDetailRequest(HttpServletRequest request, HttpServletResponse response, Authentication authentication,
			String boardNo, Model model) {
		try {
			int bnum = Integer.parseInt(boardNo);
			
			MemberDTO member = (MemberDTO) authentication.getPrincipal();
			//조회수 증가
			common.addHits(request, response, member.getId(), boardNo);
			
			MeetingDTO meetingDTO = service.getMeetingDetailByBoardNo(bnum);
			MemberDTO memberDTO = service.findMemberInfoByBoradNo(bnum);
			
			int totalCount = meetingDTO.getPeopleCount();
			int attendCount = service.getPossibleCount(bnum);
			int possibleCount = totalCount-attendCount;
			
			//문제
			boolean flag=service.isAttenderMember(member.getId(), bnum);
			
			if(possibleCount > 0)
				meetingDTO.setPossibleCount(possibleCount);
			
			model.addAttribute("flag", flag);
			model.addAttribute("meetingDetailDTO", meetingDTO);
			model.addAttribute("memberDetailDTO", memberDTO);
			
			return "meeting_detail.tiles";
		}catch(NullPointerException e){
			e.printStackTrace();
			return "layout/body/error";
		}
	}
	
	
	/**
	 * 모임 참여 등록
	 */
	@RequestMapping("meetingAttend.do")
	public String meetingAttendRequest(int boardNo, Model model,Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();

		//내 아이디가 해당게시글에 참여했는지 확인
		boolean flag = service.isAttenderMember(mdto.getId(), boardNo);
		
		int attendCount = service.getPossibleCount(boardNo);
		int peopleCount = service.getPeopleCountByBoardNo(boardNo);		
		int possibleCount  = peopleCount - attendCount;
				
		if (flag==false) {
			return "redirect:meetingAttendFail.do?boardNo="+boardNo;
		}
		else {
			if(possibleCount > 0) {
				service.addAttenderMember(mdto.getId(), boardNo);
				return "redirect:meetingAttendOk.do?boardNo="+boardNo;
			}
			return "redirect:meetingAttendOver.do?boardNo="+boardNo;
		}
	}
	
	@RequestMapping("meetingAttendFail.do")
	public String meetingAttendFail(Model model, int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "meeting_attend_fail.tiles";
	}
	
	@RequestMapping("meetingAttendOk.do")
	public String meetingAttendOk(Model model, int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "meeting_attend_ok.tiles";
	}
	
	@RequestMapping("meetingAttendOver.do")
	public String meetingAttendOver(Model model, int boardNo) {
		model.addAttribute("boardNo", boardNo);
		return "meetingAttendOver.tiles";
	}
	
	
	/**
	 * 모임 폐쇄
	 */
	@RequestMapping("meeting_delete.do")
	public String deleteMeetingRequest(int boardNo) {
		
		service.removeMeetingInfo(boardNo);
		
		return "home.tiles";
	}
	
	/**
	 * 모임 참여 취소
	 */
	@RequestMapping("meetingAttendCancel.do")
	public String meetingAttendCancelRequest(int boardNo, Model model, Authentication authentication) {
		MemberDTO mdto = (MemberDTO)authentication.getPrincipal();
		service.removeAttenderMember(mdto.getId(), boardNo);
		return "redirect:meetingDetail.do?boardNo="+boardNo;
	}
	
	/**
	 * 모임 수정
	 */
	@RequestMapping("meeting_update.do")
	public String updateMeetingRequest(Model model, int boardNo) {
		
		MeetingDTO meetingDTO = service.findMeetingByBoardNo(boardNo);
		
		model.addAttribute("meetingDTO", meetingDTO);
		
		return "meeting_update.tiles";
	}
	
	
	/**
	 * 카테고리 별 리스트 ajax
	 */
	@RequestMapping("ajaxCategory.do")
	@ResponseBody
	public List<MeetingDTO> scrollByCategoryByAjaxRequest(Model model, int pageNo, int categoryNo) {
		int meetingCount = service.findMeetingCountByCategory(categoryNo);
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
	public String meetingListByCategoryNoRequest(Model model, int categoryNo) {
		System.out.println("////////Controller////////");
		int meetingCountByCategory = service.findMeetingCountByCategory(categoryNo);
		PagingBean pb = new PagingBean(12, meetingCountByCategory);

		List<MeetingDTO> list = service.getAllMeetingListByCategory(pb, categoryNo);
		System.out.println("////list 가져오기 //// ");
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
	public String insertReplyRequest(ReplyDTO rdto, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		rdto.setId(mdto.getId());
		
		// insert 매서드
		service.registerReply(rdto);
		
		return "ok";
	}
	
	/**
	 * 게시판 글번호에 대한 댓글 조회
	 * @param replyDTO 게시판 번호 얻을 DTO
	 * @return 댓글 리스트
	 */
	@RequestMapping("listJson.do")
    @ResponseBody // 리턴데이터를 json으로 변환(생략가능)
    public List<ReplyDTO> listJsonRequest(int boardNo, String boardId, Authentication authentication){
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
        List<ReplyDTO> list = service.getReplyList(boardNo);
        for(ReplyDTO l : list) {
        	if(l.getImgPath()==null)
        		l.setImgPath("dog_profile2.png");
        	
        	//삭제버튼처리
        	if(l.getId().equals(mdto.getId()))
        		l.setFlag(true);
        	else if(boardId.equals(mdto.getId()))
        		l.setFlag(true);
        	else
        		l.setFlag(false);
        }
        return list;
    }
	
	/*
	 * 댓글 삭제
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value = "deleteReply.do", method=RequestMethod.POST)
	@ResponseBody
	public void deleteReplyRequest(Authentication authentication, int replyNo) {
		service.removeReply(replyNo);
	}
	
	@RequestMapping("meetingAttenderList.do")
	public String meetingAttenderListRequest(int boardNo,Model model) {
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("atlist",service.getMyMeetingAttender(boardNo));
		return "popup/popup.tiles";
	}
	
	@RequestMapping("replyCount.do")
	@ResponseBody
	public int replyCountRequest(int boardNo) {
		return service.getReplyCount(boardNo);
	}
	
	@RequestMapping(value = "exceptAttend.do", method = RequestMethod.POST)
	@ResponseBody
	public String removeAttendByFounder(String id, String boardNo) {
		service.removeAttendByFounder(id, Integer.parseInt(boardNo));
		
		return id;
	}
	
	@RequestMapping(value="registerLike.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean registerLike(int boardNo, String id) {
		service.registerLike(boardNo, id);
		
		return true;
	}
	
	@RequestMapping(value="deleteLike.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean deleteLike(int boardNo, String id) {
		service.deleteLike(boardNo, id);
		
		return true;
	}
	
	
}
