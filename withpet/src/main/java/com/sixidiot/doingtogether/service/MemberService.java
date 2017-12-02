package com.sixidiot.doingtogether.service;

import java.util.List;

import com.sixidiot.doingtogether.model.dto.Authority;
import com.sixidiot.doingtogether.model.dto.DogDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;
import com.sixidiot.doingtogether.model.dto.MeetingDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;

public interface MemberService {

	MemberDTO findMemberById(String id);

	String idcheck(String id);
	
	List<Authority> selectAuthorityById(String id);

	void registerMember(MemberDTO member);

	ListDTO<MeetingDTO> getSetupById(String id, int pageNo);

	ListDTO<MeetingDTO> getSympathyHistoryById(String id, int pageNo);

	ListDTO<MeetingDTO> getAttenderHistoryById(String id, int pageNo);

	void insertDogInfo(DogDTO ddto);

	DogDTO selectDogById(String id);

	MemberDTO mypageInfoById(String id);

	void updateDogInfo(DogDTO ddto);

	void updateMemberInfo(MemberDTO member);

	void updateMemberPWInfo(MemberDTO member);

	List<Object> getPWQuestion();

	String checkIdPwAnswer(MemberDTO member);

	void updateMemberPW(MemberDTO member);

	void exceptMember(MemberDTO member);

}
