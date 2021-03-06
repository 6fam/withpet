package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminDAO {
	//회원 관련 DAO
	/**
	 * 전체 회원 리스트
	 */
	public List<MemberDTO> getAllMemberList(PagingBean pagingBean);
	/**
	 * 일반회원 리스트
	 */
	public List<MemberDTO> getAllRoleMemberList(PagingBean pagingBean);
	/**
	 * 예비 주인 리스트
	 */
	public List<MemberDTO> getAllRoleStandby(PagingBean pagingBean);
	/**
	 * 댕댕이주인님 리스트
	 */
	public List<MemberDTO> getAllRoleDogmomList(PagingBean pagingBean);
	
	/**
	 * 탈퇴회원 리스트
	 */
	public List<MemberDTO> getAllRoleExceptList(PagingBean pagingBean);
	/**
	 * 관리자 등급 리스트
	 */
	public List<MemberDTO> getAllRoleManagerList(PagingBean pagingBean);
	
	/**
	 * 전체회원 인원 수 카운트
	 */
	public int getTotalCountAllMember();
	/**
	 * 회원 등급별 인원 수 카운트
	 */
	public int getTotalCountPerTier(int categoryNo);
	
	/**
	 *게시판 카테고리별 총 수 
	 */
	public int getBoardCountPerCategory(int categoryNo);
	/**
	 * 전체 모임 리스트
	 */
	public List<MeetingDTO> getAllMeetingList(PagingBean pagingBean);
	/**
	 * 커뮤니티 (전체)
	 */
	public List<BoardDTO> getAllCommunityList(PagingBean pagingBean);

	////Tier Except
	public void registerTierExcept(MemberDTO memberDTO);
	////Tier Member
	public void registerTierMember(MemberDTO memberDTO);
	////Tier Standby
	public void registerTierStandby(MemberDTO memberDTO);
	////Tier Dogmom
	public void registerTierDogmom(MemberDTO memberDTO);
	////Tier Admin
	public void registerTierAdmin(MemberDTO memberDTO);

	public void removeMemberTier(MemberDTO memberDTO);
	////Tier List
	public List<MemberDTO> getAllTierList();


	
	/**
	 * 모금함 리스트
	 */
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean);
	
	/**
	 * 모금함 리스트(모집 상태별)
	 */
	
	public List<DonationDTO> getDonationListPerState (PagingBean pagingBean,int categoryNo);
	
	/**
	 * 모금함 상태변경 
	 */
	public void setDonationStateChange(int boardNo,int categoryNo);
	/**
	 * 견주 승인 날짜 업데이트
	 */
	public void setDogmomPermitDate(MemberDTO memberDTO);
	/**
	 * 커뮤니티 타입 추가
	 */
	public void registerAddCommunityType(String categoryName);
	/**
	 * 커뮤니티 타입 삭제
	 */
	public void removeCommunityType(int categoryNo);
	public void removeCommunityTypeBoard(int categoryNo);
	
	public int getAllCommunityCount();

	

	


}