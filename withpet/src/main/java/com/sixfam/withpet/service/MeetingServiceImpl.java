package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.MeetingDAO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

@Service
public class MeetingServiceImpl implements MeetingService{
	
	@Resource
	MeetingDAO dao;

	@Override
	public int getMeetingCount() {
		return dao.getMeetingCount();
	}
	
	@Override
	public List<MeetingDTO> getAllMeetingList(PagingBean pb) {
		return dao.getAllMeetingList(pb);
	}

	@Override
	public int getCategoryNoByCategory(String category) {
		return dao.getCategoryNoByCategory(category);
	}
	@Override
	
	public void insertMeeting(MeetingDTO meetingDTO) {
		dao.registerMeeting(meetingDTO);
	}

	@Override
	public MeetingDTO getMeetingDetailByBoardNo(int boardNo) {
		return dao.getMeetingDetailByBoardNo(boardNo);
	}

	@Override
	public boolean attenderMember(String id, int boardNo) {
		MemberDTO memberId=dao.isAttender(id, boardNo);
		if(memberId==null) {
			dao.addAttenderMember(id, boardNo);
			return true;
		}
		else {
			System.out.println("이미 참여를 하고 있습니니다");
			return false;
		}
	}
	
	@Transactional
	@Override
	public void deleteMeetingInfo(int boardNo) {
		MeetingDTO meeting=dao.findDetailByBoardNo(boardNo);
		System.out.println(meeting);
		int imgNo=meeting.getImgNo();
		//System.out.println("imgNO : "+imgNo);
		int dateNo=meeting.getDate().getDateNo();
		//System.out.println("dateNo : "+dateNo);
		dao.removeAttenderByBoardNo(boardNo);
		dao.removeSympathyByBoardNo(boardNo);
		dao.removeBoardByBoardNo(boardNo);
		dao.removeImgByBoardNo(imgNo);
		dao.removeGatheringDateByBoardNo(dateNo);
	}
	
	@Override
	public void insertReply(ReplyDTO rdto) {
		dao.registerReply(rdto);
	}

	@Override
	public List<ReplyDTO> selectReply(int boardNo) {
		return dao.getReplyList(boardNo);
	}

	@Override
	public List<MemberDTO> myMeetingAttender(int boardNo) {
		return dao.getMyMeetingAttender(boardNo);
	}

	@Override
	public MemberDTO getMemberInfoByBoradNo(int boardNo) {
		return dao.findMemberInfoByBoradNo(boardNo);
	}

	@Override
	public MeetingDTO selectMeetingByBoardNo(int boardNo) {
		return dao.findMeetingByBoardNo(boardNo);
	}

	@Override
	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo) {
		return dao.getAllMeetingListByCategory(pb, categoryNo);
	}

	@Override
	public int getMeetingCountByCategory(int categoryNo) {
		return dao.getMeetingCountByCategory(categoryNo);
	}
	
	@Override
	public void deleteReply(int replyNo) {
		dao.removeReply(replyNo);
	}
	@Override
	public int replyCount(int boardNo) {
		return dao.getReplyCount(boardNo);
	}
}
