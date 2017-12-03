package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.model.PagingBean;
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
	@Transactional
	public ListDTO<MemberDTO> getTotalMemberList(int pageNo) {
		int totalCount=adminDAO.getAllMemberCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getTotalMemberList(pagingBean), pagingBean);
	}
	
	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleMemberList(int pageNo) {
		int totalCount=adminDAO.getAllRoleMemberTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleMemberList(pagingBean), pagingBean);
	}


	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleDogmomList(int pageNo) {
		int totalCount=adminDAO.getAllRoleDogmomTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleDogmomList(pagingBean), pagingBean);
	}
	
	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleStandby(int pageNo) {
		int totalCount=adminDAO.getAllRoleStandbyTotalCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		//List<MemberDTO> list =adminDAO.allRoleStandby(pagingBean);
		//ListDTO<MemberDTO> list=  new ListDTO<MemberDTO>(adminDAO.allRoleDogmomList(pagingBean), pagingBean);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleStandby(pagingBean), pagingBean);
	}

	
	@Override
	@Transactional
	public ListDTO<BoardDTO> getAllBoardList(int pageNo){
		int totalCount=adminDAO.getAllBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getAllBoardList(pagingBean), pagingBean);
	}

	@Override
	@Transactional
	public ListDTO<BoardDTO> getBoardTypeList(int pageNo,int categoryNo) {
		int totalCount=adminDAO.getBoardListCount(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getBoardTypeList(pagingBean,categoryNo), pagingBean);
	}

	@Override
	@Transactional
	public List<BoardDTO> getAllCareList() {
		return adminDAO.getAllCareList();
	}

	@Override
	@Transactional
	public List<BoardDTO> getAllShareMarketList() {
		return adminDAO.getAllShareMarketList();
	}

	@Override
	@Transactional
	public void setMemberTier(MemberDTO memberDTO) {
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
	@Transactional
	public List<MemberDTO> getAllTierList() {
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

	@Override
	@Transactional
	public void removeManagerMember(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierExcept(memberDTO);
	}

	@Override
	@Transactional
	public void removeManagerDogmom(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierMember(memberDTO);
	}

	@Override
	@Transactional
	public void setManagerDogmomPermit(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierDogmom(memberDTO);
	}

	@Override
	@Transactional
	public ListDTO<BoardDTO> getAllMeetingList(int pageNo) {
		int totalCount=adminDAO.getMeetingBoardListCount();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<BoardDTO>(adminDAO.getAllMeetingList(pagingBean), pagingBean);
	}

	@Override
	@Transactional
	public ListDTO<DonationDTO> getAllDonationList() {
		int totalCount=10;
		int pageNo=1;
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		ListDTO<DonationDTO> list=new ListDTO<DonationDTO>(adminDAO.getAllDonationList(pagingBean), pagingBean);
		return list;
	}
	@Override
	@Transactional
	public ListDTO<DonationDTO> getApplyDonationList() {
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
	@Transactional
	public void setAcceptDonation(int boardNo) {
		adminDAO.setAcceptDonation(boardNo);
	}
	
}
