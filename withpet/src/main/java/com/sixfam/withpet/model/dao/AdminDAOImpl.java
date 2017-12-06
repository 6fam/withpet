package com.sixfam.withpet.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
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
		List<MemberDTO> list =template.selectList("admin.allRoleStandby",pagingBean);
		System.out.println(list);
		return  list;
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
	public List<BoardDTO> getAllMeetingList(PagingBean pagingBean) {
		return template.selectList("admin.allMeetingList",pagingBean);
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
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean){
		List<DonationDTO> list= template.selectList("admin.allDonationList");
		return list;
	}
	
	@Override
	public List<DonationDTO> getApplyDonationList(PagingBean pagingBean){
		List<DonationDTO> list= template.selectList("admin.applyDonationList");
		return list;
	}
	
	@Override
	public void setAcceptDonation(int boardNo) {
		template.update("admin.acceptDonation",boardNo);
	}
	@Override
	public void setDogmomPermitDate(MemberDTO memberDTO) {
		template.update("admin.dogmomPermitDate",memberDTO);
	}

}