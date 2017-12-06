package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.AdminDAO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Resource
	AdminDAO adminDAO;
	
	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllMemberList(int pageNo) {
		int totalCount=adminDAO.getTotalCountAllMember();
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllMemberList(pagingBean), pagingBean);
	}
	
	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleMemberList(int pageNo) {
		int categoryNo=10;
		int totalCount=adminDAO.getTotalCountPerTier(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleMemberList(pagingBean), pagingBean);
	}

	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleStandbyList(int pageNo) {
		int categoryNo=11;
		int totalCount=adminDAO.getTotalCountPerTier(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleStandby(pagingBean), pagingBean);
	}

	@Override
	@Transactional
	public ListDTO<MemberDTO> getAllRoleDogmomList(int pageNo) {
		int categoryNo=12;
		int totalCount=adminDAO.getTotalCountPerTier(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleDogmomList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<MemberDTO> getAllRoleExceptList(int pageNo) {
		int categoryNo=9;
		int totalCount=adminDAO.getTotalCountPerTier(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleExceptList(pagingBean), pagingBean);
	}

	@Override
	public ListDTO<MemberDTO> getAllRoleManager(int pageNo) {
		int categoryNo=13;
		int totalCount=adminDAO.getTotalCountPerTier(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(5,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 5, 4, totalCount);
		return new ListDTO<MemberDTO>(adminDAO.getAllRoleManagerList(pagingBean), pagingBean);
	}

	@Override
	@Transactional
	public ListDTO<MeetingDTO> getAllMeetingList(int pageNo){
		int categoryNo=17;
		int totalCount=adminDAO.getBoardCountPerCategory(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<MeetingDTO>(adminDAO.getAllMeetingList(pagingBean), pagingBean);
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
		case WithPet.ROLE_SYSTEMADMIN : //최고관리자등록
			adminDAO.removeMemberTier(memberDTO);
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

/*	@Override
	@Transactional
	public void removeManagerMember(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierExcept(memberDTO);
	}
*/
	@Override
	@Transactional
	public void removeManagerDogmom(MemberDTO memberDTO) {
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierMember(memberDTO);
	}

	@Override
	@Transactional
	public void setManagerDogmomPermit(MemberDTO memberDTO) {
			adminDAO.setDogmomPermitDate(memberDTO);
			adminDAO.removeMemberTier(memberDTO);
			adminDAO.registerTierDogmom(memberDTO);
	}


	@Override
	@Transactional
	public ListDTO<DonationDTO> getAllDonationList(int pageNo) {
		int totalCount=10;
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<DonationDTO>(adminDAO.getAllDonationList(pagingBean), pagingBean);
	}
	
	@Override
	public ListDTO<DonationDTO> getDonationListPerState(int pageNo,int categoryNo) {
		int totalCount=10;
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<DonationDTO>(adminDAO.getDonationListPerState(pagingBean,categoryNo), pagingBean);
	}
	


	@Override
	@Transactional
	public void setAcceptDonation(int boardNo) {
		adminDAO.setAcceptDonation(boardNo);
	}


}
