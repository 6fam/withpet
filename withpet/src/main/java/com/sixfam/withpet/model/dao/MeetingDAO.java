package com.sixfam.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

public interface MeetingDAO{
	
	public void registerBoard(MeetingDTO meetingDTO);
	
	public void registerGatheringdate(MeetingDTO meetingDTO);
	
	public void registerImg(MeetingDTO meetingDTO);
	
	public void registerMeeting(MeetingDTO meetingDTO);
	
	public void registerMeetingType(MeetingDTO meetingDTO);
	
	public void registerReply(ReplyDTO rdto);

	public void addAttenderMember(String id, int boardNo);

	public MemberDTO isAttender(String id, int boardNo);

	public MemberDTO findMemberInfoByBoradNo(int boardNo);

	public MeetingDTO findDetailByBoardNo(int boardNo);

	public MeetingDTO findMeetingByBoardNo(int boardNo);

	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo);
	
	public List<MemberDTO> getMyMeetingAttender(int boardNo);

	public MeetingDTO getMeetingDetailByBoardNo(int boardNo);

	public List<MeetingDTO> getAllMeetingList(PagingBean pb);
	
	public List<ReplyDTO> getReplyList(int boardNo);
	
	public int getMeetingCountByCategory(int categoryNo);

	public int getCategoryNoByCategory(String category);

	public int getMeetingCount();
	
	public int getReplyCount(int boardNo);
	
	public void removeAttenderByBoardNo(int boardNo);

	public void removeSympathyByBoardNo(int boardNo);

	public void removeBoardByBoardNo(int boardNo);

	public void removeGatheringDateByBoardNo(int dateNo);

	public void removeImgByBoardNo(int imgNo);

	public void removeReply(int replyNo);

	public void removeAttenderMember(String id, int boardNo);
	
	public void setAttendCount(int boardNo);

	public int getPossibleCount(int boardNo);

	void setMeetingState(HashMap<String, Object> param);

	public void removeAttendByFounder(String id, int boardNo);
}
