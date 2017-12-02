package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminDAO {
	//회원 관련 DAO
	List<MemberDTO>  getTotalMemberList(PagingBean pagingBean);
	List<MemberDTO> getAllRoleMemberList(PagingBean pagingBean);
	List<MemberDTO> getAllRoleStandby(PagingBean pagingBean);
	List<MemberDTO> getAllRoleDogmomList(PagingBean pagingBean);
	int getAllRoleMemberTotalCount();
	int getAllRoleStandbyTotalCount();


	
	//게시판 관련 DAO
	List<BoardDTO> getAllBoardList(PagingBean pagingBean);
	List<BoardDTO> getBoardTypeList(PagingBean pagingBean,int categoryNo);
	List<BoardDTO> getAllMeetingList(PagingBean pagingBean);

	List<BoardDTO> getAllCareList();

	List<BoardDTO> getAllShareMarketList();

	List<MemberDTO> getTierMemberList();

	////Tier Except
	void registerTierExcept(MemberDTO memberDTO);
	////Tier Member
	void registerTierMember(MemberDTO memberDTO);
	////Tier Standby
	void registerTierStandby(MemberDTO memberDTO);
	////Tier Dogmom
	void registerTierDogmom(MemberDTO memberDTO);
	////Tier Admin
	void registerTierAdmin(MemberDTO memberDTO);

	void removeMemberTier(MemberDTO memberDTO);
	////Tier List
	List<MemberDTO> getAllTierList();

	int getAllMemberCount();
	int getAllRoleDogmomTotalCount();
	int getAllBoardListCount();
	int getBoardListCount(int categoryNo);
	int getMeetingBoardListCount();
	
	////모금함
	List<DonationDTO> getAllDonationList(PagingBean pagingBean);
	List<DonationDTO> getApplyDonationList(PagingBean pagingBean);
	void setAcceptDonation(int boardNo);


}