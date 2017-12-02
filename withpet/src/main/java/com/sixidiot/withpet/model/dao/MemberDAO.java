package com.sixidiot.withpet.model.dao;

import java.util.List;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.Authority;
import com.sixidiot.withpet.model.dto.DogDTO;
import com.sixidiot.withpet.model.dto.MeetingDTO;
import com.sixidiot.withpet.model.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO findMemberById(String id);
	
	int idcheck(String id);

	List<Authority> selectAuthorityById(String id);

	DogDTO selectDogById(String id);
	
	void registerMember(MemberDTO member);
	
	void registerRole(Authority authority);
	
	void registerRole(Authority authority, int categoryNo);

	int getTotalCountById(String id);

	List<MeetingDTO> getSetupById(String id, PagingBean pagingBean);

	List<MeetingDTO> getAttenderHistoryById(String id, PagingBean pagingBean);

	List<MeetingDTO> getSympathyHistoryById(String id, PagingBean pagingBean);

	int getTotalCountAttender(String id);

	int getTotalCountSympathy(String id);

	void insertDogInfo(DogDTO ddto);

	void insertDogImg(DogDTO dog);

	void insertTierStandBy(String id);

	MemberDTO mypageInfoById(String id);

	void updateDogInfo(DogDTO dog);

	void updateDogImg(DogDTO dog);

	void updateMemberInfo(MemberDTO member);

	void updateMemberPWInfo(MemberDTO member);

	List<Object> getPWQuestion(int tableCode);

	int checkIdPwAnswer(MemberDTO member);

	void updateMemberPW(MemberDTO member);





}
