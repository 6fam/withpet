package com.sixfam.withpet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.WithPet;
import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.DogDTO;
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
		List<Integer> category=template.selectList("member.selectAuthorityById", id);
		List<Authority> authList=new ArrayList<Authority>();
		for(int i=0;i<category.size();i++) {
			switch (category.get(i)) {
			case WithPet.ROLE_MEMBER :
				authList.add(new Authority(id, "ROLE_MEMBER"));
				break;
			case WithPet.ROLE_STANDBY :
				authList.add(new Authority(id, "ROLE_STANDBY"));
				break;
			case WithPet.ROLE_DOGMOM :
				authList.add(new Authority(id, "ROLE_DOGMOM"));
				break;
			case WithPet.ROLE_MANAGER :
				authList.add(new Authority(id, "ROLE_MANAGER"));
				break;
			case WithPet.ROLE_SYSTEMADMIN :
				authList.add(new Authority(id, "ROLE_SYSTEMADMIN"));
				break;
			case WithPet.ROLE_EXCEPT :
				authList.add(new Authority(id, "ROLE_EXCEPT"));
				break;
			default:				
				break;
			}
		}
		return authList;
	}
	@Override			
	public DogDTO findDogById(String id) {
		return template.selectOne("member.selectDogById", id);
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
		System.out.println("//dao");
		List<MeetingDTO> meeting=template.selectList("member.getMeetingInfoById", param);
		for(MeetingDTO d : meeting)
			System.out.println(d);
		System.out.println("//meetingsize : "+meeting.size());
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
	public int getTotalCountById(String id) {
		int count = template.selectOne("member.getTotalCountById", id);
		System.out.println("count : "+count);
		return template.selectOne("member.getTotalCountById", id);
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
	public void registerDogImg(DogDTO dog) {
		template.insert("member.insertDogImg", dog);		
		System.out.println("강아지 이미지 등록");
	}
	@Override
	public void registerDogInfo(DogDTO dog) {
		template.insert("member.insertDogInfo", dog);
		System.out.println("강아지 정보 등록");
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
}