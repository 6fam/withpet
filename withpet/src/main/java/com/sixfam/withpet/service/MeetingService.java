package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

public interface MeetingService {

	int getMeetingCount();

	List<MeetingDTO> getAllMeetingList(PagingBean pb);
	
	int getCategoryNoByCategory(String category);

	void insertMeeting(MeetingDTO meetingDTO);

	MeetingDTO getMeetingDetailByBoardNo(int boardNo);
	
	boolean attenderMember(String id, int boardNo);

	void deleteMeetingInfo(int boardNo);

	void insertReply(ReplyDTO rdto);

	List<ReplyDTO> selectReply(int boardNo);

	List<MemberDTO> myMeetingAttender(int boardNo);

	MemberDTO getMemberInfoByBoradNo(int boardNo);

	MeetingDTO selectMeetingByBoardNo(int boardNo);

	List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo);

	int getMeetingCountByCategory(int categoryNo);
	
	void deleteReply(int replyNo);

	int replyCount(int boardNo);
}
