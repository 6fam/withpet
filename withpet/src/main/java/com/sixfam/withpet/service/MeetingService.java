package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

public interface MeetingService {

	/**
	 * 모임 참가자 확인 메서드
	 * @param id
	 * @param boardNo
	 * @return
	 */
	public boolean isAttenderMember(String id, int boardNo);

	/**
	 * 모임 등록 메서드
	 * @param meetingDTO
	 */
	public void registerMeeting(MeetingDTO meetingDTO);

	/**
	 * 댓글 등록 메서드
	 * @param rdto
	 */
	public void registerReply(ReplyDTO rdto);

	/**
	 * 
	 * @param boardNo
	 * @return
	 */
	public MemberDTO findMemberInfoByBoradNo(int boardNo);

	/**
	 * 모임 찾는 메서드
	 * @param boardNo
	 * @return
	 */
	public MeetingDTO findMeetingByBoardNo(int boardNo);

	/**
	 * 모임 타입에 따른 총 개설수 확인 메서드
	 * @param categoryNo
	 * @return
	 */
	public int findMeetingCountByCategory(int categoryNo);
	
	/**
	 * 개설된 모임 총 갯수 확인 메서드
	 * @return
	 */
	public int getMeetingCount();

	/**
	 * 모임에 등록된 댓글 갯수 확인 메서드
	 * @param boardNo
	 * @return
	 */
	public int getReplyCount(int boardNo);

	/**
	 * 모임 상세 보기 메서드
	 * @param boardNo
	 * @return
	 */
	public MeetingDTO getMeetingDetailByBoardNo(int boardNo);
	
	/**
	 * 모든 모임을 조회하는 메서드
	 * @param pb
	 * @return
	 */
	public List<MeetingDTO> getAllMeetingList(PagingBean pb);
	
	/**
	 * 카테고리 이름에 따른 카테고리 번호 얻는 메서드
	 * @param category
	 * @return
	 */
	public int getCategoryNoByCategory(String category);

	/**
	 * 게시된 모임 글 하나에 대한 모든 댓글 조회 메서드
	 * @param boardNo
	 * @return
	 */
	public List<ReplyDTO> getReplyList(int boardNo);
	
	/**
	 * 게설자의 모임에 참여한 참여자 확인 메서드
	 * @param boardNo
	 * @return
	 */
	public List<MemberDTO> getMyMeetingAttender(int boardNo);

	/**
	 * 카테고리 번호에 따른 모든 모임 조회하는 메서드
	 * @param pb
	 * @param categoryNo
	 * @return
	 */
	public List<MeetingDTO> getAllMeetingListByCategory(PagingBean pb, int categoryNo);
	
	/**
	 * 모임 삭제하는 메서드
	 * @param boardNo
	 */
	public void removeMeetingInfo(int boardNo);
	
	/**
	 * 댓글 삭제하는 메서드
	 * @param replyNo
	 */
	public void removeReply(int replyNo);
}
