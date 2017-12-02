package com.sixidiot.withpet.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.Authority;
import com.sixidiot.withpet.model.dto.DogDTO;
import com.sixidiot.withpet.model.dto.MeetingDTO;
import com.sixidiot.withpet.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public MemberDTO findMemberById(String id) {
		return template.selectOne("jh.findMemberById", id);
	}
	
	@Override
	public int idcheck(String id) {
		return template.selectOne("jh.findAjaxMemberById", id);
	}
	
	@Override					     
	public List<Authority> selectAuthorityById(String id) {
		List<String> category=template.selectList("jh.selectAuthorityById", id);
		List<Authority> authList=new ArrayList<Authority>();
		for(int i=0;i<category.size();i++) {
			switch (category.get(i)) {
			case "27":
				authList.add(new Authority(id, "ROLE_MEMBER"));
				break;
			case "28":
				authList.add(new Authority(id, "ROLE_STANDBY"));
				break;
			case "29":
				authList.add(new Authority(id, "ROLE_DOGMOM"));
				break;
			case "30":
				authList.add(new Authority(id, "ROLE_ADMIN"));
				break;
			case "26":
				authList.add(new Authority(id, "ROLE_EXCEPT"));
				break;
			default:				
				break;
			}
		}
		return authList;
	}
	@Override			
	public DogDTO selectDogById(String id) {
		return template.selectOne("jh.selectDogById", id);
	}
	
	@Override
	public void registerMember(MemberDTO member) {
		template.insert("join.registermember",member);
	}
	
	@Override
	public void registerRole(Authority authority) {
		authority.setCategoryNo(27);
		template.insert("join.registerRole",authority);
	}
	
	@Override
	public void registerRole(Authority authority, int categoryNo) {
		authority.setCategoryNo(categoryNo);
		template.insert("join.registerRole",authority);
	}
	
	@Override
	public List<MeetingDTO> getSetupById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		System.out.println("//dao");
		List<MeetingDTO> meeting=template.selectList("jh.getMeetingInfoById", param);
		for(MeetingDTO d : meeting)
			System.out.println(d);
		System.out.println("//meetingsize : "+meeting.size());
		return template.selectList("jh.getMeetingInfoById", param);
	}
	
	@Override
	public List<MeetingDTO> getAttenderHistoryById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("jh.getAttenderHistoryById", param);
	}
	
	@Override
	public List<MeetingDTO> getSympathyHistoryById(String id, PagingBean pagingBean){
		HashMap<String, Object>param=new HashMap<String, Object>();
		param.put("id", id);
		param.put("startRNum", pagingBean.getStartRowNumber());
		param.put("endRNum", pagingBean.getEndRowNumber());
		return template.selectList("jh.getSympathyHistoryById", param);
	}
	
	@Override
	public int getTotalCountById(String id) {
		int count = template.selectOne("jh.getTotalCountById", id);
		System.out.println("count : "+count);
		return template.selectOne("jh.getTotalCountById", id);
	}
	@Override
	public int getTotalCountAttender(String id) {
		return template.selectOne("jh.getTotalCountAttender", id);
	}
	@Override
	public int getTotalCountSympathy(String id) {
		return template.selectOne("jh.getTotalCountSympathy", id);
	}
	@Override
	public void insertDogImg(DogDTO dog) {
		template.insert("jh.insertDogImg", dog);		
		System.out.println("강아지 이미지 등록");
	}
	@Override
	public void insertDogInfo(DogDTO dog) {
		template.insert("jh.insertDogInfo", dog);
		System.out.println("강아지 정보 등록");
	}
	@Override
	public void insertTierStandBy(String id) {
		template.insert("jh.insertTierStandBy", id);
	}
	
	@Override
	public MemberDTO mypageInfoById(String id) {
		return template.selectOne("jh.mypageInfoById", id);
	}
	@Override
	public void updateDogImg(DogDTO dog) {
		template.insert("jh.updateDogImg", dog);		
	}
	@Override
	public void updateDogInfo(DogDTO dog) {
		template.insert("jh.updateDogInfo", dog);
	}
	@Override
	public void updateMemberInfo(MemberDTO member) {
		template.update("jh.updateMemberInfo", member);
	}
	//PW 찾기 질문 추가하기!!!!!!!!!
	@Override
	public void updateMemberPWInfo(MemberDTO member) {
		template.update("jh.updateMemberPWInfo", member);
	}
	@Override
	public List<Object> getPWQuestion(int tableCode){
		return template.selectList("jh.getPWQuestion", tableCode);
	}
	@Override
	public int checkIdPwAnswer(MemberDTO member) {
		return template.selectOne("jh.checkIdPwAnswer", member);
	}
	@Override
	public void updateMemberPW(MemberDTO member) {
		template.update("jh.updateMemberPW", member);
	}
}
