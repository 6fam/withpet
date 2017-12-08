package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminService {

	/**
	 * 회원 관리 (전체)
	 */
	public ListDTO<MemberDTO> getAllMemberList(int pageNo);
	
	/**
	 * 회원 관리 (회원등급)
	 */
	public List<MemberDTO> getAllTierList();
	
	/**
	 * 회원 관리  (일반회원)
	 */
	public ListDTO<MemberDTO> getAllRoleMemberList(int pageNo);
	
	/**
	 * 회원 관리  (댕댕이주인 )
	 */
	public ListDTO<MemberDTO> getAllRoleDogmomList(int pageNo);
	
	/**
	 * 회원 관리 (댕댕이주인-강등)
	 */
	public void removeManagerDogmom(MemberDTO memberDTO);

	
	/**
	 * 회원 관리  (예비주인)
	 */
	public ListDTO<MemberDTO> getAllRoleStandbyList(int pageNo);
	
	/**
	 * 회원 관리 (탈퇴회원)
	 */
	public ListDTO<MemberDTO> getAllRoleExceptList(int pageNo);
	
	/**
	 * 관리자 리스트
	 */
	public ListDTO<MemberDTO> getAllRoleManager(int pageNo);
	
	
/*	public void removeManagerMember(MemberDTO memberDTO);*/
	

	/**
	 * 모임 관리 (전체)
	 */
	public ListDTO<MeetingDTO> getAllMeetingList(int pageNo);


	
	/**
	 * 모금함 관리 (전체)
	 */
	public ListDTO<DonationDTO> getAllDonationList(int pageNo);
	
	/**
	 * 모금함 관리 (모금함 상태별 리스트)
	 */
	public ListDTO<DonationDTO> getDonationListPerState (int pageNo, int categoryNo);
	
	/**
	 * 모금함 관리 (모금함 상태 변경)
	 */
	public void setDonationStateChange (int boardNo, int categoryNo);
	
	/**
	 * 커뮤니티 (전체)
	 */
	public ListDTO<BoardDTO> getAllCommunityList(int pageNo);
	
	/**
	 * 회원 회원 등급 변경
	 */
	public void setMemberTier(MemberDTO memberDTO);
	
	public void setManagerDogmomPermit(MemberDTO memberDTO);
	

	/**
	 * 커뮤니티 (타입 추가)
	 */
	public void registerAddCommunityType(String categoryName);
	/**
	 *커뮤니티 (타입삭제) 
	 */
	public void removeCommunityType(int categoryNo);

}