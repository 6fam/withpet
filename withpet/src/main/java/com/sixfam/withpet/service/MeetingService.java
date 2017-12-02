package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

public interface MeetingService {

	public boolean isAttenderMember(String id, int boardNo);

	public void registerMeeting(MeetingDTO meetingDTO);

	public void registerReply(ReplyDTO rdto);

	public MemberDTO findMemberInfoByBoradNo(int boardNo);

	public MeetingDTO findMeetingByBoardNo(int boardNo);

	public int findMeetingCountByCategory(int categoryNo);
	
	public int getMeetingCount();

	public int getReplyCount(int boardNo);

	public MeetingDTO getMeetingDetailByBoardNo(int boardNo);
	
	public List<MeetingDTO> getAllMeetingList(PagingBean pb);
	
	public int getCategoryNoByCategory(String category);

	public List<ReplyDTO> getReplyList(int boardNo);
	
	public List<MemberDTO> getMyMeetingAttender(int boardNo);

	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo);
	
	public void removeMeetingInfo(int boardNo);
	
	public void removeReply(int replyNo);
}
