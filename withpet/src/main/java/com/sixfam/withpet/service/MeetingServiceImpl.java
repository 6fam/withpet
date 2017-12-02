package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.BoardDAO;
import com.sixfam.withpet.model.dao.MeetingDAO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

@Service
public class MeetingServiceImpl implements MeetingService{

	@Resource
	BoardDAO<MeetingDTO> boardDAO;
	
	@Resource
	MeetingDAO dao;

	@Override
	public int getMeetingCount() {
		return dao.getMeetingCount();
	}
	
	@Override
	public List<MeetingDTO> getAllMeetingList(PagingBean pb) {
		return boardDAO.selectList("meeting.getAllMeetingList", pb);
	}

	@Override
	public int getCategoryNoByCategory(String category) {
		return dao.getCategoryNoByCategory(category);
	}
	@Override
	
	public void insertMeeting(MeetingDTO meetingDTO) {
		dao.insertMeeting(meetingDTO);
	}

	@Override
	public MeetingDTO getMeetingDetailByBoardNo(int boardNo) {
		return boardDAO.selectOne("meeting.getMeetingDetailByBoardNo", boardNo);
	}

	@Override
	public boolean attenderMember(String id, int boardNo) {
		MemberDTO memberId=dao.checkingAttender(id, boardNo);
		if(memberId==null) {
			dao.attenderMember(id, boardNo);
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
		MeetingDTO meeting=dao.selectDetailByBoardNo(boardNo);
		System.out.println(meeting);
		int imgNo=meeting.getImgNo();
		//System.out.println("imgNO : "+imgNo);
		int dateNo=meeting.getDate().getDateNo();
		//System.out.println("dateNo : "+dateNo);
		dao.deleteAttenderByBoardNo(boardNo);
		dao.deleteSympathyByBoardNo(boardNo);
		dao.deleteBoardByBoardNo(boardNo);
		dao.deleteImgByBoardNo(imgNo);
		dao.deleteGatheringDateByBoardNo(dateNo);
	}
	
	@Override
	public void insertReply(ReplyDTO rdto) {
		boardDAO.insertReply("meeting.insertReply", rdto);
	}

	@Override
	public List<ReplyDTO> selectReply(int boardNo) {
		return boardDAO.selectReply("meeting.selectReply", boardNo);
	}

	@Override
	public List<MemberDTO> myMeetingAttender(int boardNo) {
		return dao.myMeetingAttender(boardNo);
	}

	@Override
	public MemberDTO getMemberInfoByBoradNo(int boardNo) {
		return dao.getMemberInfoByBoradNo(boardNo);
	}

	@Override
	public MeetingDTO selectMeetingByBoardNo(int boardNo) {
		return boardDAO.selectOne("meeting.getMeetingDetailByBoardNo", boardNo);
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
		dao.deleteReply(replyNo);
	}
	@Override
	public int replyCount(int boardNo) {
		return dao.replyCount(boardNo);
	}
}
