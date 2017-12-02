package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.WithPet;
import com.sixfam.withpet.model.dao.AdminDAO;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDAO adminDAO;
	
	@Override
	public ListDTO<MemberDTO> totalMemberList(int pageNo) {
		int totalCount=adminDAO.getAllMemberCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getTotalMemberList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<MemberDTO> allRoleMemberList(int pageNo) {
		int totalCount=adminDAO.getAllRoleMemberTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleMemberList(pagingBean), pagingBean);
	}


	@Override
	public ListDTO<MemberDTO> allRoleDogmomList(int pageNo) {
		int totalCount=adminDAO.getAllRoleDogmomTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleDogmomList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<MemberDTO> allRoleStandby(int pageNo) {
		int totalCount=adminDAO.getAllRoleStandbyTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		//List<MemberDTO> list =adminDAO.allRoleStandby(pagingBean);
		//ListDTO<MemberDTO> list=  new ListDTO<MemberDTO>(adminDAO.allRoleDogmomList(pagingBean), pagingBean);
		//System.out.println("서비스"+list);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleStandby(pagingBean), pagingBean);
	}

	
	@Override	
	public ListDTO<BoardDTO> allBoardList(int pageNo){
		int totalCount=adminDAO.getAllBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getAllBoardList(pagingBean), pagingBean);
	}

	@Override
	public ListDTO<BoardDTO> boardTypeList(int pageNo,int categoryNo) {
		int totalCount=adminDAO.getBoardListCount(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getBoardTypeList(pagingBean,categoryNo), pagingBean);
	}

	@Override
	public List<BoardDTO> allCareList() {
		return adminDAO.getAllCareList();
	}

	@Override
	public List<BoardDTO> allShareMarketList() {
		return adminDAO.getAllShareMarketList();
	}

	@Transactional
	@Override
	public void memberTierUpdate(MemberDTO memberDTO) {
		int categoryNo=memberDTO.getCategoryNo();
		switch (categoryNo) {
		case WithPet.ROLE_STANDBY : //견주대기자 등록
				adminDAO.removeMemberTier(memberDTO);
				adminDAO.registerTierStandby(memberDTO);
				break;
		case WithPet.ROLE_DOGMOM : //견주 등록
				adminDAO.removeMemberTier(memberDTO);
				adminDAO.registerTierDogmom(memberDTO);
				break;
		case WithPet.ROLE_MANAGER : //관리자등록
				adminDAO.removeMemberTier(memberDTO);
				adminDAO.registerTierAdmin(memberDTO);
				break;
		case WithPet.ROLE_EXCEPT : //탈퇴회원등록
				adminDAO.removeMemberTier(memberDTO);
				adminDAO.registerTierExcept(memberDTO);
				break;
		default://회원등록
				adminDAO.removeMemberTier(memberDTO);
				adminDAO.registerTierMember(memberDTO);
				break;
		}
	}
	@Override
	public List<MemberDTO> allTierList() {
		List<MemberDTO> totalTierList=adminDAO.getAllTierList();
		for (int i = 0; i < totalTierList.size(); i++) {
			switch (totalTierList.get(i).getCategoryName()) {
			case WithPet.ROLE_STANDBY_STR :
				totalTierList.get(i).setCategoryName("견주대기자");
				break;
			case WithPet.ROLE_DOGMOM_STR :
				totalTierList.get(i).setCategoryName("댕댕이 맘");
				break;
			case WithPet.ROLE_MANAGER_STR :
				totalTierList.get(i).setCategoryName("관리자");
				break;
			case WithPet.ROLE_SYSTEMADMIN_STR :
				totalTierList.get(i).setCategoryName("시스템관리자");
				break;
			case WithPet.ROLE_EXCEPT_STR :
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
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierExcept(memberDTO);
	}

	@Override
	public void managerDogmomDelete(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierMember(memberDTO);
	}

	@Override
	public void managerDogmomPermit(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierDogmom(memberDTO);
	}

	@Override
	public ListDTO<BoardDTO> allMeetingList(int pageNo) {
		int totalCount=adminDAO.getMeetingBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getAllMeetingList(pagingBean), pagingBean);
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
		ListDTO<DonationDTO> list=new ListDTO<DonationDTO>(adminDAO.getAllDonationList(pagingBean), pagingBean);
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
		ListDTO<DonationDTO> list=new ListDTO<DonationDTO>(adminDAO.getApplyDonationList(pagingBean), pagingBean);
		return list;
	}

	@Override
	public void acceptDonation(int boardNo) {
		adminDAO.setAcceptDonation(boardNo);
	}
	
}
