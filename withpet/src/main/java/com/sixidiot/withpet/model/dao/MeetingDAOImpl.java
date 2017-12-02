package com.sixidiot.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.MeetingDTO;
import com.sixidiot.withpet.model.dto.MemberDTO;

@Repository
public class MeetingDAOImpl extends BoardDAOImpl<MeetingDTO> implements MeetingDAO {

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
	
	@Override
	public void insertMeeting(MeetingDTO meetingDTO) {
		template.insert("meeting.insertBoard", meetingDTO);
		template.insert("meeting.insertGathertingdate", meetingDTO.getDate());
		template.insert("meeting.insertImg", meetingDTO.getImgPath());
		template.insert("meeting.insertMeeting", meetingDTO);
		template.insert("meeting.insertMeetingType",meetingDTO.getCategoryNo());
	}
	/*
	 * 모임 참여한 여부 확인	
	 */
	@Override
	public MemberDTO checkingAttender(String id,int boardNo) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo", boardNo);
		return template.selectOne("meeting.checkingAttender",param);
	}
/*
 *	모임 참여하기 
 */
	@Override
	public void attenderMember(String id,int boardNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("boardNo",boardNo);
		template.insert("meeting.attenderMember",param);
	}
	
	/*
	 * 모임 dateNo, imgNo 조회
	 */
	@Override
	public MeetingDTO selectDetailByBoardNo(int boardNo) {
		return template.selectOne("meeting.selectDetailByBoardNo", boardNo);
	}
	/*
	 * 모임 참여 내역 삭제
	 */
	@Override
	public void deleteAttenderByBoardNo(int boardNo) {
		template.delete("meeting.deleteAttenderByBoardNo", boardNo);
	}
	/*
	 * 모임 공감 내역 삭제
	 */
	@Override
	public void deleteSympathyByBoardNo(int boardNo) {
		template.delete("meeting.deleteSympathyByBoardNo", boardNo);
	}
	/*
	 * 모임 게시글 삭제
	 */
	@Override
	public void deleteBoardByBoardNo(int boardNo) {
		template.delete("meeting.deleteBoardByBoardNo", boardNo);
	}
	/*
	 * 모임 날짜 삭제
	 */
	@Override
	public void deleteGatheringDateByBoardNo(int dateNo) {
		template.delete("meeting.deleteGatheringDateByBoardNo", dateNo);
	}
	/*
	 * 모임 이미지 삭제
	 */
	@Override
	public void deleteImgByBoardNo(int imgNo) {
		template.delete("meeting.deleteImgByBoardNo", imgNo);
	}
	/*
	 * 모임 참여자 관리
	 */
	@Override
	public List<MemberDTO> myMeetingAttender(int boardNo) {
		return template.selectList("meeting.myMeetingAttender", boardNo);
	}
	
	@Override
	public MemberDTO getMemberInfoByBoradNo(int boardNo) {
		return template.selectOne("meeting.getMemberInfoByBoradNo", boardNo);
	}

	@Override
	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("pb", pb);
		param.put("categoryNo", categoryNo);
		template.insert("meeting.attenderMember",param);
		return template.selectList("meeting.getMeetingSearchByCategoryType", param);
	}

	@Override
	public int getMeetingCountByCategory(int categoryNo) {
		return template.selectOne("meeting.getMeetingCountByCategory", categoryNo);
	}
	
	/*
	 * 댓글삭제
	 */
	@Override
	public void deleteReply(int replyNo) {
		template.delete("meeting.deleteReply", replyNo);
	}
	
	@Override
	public int replyCount(int boardNo) {
		System.out.println("/////////////repl dao ");
		System.out.println(boardNo);
		int count=template.selectOne("meeting.replyCount", boardNo);
		System.out.println("count"+count);
		return template.selectOne("meeting.replyCount", boardNo);
	}
}
