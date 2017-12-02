package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminService {

	//전체회원 관리 서비스
	ListDTO<MemberDTO> totalMemberList(int pageNo);
	ListDTO<MemberDTO> allRoleMemberList(int pageNo);
	ListDTO<MemberDTO> allRoleDogmomList(int pageNo);
	ListDTO<MemberDTO> allRoleStandby(int pageNo);

	//일반회원관리 탈퇴
	void managerMemberDelete(MemberDTO memberDTO);
	//견주 일반회원으로 강등
	void managerDogmomDelete(MemberDTO memberDTO);

	//게시판 관리 서비스
	ListDTO<BoardDTO> allBoardList(int pageNo);
	ListDTO<BoardDTO> boardTypeList(int pageNo,int categoryNo);
	ListDTO<BoardDTO> allMeetingList(int pageNo);

	List<BoardDTO> allCareList();

	List<BoardDTO> allShareMarketList();

	//allTierList
	List<MemberDTO> allTierList();
	
	void memberTierUpdate(MemberDTO memberDTO);
	
	void managerDogmomPermit(MemberDTO memberDTO);
	//모금함 관리
	ListDTO<DonationDTO> allDonationList();
	ListDTO<DonationDTO> applyDonationList();
	void acceptDonation(int boardNo);
}