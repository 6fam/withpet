package com.sixfam.withpet.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.MeetingDAO;
import com.sixfam.withpet.model.dto.DateDTO;
import com.sixfam.withpet.model.dto.LikeDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

@Service
public class MeetingServiceImpl implements MeetingService{
	
	@Resource
	MeetingDAO dao;

	@Override
	@Transactional
	public int getMeetingCount() {
		return dao.getMeetingCount();
	}
	
	@Override
	@Transactional
	public List<MeetingDTO> getAllMeetingList(PagingBean pb) {
		return dao.getAllMeetingList(pb);
	}

	@Override
	@Transactional
	public int getCategoryNoByCategory(String category) {
		return dao.getCategoryNoByCategory(category);
	}
	
	@Override
	@Transactional
	public void registerMeeting(MeetingDTO meetingDTO) {
		dao.registerBoard(meetingDTO);
		dao.registerGatheringdate(meetingDTO);
		dao.registerImg(meetingDTO);
		dao.registerMeeting(meetingDTO);
		dao.registerMeetingType(meetingDTO);
	}

	@Override
	@Transactional
	public MeetingDTO getMeetingDetailByBoardNo(int boardNo) {
		return dao.getMeetingDetailByBoardNo(boardNo);
	}

	@Override
	@Transactional
	public boolean isAttenderMember(String id, int boardNo) {
		MemberDTO memberId=dao.isAttender(id, boardNo);
		if(memberId==null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	@Transactional
	public void removeMeetingInfo(int boardNo) {
		MeetingDTO meeting=dao.findDetailByBoardNo(boardNo);
		int imgNo=meeting.getImgNo();
		int dateNo=meeting.getDate().getDateNo();
		dao.removeAttenderByBoardNo(boardNo);
		dao.removeSympathyByBoardNo(boardNo);
		dao.removeBoardByBoardNo(boardNo);
		dao.removeImgByBoardNo(imgNo);
		dao.removeGatheringDateByBoardNo(dateNo);
	}
	
	@Override
	@Transactional
	public void registerReply(ReplyDTO rdto) {
		dao.registerReply(rdto);
	}

	@Override
	@Transactional
	public List<ReplyDTO> getReplyList(int boardNo) {
		return dao.getReplyList(boardNo);
	}

	@Override
	@Transactional
	public List<MemberDTO> getMyMeetingAttender(int boardNo) {
		return dao.getMyMeetingAttender(boardNo);
	}

	@Override
	@Transactional
	public MemberDTO findMemberInfoByBoradNo(int boardNo) {
		return dao.findMemberInfoByBoradNo(boardNo);
	}

	@Override
	public MeetingDTO findMeetingByBoardNo(int boardNo) {
		return dao.findMeetingByBoardNo(boardNo);
	}

	@Override
	@Transactional
	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo) {
		List<MeetingDTO> list=dao.getAllMeetingListByCategory(pb, categoryNo);
		return list;
	}

	@Override
	@Transactional
	public int findMeetingCountByCategory(int categoryNo) {
		return dao.getMeetingCountByCategory(categoryNo);
	}
	
	@Override
	@Transactional
	public void removeReply(int replyNo) {
		dao.removeReply(replyNo);
	}
	
	@Override
	@Transactional
	public int getReplyCount(int boardNo) {
		return dao.getReplyCount(boardNo);
	}
	
	@Override
	public void removeAttenderMember(String id, int boardNo) {
		dao.removeAttenderMember(id, boardNo);
	}

	@Override
	public int getPossibleCount(int boardNo) {
		return dao.getPossibleCount(boardNo);
	}
	
	@Override
	@Transactional
	public void setMeetingState(int categoryNo) {
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy.MM.dd");
		String today=formatter.format(new Date());
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("categoryNo", categoryNo);
		param.put("today", today);
		dao.setMeetingState(param);
	}

	@Override
	public void removeAttendByFounder(String id, int boardNo) {
		dao.removeAttendByFounder(id, boardNo);
	}

	@Override
	public List<LikeDTO> getLikeById(String id) {
		return dao.getLikeById(id);
	}

	@Override
	public void addAttenderMember(String id, int boardNo) {
		dao.addAttenderMember(id, boardNo);
	}

	@Override
	public int getPeopleCountByBoardNo(int boardNo) {
		return dao.getPeopleCountByBoardNo(boardNo);
	}

	@Override
	public void registerLike(int boardNo, String id) {
		dao.registerLike(boardNo, id);
	}

	@Override
	public void deleteLike(int boardNo, String id) {
		dao.deleteLike(boardNo, id);
	}

	@Override
	public int getLikeCountByIdAndBoardNo(LikeDTO likeDTO) {
		return dao.getLikeCountByIdAndBoardNo(likeDTO);
	}

	/**
	 * 모집중 모집대기 카테고리 번호 알아오는 메서드
	 */
	@Override
	public int getCategoryStateNoByDate(DateDTO date) {
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy.MM.dd");
		String today=formatter.format(new Date());
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("date", date);
		param.put("today", today);
		return dao.getCategoryStateNoByDate(param);
	}

}
