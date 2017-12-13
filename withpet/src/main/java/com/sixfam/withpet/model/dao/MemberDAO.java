package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

public interface MemberDAO {

	public int isIdcheck(String id);
	
	public int isNickcheck(String nick);
	
	public int isIdPwAnswer(MemberDTO member);
	
	public void registerMember(MemberDTO member);
	
	public void registerRole(Authority authority);
	
	public void registerRole(Authority authority, int categoryNo);
	
	public void registerDogInfo(DogDTO ddto);

	public void registerDogImg(DogDTO dog);

	public void registerTierStandBy(String id);
	
	public MemberDTO findMemberById(String id);

	public DogDTO findDogById(String id);

	public MemberDTO findMypageInfoById(String id);
	
	public int getTotalCountById(String id, int categoryNo);
	
	public List<Authority> getAuthorityListById(String id);

	public List<MeetingDTO> getSetupListById(String id, PagingBean pagingBean);

	public List<MeetingDTO> getAttenderHistoryListById(String id, PagingBean pagingBean);

	public List<MeetingDTO> getSympathyHistoryListById(String id, PagingBean pagingBean);

	public List<Object> getPWQuestion(int tableCode);

	public int getTotalCountAttender(String id);

	public int getTotalCountSympathy(String id);

	public void setDogInfo(DogDTO dog);

	public void setDogImg(DogDTO dog);

	public void setMemberInfo(MemberDTO member);

	public void setMemberPWInfo(MemberDTO member);

	public void setMemberPW(MemberDTO member);

	List<DonationDTO> getDonationSetupListById(String id, PagingBean pagingBean);

	List<DonationDTO> getDonationListById(String id, PagingBean pagingBean);

	int getTotalCountDonationHistory(String id);
}
