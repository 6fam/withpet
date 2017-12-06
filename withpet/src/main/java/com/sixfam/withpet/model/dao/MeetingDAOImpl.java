package com.sixfam.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

@Repository
public class MeetingDAOImpl implements MeetingDAO {

	@Resource
	SqlSessionTemplate template;

	@Override
	public int getCategoryNoByCategory(String category) {
		return template.selectOne("meeting.getCategoryNoByCategory", category);
	}

	@Override
	public int getMeetingCount() {
		return template.selectOne("meeting.getMeetingCount");
	}

	//**************** 모임 등록 시작 ****************
	@Override
	public void registerBoard(MeetingDTO meetingDTO) {
		template.insert("meeting.insertBoard", meetingDTO);
	}
	
	@Override
	public void registerGatheringdate(MeetingDTO meetingDTO) {
		template.insert("meeting.insertGathertingdate", meetingDTO.getDate());
	}
	
	@Override
	public void registerImg(MeetingDTO meetingDTO) {
		template.insert("meeting.insertImg", meetingDTO.getImgPath());
	}
	
	@Override
	public void registerMeeting(MeetingDTO meetingDTO) {
		template.insert("meeting.insertMeeting", meetingDTO);
	}
	
	@Override
	public void registerMeetingType(MeetingDTO meetingDTO) {
		template.insert("meeting.insertMeetingType", meetingDTO.getCategoryNo());
	}
	//**************** 모임 등록 끝 ****************
	
	@Override
	public MemberDTO isAttender(String id, int boardNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo", boardNo);
		return template.selectOne("meeting.checkingAttender", param);
	}

	@Override
	public void addAttenderMember(String id, int boardNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo", boardNo);
		template.insert("meeting.attenderMember", param);
	}

	@Override
	public MeetingDTO findDetailByBoardNo(int boardNo) {
		return template.selectOne("meeting.selectDetailByBoardNo", boardNo);
	}

	@Override
	public void removeAttenderByBoardNo(int boardNo) {
		template.delete("meeting.deleteAttenderByBoardNo", boardNo);
	}

	@Override
	public void removeSympathyByBoardNo(int boardNo) {
		template.delete("meeting.deleteSympathyByBoardNo", boardNo);
	}

	@Override
	public void removeBoardByBoardNo(int boardNo) {
		template.delete("meeting.deleteBoardByBoardNo", boardNo);
	}

	@Override
	public void removeGatheringDateByBoardNo(int dateNo) {
		template.delete("meeting.deleteGatheringDateByBoardNo", dateNo);
	}

	@Override
	public void removeImgByBoardNo(int imgNo) {
		template.delete("meeting.deleteImgByBoardNo", imgNo);
	}

	@Override
	public List<MemberDTO> getMyMeetingAttender(int boardNo) {
		return template.selectList("meeting.myMeetingAttender", boardNo);
	}

	@Override
	public MemberDTO findMemberInfoByBoradNo(int boardNo) {
		return template.selectOne("meeting.getMemberInfoByBoradNo", boardNo);
	}

	@Override
	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("startRowNumber", pb.getStartRowNumber());
		param.put("endRowNumber", pb.getEndRowNumber());
		param.put("categoryNo", categoryNo);
		return template.selectList("meeting.getMeetingSearchByCategoryType", param);
	}

	@Override
	public int getMeetingCountByCategory(int categoryNo) {
		return template.selectOne("meeting.getMeetingCountByCategory", categoryNo);
	}

	@Override
	public void removeReply(int replyNo) {
		template.delete("meeting.deleteReply", replyNo);
	}

	@Override
	public int getReplyCount(int boardNo) {
		return template.selectOne("meeting.replyCount", boardNo);
	}

	@Override
	public List<MeetingDTO> getAllMeetingList(PagingBean pb) {
		return template.selectList("meeting.getAllMeetingList", pb);
	}

	@Override
	public MeetingDTO getMeetingDetailByBoardNo(int boardNo) {
		return template.selectOne("meeting.getMeetingDetailByBoardNo", boardNo);
	}

	@Override
	public void registerReply(ReplyDTO rdto) {
		template.insert("meeting.insertReply", rdto);
	}

	@Override
	public List<ReplyDTO> getReplyList(int boardNo) {
		return template.selectList("meeting.selectReply", boardNo);
	}

	@Override
	public MeetingDTO findMeetingByBoardNo(int boardNo) {
		return template.selectOne("meeting.getMeetingDetailByBoardNo", boardNo);
	}
	
	@Override
	public void removeAttenderMember(String id, int boardNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo", boardNo);
		template.delete("meeting.removeAttenderMember", param);
	}

	@Override
	public void setAttendCount(int boardNo) {
		template.update("meeting.setAttendCount", boardNo);
	}

	@Override
	public int getPossibleCount(int boardNo) {
		return template.selectOne("meeting.getPossibleCount", boardNo);
	}

	@Override
	public void setMeetingState(HashMap<String, Object> param) {
		System.out.println("DAO setMeetingState");
		template.update("meeting.setMeetingState", param);
	}

	@Override
	public void removeAttendByFounder(String id, int boardNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo", boardNo);
		template.delete("meeting.removeAttendByFounder", param);
	}
	
}
