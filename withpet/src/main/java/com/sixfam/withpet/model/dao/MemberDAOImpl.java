package com.sixfam.withpet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public MemberDTO findMemberById(String id) {
		return template.selectOne("member.findMemberById", id);
	}
	
	@Override
	public int isIdcheck(String id) {
		return template.selectOne("member.findAjaxMemberById", id);
	}
	
	@Override					     
	public List<Authority> getAuthorityListById(String id) {
		System.out.println("권한생성");
		List<Integer> category=template.selectList("member.selectAuthorityById", id);
		System.out.println(1);
		List<Authority> authList=new ArrayList<Authority>();
		System.out.println(2);
		for(int i=0;i<category.size();i++) {
			switch (category.get(i)) {
			case WithPet.ROLE_MEMBER :
				authList.add(new Authority(id, WithPet.ROLE_MEMBER_STR));
				break;
			case WithPet.ROLE_STANDBY :
				authList.add(new Authority(id, WithPet.ROLE_STANDBY_STR));
				break;
			case WithPet.ROLE_DOGMOM :
				authList.add(new Authority(id, WithPet.ROLE_DOGMOM_STR));
				break;
			case WithPet.ROLE_MANAGER :
				authList.add(new Authority(id, WithPet.ROLE_MANAGER_STR));
				break;
			case WithPet.ROLE_SYSTEMADMIN :
				authList.add(new Authority(id, WithPet.ROLE_SYSTEMADMIN_STR));
				break;
			case WithPet.ROLE_EXCEPT :
				authList.add(new Authority(id, WithPet.ROLE_EXCEPT_STR));
				break;
			default:				
				break;
			}
		}
		return authList;
	}
	@Override			
	public DogDTO findDogById(String id) {
		return template.selectOne("member.findDogById", id);
	}
	
	@Override
	public void registerMember(MemberDTO member) {
		template.insert("join.registermember",member);
	}
	
	@Override
	public void registerRole(Authority authority) {
		authority.setCategoryNo(WithPet.ROLE_MEMBER );
		template.insert("join.registerRole",authority);
	}
	
	@Override
	public void registerRole(Authority authority, int categoryNo) {
		authority.setCategoryNo(categoryNo);
		template.insert("join.registerRole",authority);
	}
	
	@Override
	public List<MeetingDTO> getSetupListById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("member.getMeetingInfoById", param);
	}
	
	@Override
	public List<MeetingDTO> getAttenderHistoryListById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("member.getAttenderHistoryById", param);
	}
	
	@Override
	public List<MeetingDTO> getSympathyHistoryListById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("member.getSympathyHistoryById", param);
	}
	
	@Override
	public int getTotalCountById(String id, int categoryNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("categoryNo", categoryNo);
		return template.selectOne("member.getTotalCountById", param);
	}
	@Override
	public int getTotalCountAttender(String id) {
		return template.selectOne("member.getTotalCountAttender", id);
	}
	@Override
	public int getTotalCountSympathy(String id) {
		return template.selectOne("member.getTotalCountSympathy", id);
	}
	@Override
	public int getTotalCountDonationHistory(String id) {
		return template.selectOne("member.getTotalCountDonationHistory", id);
	}
	@Override
	public void registerDogImg(DogDTO dog) {
		template.insert("member.insertDogImg", dog);		
	}
	@Override
	public void registerDogInfo(DogDTO dog) {
		template.insert("member.insertDogInfo", dog);
	}
	@Override
	public void registerTierStandBy(String id) {
		template.insert("member.insertTierStandBy", id);
	}
	
	@Override
	public MemberDTO findMypageInfoById(String id) {
		return template.selectOne("member.mypageInfoById", id);
	}
	@Override
	public void setDogImg(DogDTO dog) {
		System.out.println("dog DAO imgPath: "+dog.getImgPath()+"imgNo : "+dog.getImgNo());
		template.insert("member.updateDogImg", dog);		
	}
	@Override
	public void setDogInfo(DogDTO dog) {
		template.insert("member.updateDogInfo", dog);
	}
	@Override
	public void setMemberInfo(MemberDTO member) {
		template.update("member.updateMemberInfo", member);
	}
	//PW 찾기 질문 추가하기!!!!!!!!!
	@Override
	public void setMemberPWInfo(MemberDTO member) {
		template.update("member.updateMemberPWInfo", member);
	}
	@Override
	public List<Object> getPWQuestion(int tableCode){
		return template.selectList("member.getPWQuestion", tableCode);
	}
	@Override
	public int isIdPwAnswer(MemberDTO member) {
		return template.selectOne("member.checkIdPwAnswer", member);
	}
	@Override
	public void setMemberPW(MemberDTO member) {
		template.update("member.updateMemberPW", member);
	}
	@Override
	public List<DonationDTO> getDonationSetupListById(String id, PagingBean pagingBean) {
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("member.getDonationSetupHistory", param);
	}
	@Override
	public List<DonationDTO> getDonationListById(String id, PagingBean pagingBean) {
		System.out.println("dao시작");
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		System.out.println("hashmap: "+param.get("id")+" "+param.get("startRNum")+" "+param.get("endRNum"));
		List<DonationDTO> list=template.selectList("member.getDonationHistory", param);
		for(DonationDTO l:list)
			System.out.println("dao :"+l);
		return template.selectList("member.getDonationHistory", param);
	}
}
