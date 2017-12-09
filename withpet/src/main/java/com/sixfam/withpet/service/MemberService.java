package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface MemberService {

	public String isIdcheck(String id);
	
	public String isIdPwAnswer(MemberDTO member);

	public void registerMember(MemberDTO member);

	public void registerDogInfo(DogDTO ddto);

	public DogDTO findDogById(String id);

	public MemberDTO findMypageInfoById(String id);

	public MemberDTO findMemberById(String id);

	public List<Object> getPWQuestion();

	public List<Authority> getAuthorityListById(String id);

	/**
	 *  마이페이지 _ 견주의 모임 개설내역 리스트 (+페이징빈)
	 */
	public ListDTO<MeetingDTO> getSetupListById(String id, int pageNo);

	/**
	 *  마이페이지 _ 일반 회원의 모임 공감내역 리스트 (+페이징빈)
	 */
	public ListDTO<MeetingDTO> getSympathyHistoryListById(String id, int pageNo);

	/**
	 *  마이페이지 _ 일반 회원의 모임 참여내역 리스트 (+페이징빈)
	 */
	public ListDTO<MeetingDTO> getAttenderHistoryListById(String id, int pageNo);
	
	public void setDogInfo(DogDTO ddto);

	public void setMemberInfo(MemberDTO member);

	public void setMemberPWInfo(MemberDTO member);

	public void setMemberPW(MemberDTO member);

	public void removeExceptMember(MemberDTO member);

	ListDTO<DonationDTO> getDonationSetupListById(String id, int pageNo);

	ListDTO<DonationDTO> getDonationListById(String id, int pageNo);
}
