package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.AdminDAO;
import com.sixfam.withpet.model.dao.MemberDAO;
import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Resource
	MemberDAO memberDAO;
	@Resource
	AdminDAO adminDAO;
	@Resource
	private BCryptPasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public MemberDTO findMemberById(String id) {
		MemberDTO mdto = memberDAO.findMemberById(id);
		return mdto;
	}
	@Override
	@Transactional
	public DogDTO findDogById(String id) {
		DogDTO dog=memberDAO.findDogById(id);
		if(dog!=null) {			
			String[] birth=dog.getBdate().split("-");
			dog.setBdate(birth[0]+"월 "+birth[1]+"일");
			if(dog.getNeutralization().equals("1"))
				dog.setNeutralization("O");
			else
				dog.setNeutralization("X");
		}
		return dog;
	}
	
	@Override
	@Transactional
	public String isIdcheck(String id) {
		int count = memberDAO.isIdcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	@Transactional
	public List<Authority> getAuthorityListById(String id) {
		return memberDAO.getAuthorityListById(id);
	}

	
	@Override
	@Transactional
	public void registerMember(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.registerMember(member);
		memberDAO.registerRole(new Authority(member.getId(), "ROLE_MEMBER"));
	}
	
	/**
	 *  마이페이지 _ 견주의 모임 개설내역 리스트 (+페이징빈)
	 */
	@Override
	@Transactional
	public ListDTO<MeetingDTO> getSetupListById(String id, int pageNo) {
		int totalCount=memberDAO.getTotalCountById(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(1, 4, totalCount);
		else
			pagingBean=new PagingBean(pageNo, 1, 4, totalCount);
		return new ListDTO<MeetingDTO>(memberDAO.getSetupListById(id, pagingBean), pagingBean);
	}
	
	/**
	 *  마이페이지 _ 일반 회원의 모임 참여내역 리스트 (+페이징빈)
	 */
	@Override
	@Transactional
	public ListDTO<MeetingDTO> getAttenderHistoryListById(String id, int pageNo){
		int totalCount=memberDAO.getTotalCountAttender(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(3,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 3, 4, totalCount);
		return new ListDTO<MeetingDTO>(memberDAO.getAttenderHistoryListById(id, pagingBean), pagingBean);
	}
	
	/**
	 *  마이페이지 _ 일반 회원의 모임 공감내역 리스트 (+페이징빈)
	 */
	@Override
	@Transactional
	public ListDTO<MeetingDTO> getSympathyHistoryListById(String id, int pageNo){
		int totalCount=memberDAO.getTotalCountSympathy(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<MeetingDTO>(memberDAO.getSympathyHistoryListById(id, pagingBean), pagingBean);
	}
	
	@Override
	@Transactional
	public void registerDogInfo(DogDTO ddto) {
		//업데이트치기 위해 생일 정보 리포멧
		String bdate = ddto.getBdate().replace("-", "/");
		String date[] = bdate.split("/");
		String year = date[0];
		String month = date[1];
		String days = date[2];
		bdate = month+"/"+days+"/"+year;
		
		ddto.setBdate(bdate);
		if(ddto.getGender().equals("female"))
			ddto.setCategoryNo(WithPet.DOG_FEMALE);
		else
			ddto.setCategoryNo(WithPet.DOG_MALE);
		
		if(ddto.getNeutralization()==null)
			ddto.setNeutralization("0");
		else
			ddto.setNeutralization("1");
		
		memberDAO.registerDogImg(ddto);
		memberDAO.registerDogInfo(ddto);
		memberDAO.registerTierStandBy(ddto.getId());
	}
	
	@Override
	@Transactional
	public MemberDTO findMypageInfoById(String id) {
		MemberDTO mdto=memberDAO.findMypageInfoById(id);
		switch (Integer.parseInt(mdto.getRole())) {
		case WithPet.ROLE_MEMBER :
			mdto.setRole("일반 회원");
			break;
		case WithPet.ROLE_STANDBY :
			mdto.setRole("견주 대기자");
			break;
		case WithPet.ROLE_DOGMOM :
			mdto.setRole("댕댕이 맘");
			break;
		default:
			break;
		}
		return mdto;
	}
	
	@Override
	@Transactional
	public void setDogInfo(DogDTO ddto) {
		//받아온 이미지경로 임시저장
		String imgPath = ddto.getImgPath();
		//업데이트치기 위해 생일 정보 리포멧
		String bdate = ddto.getBdate().replace("-", "/");
		String date[] = bdate.split("/");
		String year = date[0];
		String month = date[1];
		String days = date[2];
		bdate = month+"/"+days+"/"+year;
		
		//반려견 정보 조회
		ddto = memberDAO.findDogById(ddto.getId());
		//사용자가 입력한 개생일과 개사진 등록
		ddto.setBdate(bdate);
		ddto.setImgPath(imgPath);
		
		if(ddto.getGender().equals("female"))
			ddto.setCategoryNo(WithPet.DOG_FEMALE);
		else
			ddto.setCategoryNo(WithPet.DOG_MALE);
		
		if(ddto.getNeutralization()==null)
			ddto.setNeutralization("0");
		else
			ddto.setNeutralization("1");

		memberDAO.setDogImg(ddto);
		memberDAO.setDogInfo(ddto);
	}
	
	@Override
	@Transactional
	public void setMemberInfo(MemberDTO member) {
		memberDAO.setMemberInfo(member);
	}
	
	@Override
	@Transactional
	public void setMemberPWInfo(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.setMemberPWInfo(member);
	}
	
	@Override
	@Transactional
	public List<Object> getPWQuestion(){
		int tableCode=6;
		return memberDAO.getPWQuestion(tableCode);
	}
	
	@Override
	@Transactional
	public String isIdPwAnswer(MemberDTO member) {
		int count=memberDAO.isIdPwAnswer(member);
		return ( count == 1 ) ? "ok" : "fail";
	}
	
	@Override
	@Transactional
	public void setMemberPW(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.setMemberPW(member);
	}
	
	@Override
	@Transactional
	public void removeExceptMember(MemberDTO member) {
		adminDAO.removeMemberTier(member);
		adminDAO.registerTierExcept(member);
	}
}
