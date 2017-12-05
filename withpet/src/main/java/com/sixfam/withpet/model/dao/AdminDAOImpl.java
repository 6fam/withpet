package com.sixfam.withpet.model.dao;

import java.util.HashMap;
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
	public List<MemberDTO> getTotalMemberList(PagingBean pagingBean) {
		return template.selectList("admin.totalMemberList",pagingBean);
	}
	@Override
	public List<MemberDTO> getAllRoleMemberList(PagingBean pagingBean) {
		return  template.selectList("admin.allRoleMemberList",pagingBean);
	}
	
	@Override
	public List<MemberDTO> getAllRoleStandby(PagingBean pagingBean) {
		return  template.selectList("admin.allRoleStandby",pagingBean);
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
	public List<MemberDTO> getTierMemberList() {
		return template.selectList("admin.tierMemberList");
	}



	@Override
	public List<MemberDTO> getAllRoleDogmomList(PagingBean pagingBean) {
		List<MemberDTO> memberList = template.selectList("admin.allRoleDogmom",pagingBean);
		return memberList;
	}

	@Override
	public List<BoardDTO> getAllBoardList(PagingBean pagingBean){
		return template.selectList("admin.allBoardList",pagingBean);
	}
	@Override
	public List<BoardDTO> getBoardTypeList(PagingBean pagingBean,int categoryNo){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("categoryNo",categoryNo);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("admin.categoryBoardList",param);
	}
	@Override
	public List<BoardDTO> getAllCareList(){
		return template.selectList("admin.allCareList");
	}
	@Override
	public List<BoardDTO> getAllShareMarketList(){
		return template.selectList("admin.allShareMarketList");
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
	public int getAllBoardListCount() {
		return template.selectOne("admin.allBoardListCount");
	}
	@Override
	public int getBoardListCount(int categoryNo) {
		return template.selectOne("admin.boardListCount",categoryNo);
	}
	@Override
	public int getMeetingBoardListCount() {
		return template.selectOne("admin.meetingBoardListCount");
	}
	@Override
	public List<BoardDTO> getAllMeetingList(PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("admin.allMeetingList",param);
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