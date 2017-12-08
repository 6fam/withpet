package com.sixfam.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<MemberDTO> getAllMemberList(PagingBean pagingBean) {
		return template.selectList("admin.allMemberList",pagingBean);
	}
	
	@Override
	public List<MemberDTO> getAllRoleMemberList(PagingBean pagingBean) {
		return  template.selectList("admin.allRoleMemberList",pagingBean);
	}
	
	@Override
	public List<MemberDTO> getAllRoleStandby(PagingBean pagingBean) {
		return template.selectList("admin.allRoleStandby",pagingBean);
	}
	
	@Override
	public List<MemberDTO> getAllRoleDogmomList(PagingBean pagingBean) {
		return  template.selectList("admin.allRoleDogmom",pagingBean);
	}
	@Override
	public List<MemberDTO> getAllRoleExceptList(PagingBean pagingBean) {
		return template.selectList("admin.allRoleExcept",pagingBean);
	}
	@Override
	public List<MemberDTO> getAllRoleManagerList(PagingBean pagingBean) {
		return template.selectList("admin.allRoleManager",pagingBean);
	}
	
	
	@Override
	public int getTotalCountPerTier(int categoryNo) {
		return template.selectOne("admin.totalCountPerTier",categoryNo);
	}
	@Override
	public int getTotalCountAllMember() {
		return template.selectOne("admin.allMemberCount");
	}
	
	@Override
	public int getBoardCountPerCategory(int categoryNo) {
		return template.selectOne("admin.boardCountPerCategory",categoryNo);
	}
	@Override
	public List<MeetingDTO> getAllMeetingList(PagingBean pagingBean) {
		return template.selectList("admin.allMeetingList",pagingBean);
	}

	@Override
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean){
		return  template.selectList("admin.allDonationList",pagingBean);
	}
	
	@Override
	public List<DonationDTO> getDonationListPerState(PagingBean pagingBean,int categoryNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("categoryNo", categoryNo);
		param.put("startRowNumber", pagingBean.getStartRowNumber());
		param.put("endRowNumber", pagingBean.getEndRowNumber());
		return template.selectList("admin.donationListPerState",param);
	}






	
////Tier Except	
	@Override
	public void registerTierExcept(MemberDTO memberDTO) {
		template.insert("admin.insertTierExcept",memberDTO);	
	}
////Tier Member
	@Override
	public void registerTierMember(MemberDTO memberDTO) {
		template.insert("admin.insertTierMember",memberDTO);
	}
////tier StandBy	
	@Override
	public void registerTierStandby(MemberDTO memberDTO) {
		template.insert("admin.insertTierMember",memberDTO);
		template.insert("admin.insertTierStandby",memberDTO);
	}
////tier Dogmon
	@Override
	public void registerTierDogmom(MemberDTO memberDTO) {
		template.insert("admin.insertTierMember",memberDTO);
		template.insert("admin.insertTierDogmom",memberDTO);
	}
////tier Admin
	@Override
	public void registerTierAdmin(MemberDTO memberDTO) {
		template.insert("admin.insertTierMember",memberDTO);
		template.insert("admin.insertTierDogmom",memberDTO);
		template.insert("admin.insertTierManager",memberDTO);
	}
////delete member tier
	@Override
	public void removeMemberTier(MemberDTO memberDTO) {
		template.delete("admin.deleteMemberTier",memberDTO);
	}
	@Override
	public List<MemberDTO> getAllTierList() {
		return template.selectList("admin.allTierList");
	}
	
	
	@Override
	public void setDonationStateChange(int boardNo,int categoryNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("boardNo",boardNo);
		param.put("categoryNo", categoryNo);
		template.update("admin.donationStateChange",param);
	}
	@Override
	public void setDogmomPermitDate(MemberDTO memberDTO) {
		template.update("admin.dogmomPermitDate",memberDTO);
	}

	@Override
	public List<BoardDTO> getAllCommunityList(PagingBean pagingBean) {
		return template.selectList("admin.allCommunityList",pagingBean);
	}

	@Override
	public void registerAddCommunityType(String categoryName) {
		template.insert("admin.addCommunityType",categoryName);
	}

	@Override
	public void removeCommunityType(int categoryNo) {
		template.delete("admin.removeCommunityType",categoryNo);
	}
	
	@Override
	public void removeCommunityTypeBoard(int categoryNo) {
		template.delete("admin.removeCommunityTypeBoard",categoryNo);
	}


}