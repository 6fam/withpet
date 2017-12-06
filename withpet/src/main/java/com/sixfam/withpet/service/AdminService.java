package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminService {

	//전체회원 관리 서비스
	public ListDTO<MemberDTO> getAllMemberList(int pageNo);
	public ListDTO<MemberDTO> getAllRoleMemberList(int pageNo);
	public ListDTO<MemberDTO> getAllRoleDogmomList(int pageNo);
	public ListDTO<MemberDTO> getAllRoleStandby(int pageNo);

	//일반회원관리 탈퇴
	public void removeManagerMember(MemberDTO memberDTO);
	//견주 일반회원으로 강등
	public void removeManagerDogmom(MemberDTO memberDTO);

	//모임 전체 리스트
	public ListDTO<BoardDTO> getAllMeetingList(int pageNo);



	//allTierList
	public List<MemberDTO> getAllTierList();
	
	public void setMemberTier(MemberDTO memberDTO);
	
	public void setManagerDogmomPermit(MemberDTO memberDTO);
	//모금함 관리
	public ListDTO<DonationDTO> getAllDonationList();
	public ListDTO<DonationDTO> getApplyDonationList();
	public void setAcceptDonation(int boardNo);
}