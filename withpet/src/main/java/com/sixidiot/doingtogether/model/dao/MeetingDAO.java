package com.sixidiot.doingtogether.model.dao;

import java.util.List;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dto.MeetingDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;

public interface MeetingDAO extends BoardDAO<MeetingDTO>{

	int getCategoryNoByCategory(String category);

	int getMeetingCount();
	
	void insertMeeting(MeetingDTO meetingDTO);

	void attenderMember(String id, int boardNo);
	
	void deleteAttenderByBoardNo(int boardNo);

	void deleteSympathyByBoardNo(int boardNo);

	void deleteBoardByBoardNo(int boardNo);

	void deleteGatheringDateByBoardNo(int dateNo);

	void deleteImgByBoardNo(int imgNo);

	MeetingDTO selectDetailByBoardNo(int boardNo);

	MemberDTO checkingAttender(String id, int boardNo);

	List<MemberDTO> myMeetingAttender(int boardNo);

	MemberDTO getMemberInfoByBoradNo(int boardNo);

	List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo);

	int getMeetingCountByCategory(int categoryNo);

	void deleteReply(int replyNo);

	int replyCount(int boardNo);
}
