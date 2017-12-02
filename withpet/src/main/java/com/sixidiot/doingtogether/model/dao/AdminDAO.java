package com.sixidiot.doingtogether.model.dao;

import java.util.List;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.model.dto.DonationDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;

public interface AdminDAO {
	//회원 관련 DAO
	List<MemberDTO>  totalMemberList(PagingBean pagingBean);
	List<MemberDTO> allRoleMemberList(PagingBean pagingBean);
	List<MemberDTO> allRoleStandby(PagingBean pagingBean);
	List<MemberDTO> allRoleDogmomList(PagingBean pagingBean);
	int allRoleMemberTotalCount();
	int allRoleStandbyTotalCount();


	
	//게시판 관련 DAO
	List<BoardDTO> allBoardList(PagingBean pagingBean);
	List<BoardDTO> boardTypeList(PagingBean pagingBean,int categoryNo);
	List<BoardDTO> allMeetingList(PagingBean pagingBean);

	List<BoardDTO> allCareList();

	List<BoardDTO> allShareMarketList();

	List<MemberDTO> tierMemberList();

	////Tier Except
	void insertTierExcept(MemberDTO memberDTO);
	////Tier Member
	void insertTierMember(MemberDTO memberDTO);
	////Tier Standby
	void insertTierStandby(MemberDTO memberDTO);
	////Tier Dogmom
	void insertTierDogmom(MemberDTO memberDTO);
	////Tier Admin
	void insertTierAdmin(MemberDTO memberDTO);

	void deleteMemberTier(MemberDTO memberDTO);
	////Tier List
	List<MemberDTO> allTierList();

	int allMemberCount();
	int allRoleDogmomTotalCount();
	int allBoardListCount();
	int boardListCount(int categoryNo);
	int meetingBoardListCount();
	
	////모금함
	List<DonationDTO> allDonationList(PagingBean pagingBean);
	List<DonationDTO> applyDonationList(PagingBean pagingBean);
	void acceptDonation(int boardNo);


}