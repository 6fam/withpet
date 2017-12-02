package com.sixidiot.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.BoardDTO;
import com.sixidiot.withpet.model.dto.DonationDTO;
import com.sixidiot.withpet.model.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<MemberDTO> totalMemberList(PagingBean pagingBean) {
		return template.selectList("jy.totalMemberList",pagingBean);
	}
	@Override
	public List<MemberDTO> allRoleMemberList(PagingBean pagingBean) {
		return  template.selectList("jy.allRoleMemberList",pagingBean);
	}
	
	@Override
	public List<MemberDTO> allRoleStandby(PagingBean pagingBean) {
		return  template.selectList("jy.allRoleStandby",pagingBean);
	}
	
	@Override
	public int allMemberCount() {
		return template.selectOne("jy.allMemberCount");
	}
	@Override
	public int allRoleMemberTotalCount() {
		return template.selectOne("jy.allRolrMemberTotalCount");
	}
	@Override
	public int allRoleDogmomTotalCount() {
		return template.selectOne("jy.allRolDogmomTotalCount");
	}
	@Override
	public int allRoleStandbyTotalCount() {
		return template.selectOne("jy.allRoleStandbyTotalCount");
	}
	@Override
	public List<MemberDTO> tierMemberList() {
		return template.selectList("jy.tierMemberList");
	}



	@Override
	public List<MemberDTO> allRoleDogmomList(PagingBean pagingBean) {
		List<MemberDTO> memberList = template.selectList("jy.allRoleDogmom",pagingBean);
		return memberList;
	}

	@Override
	public List<BoardDTO> allBoardList(PagingBean pagingBean){
		return template.selectList("jy.allBoardList",pagingBean);
	}
	@Override
	public List<BoardDTO> boardTypeList(PagingBean pagingBean,int categoryNo){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("categoryNo",categoryNo);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("jy.categoryBoardList",param);
	}
	@Override
	public List<BoardDTO> allCareList(){
		return template.selectList("jy.allCareList");
	}
	@Override
	public List<BoardDTO> allShareMarketList(){
		return template.selectList("jy.allShareMarketList");
	}
	
////Tier Except	
	@Override
	public void insertTierExcept(MemberDTO memberDTO) {
		template.insert("jy.insertTierExcept",memberDTO);	
	}
////Tier Member
	@Override
	public void insertTierMember(MemberDTO memberDTO) {
		template.insert("jy.insertTierMember",memberDTO);
	}
////tier StandBy	
	@Override
	public void insertTierStandby(MemberDTO memberDTO) {
		template.insert("jy.insertTierMember",memberDTO);
		template.insert("jy.insertTierStandby",memberDTO);
	}
////tier Dogmon
	@Override
	public void insertTierDogmom(MemberDTO memberDTO) {
		template.insert("jy.insertTierMember",memberDTO);
		template.insert("jy.insertTierDogmom",memberDTO);
	}
////tier Admin
	@Override
	public void insertTierAdmin(MemberDTO memberDTO) {
		template.insert("jy.insertTierMember",memberDTO);
		template.insert("jy.insertTierDogmom",memberDTO);
		template.insert("jy.insertTierAdmin",memberDTO);
	}
////delete member tier
	@Override
	public void deleteMemberTier(MemberDTO memberDTO) {
		template.delete("jy.deleteMemberTier",memberDTO);
	}
	@Override
	public List<MemberDTO> allTierList() {
		return template.selectList("jy.allTierList");
	}
	@Override
	public int allBoardListCount() {
		return template.selectOne("jy.allBoardListCount");
	}
	@Override
	public int boardListCount(int categoryNo) {
		return template.selectOne("jy.boardListCount",categoryNo);
	}
	@Override
	public int meetingBoardListCount() {
		return template.selectOne("jy.meetingBoardListCount");
	}
	@Override
	public List<BoardDTO> allMeetingList(PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("jy.allMeetingList",param);
	}
	
	@Override
	public List<DonationDTO> allDonationList(PagingBean pagingBean){
		List<DonationDTO> list= template.selectList("jy.allDonationList");
		return list;
	}
	
	@Override
	public List<DonationDTO> applyDonationList(PagingBean pagingBean){
		List<DonationDTO> list= template.selectList("jy.applyDonationList");
		return list;
	}
	
	@Override
	public void acceptDonation(int boardNo) {
		template.update("jy.acceptDonation",boardNo);
	}
}