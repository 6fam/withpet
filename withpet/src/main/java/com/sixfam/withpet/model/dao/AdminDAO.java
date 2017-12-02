package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface AdminDAO {
	//회원 관련 DAO
	public List<MemberDTO>  getTotalMemberList(PagingBean pagingBean);
	public List<MemberDTO> getAllRoleMemberList(PagingBean pagingBean);
	public List<MemberDTO> getAllRoleStandby(PagingBean pagingBean);
	public List<MemberDTO> getAllRoleDogmomList(PagingBean pagingBean);
	public int getAllRoleMemberTotalCount();
	public int getAllRoleStandbyTotalCount();


	
	//게시판 관련 DAO
	public List<BoardDTO> getAllBoardList(PagingBean pagingBean);
	public List<BoardDTO> getBoardTypeList(PagingBean pagingBean,int categoryNo);
	public List<BoardDTO> getAllMeetingList(PagingBean pagingBean);

	public List<BoardDTO> getAllCareList();

	public List<BoardDTO> getAllShareMarketList();

	public List<MemberDTO> getTierMemberList();

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

	public int getAllMemberCount();
	public int getAllRoleDogmomTotalCount();
	public int getAllBoardListCount();
	public int getBoardListCount(int categoryNo);
	public int getMeetingBoardListCount();
	
	////모금함
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean);
	public List<DonationDTO> getApplyDonationList(PagingBean pagingBean);
	public void setAcceptDonation(int boardNo);


}