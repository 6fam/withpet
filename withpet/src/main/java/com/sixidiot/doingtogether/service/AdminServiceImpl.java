package com.sixidiot.doingtogether.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dao.AdminDAO;
import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.model.dto.DonationDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDAO adminDAO;
	
	@Override
	public ListDTO<MemberDTO> totalMemberList(int pageNo) {
		int totalCount=adminDAO.allMemberCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.totalMemberList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<MemberDTO> allRoleMemberList(int pageNo) {
		int totalCount=adminDAO.allRoleMemberTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.allRoleMemberList(pagingBean), pagingBean);
	}


	@Override
	public ListDTO<MemberDTO> allRoleDogmomList(int pageNo) {
		int totalCount=adminDAO.allRoleDogmomTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.allRoleDogmomList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<MemberDTO> allRoleStandby(int pageNo) {
		int totalCount=adminDAO.allRoleStandbyTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		//List<MemberDTO> list =adminDAO.allRoleStandby(pagingBean);
		//ListDTO<MemberDTO> list=  new ListDTO<MemberDTO>(adminDAO.allRoleDogmomList(pagingBean), pagingBean);
		//System.out.println("서비스"+list);
		return new ListDTO<MemberDTO>(adminDAO.allRoleStandby(pagingBean), pagingBean);
	}

	
	@Override	
	public ListDTO<BoardDTO> allBoardList(int pageNo){
		int totalCount=adminDAO.allBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.allBoardList(pagingBean), pagingBean);
	}

	@Override
	public ListDTO<BoardDTO> boardTypeList(int pageNo,int categoryNo) {
		int totalCount=adminDAO.boardListCount(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.boardTypeList(pagingBean,categoryNo), pagingBean);
	}

	@Override
	public List<BoardDTO> allCareList() {
		return adminDAO.allCareList();
	}

	@Override
	public List<BoardDTO> allShareMarketList() {
		return adminDAO.allShareMarketList();
	}

	@Transactional
	@Override
	public void memberTierUpdate(MemberDTO memberDTO) {
		int categoryNo=memberDTO.getCategoryNo();
		switch (categoryNo) {
		case 28://견주대기자 등록
				adminDAO.deleteMemberTier(memberDTO);
				adminDAO.insertTierStandby(memberDTO);
				break;
		case 29://견주 등록
				adminDAO.deleteMemberTier(memberDTO);
				adminDAO.insertTierDogmom(memberDTO);
				break;
		case 30://관리자등록
				adminDAO.deleteMemberTier(memberDTO);
				adminDAO.insertTierAdmin(memberDTO);
				break;
		case 26 ://탈퇴회원등록
				adminDAO.deleteMemberTier(memberDTO);
				adminDAO.insertTierExcept(memberDTO);
				break;
		default://회원등록
				adminDAO.deleteMemberTier(memberDTO);
				adminDAO.insertTierMember(memberDTO);
				break;
		}
	}
	@Override
	public List<MemberDTO> allTierList() {
		List<MemberDTO> totalTierList=adminDAO.allTierList();
		for (int i = 0; i < totalTierList.size(); i++) {
			switch (totalTierList.get(i).getCategoryName()) {
			case "ROLE_STANDBY":
				totalTierList.get(i).setCategoryName("견주대기자");
				break;
			case "ROLE_DOGMOM":
				totalTierList.get(i).setCategoryName("견주");
				break;
			case "ROLE_ADMIN":
				totalTierList.get(i).setCategoryName("관리자");
				break;
			case "ROLE_EXCEPT":
				totalTierList.get(i).setCategoryName("탈퇴회원");
				break;
			default:
				totalTierList.get(i).setCategoryName("일반회원");
				break;
			}//switch
		}
		return totalTierList;
	}

	@Transactional
	@Override
	public void managerMemberDelete(MemberDTO memberDTO) {
			adminDAO.deleteMemberTier(memberDTO);
			adminDAO.insertTierExcept(memberDTO);
	}

	@Override
	public void managerDogmomDelete(MemberDTO memberDTO) {
			adminDAO.deleteMemberTier(memberDTO);
			adminDAO.insertTierMember(memberDTO);
	}

	@Override
	public void managerDogmomPermit(MemberDTO memberDTO) {
			adminDAO.deleteMemberTier(memberDTO);
			adminDAO.insertTierDogmom(memberDTO);
	}

	@Override
	public ListDTO<BoardDTO> allMeetingList(int pageNo) {
		int totalCount=adminDAO.meetingBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.allMeetingList(pagingBean), pagingBean);
	}

	@Override
	public ListDTO<DonationDTO> allDonationList() {
		int totalCount=10;
		int pageNo=1;
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		ListDTO<DonationDTO> list=new ListDTO<DonationDTO>(adminDAO.allDonationList(pagingBean), pagingBean);
		//return new ListDTO<DonationDTO>(adminDAO.allDonationList(pagingBean), pagingBean);
		return list;
	}
	@Override
	public ListDTO<DonationDTO> applyDonationList() {
		int totalCount=10;
		int pageNo=1;
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		ListDTO<DonationDTO> list=new ListDTO<DonationDTO>(adminDAO.applyDonationList(pagingBean), pagingBean);
		return list;
	}

	@Override
	public void acceptDonation(int boardNo) {
		adminDAO.acceptDonation(boardNo);
	}
	
}
