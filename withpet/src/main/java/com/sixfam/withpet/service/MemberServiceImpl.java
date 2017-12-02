package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.WithPet;
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
	public MemberDTO findMemberById(String id) {
		MemberDTO mdto = memberDAO.findMemberById(id);
		return mdto;
	}
	@Override
	public DogDTO selectDogById(String id) {
		DogDTO dog=memberDAO.findDogById(id);
		if(dog!=null) {			
			System.out.println("db에서 가져온 dog : "+dog);
			System.out.println(dog.getBdate());
			String[] birth=dog.getBdate().split("-");
			System.out.println("split후 : "+birth[0]+"월 "+birth[1]+"일");
			dog.setBdate(birth[0]+"월 "+birth[1]+"일");
			if(dog.getNeutralization().equals("1"))
				dog.setNeutralization("O");
			else
				dog.setNeutralization("X");
			System.out.println("controller로 보낼 dog : "+dog);
		}
		return dog;
	}
	@Override
	public String idcheck(String id) {
		int count = memberDAO.isIdcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		return memberDAO.getAuthorityListById(id);
	}

	
	@Transactional
	@Override
	public void registerMember(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.registerMember(member);
		memberDAO.registerRole(new Authority(member.getId(), "ROLE_MEMBER"));
	}
	/**
	 *  마이페이지 _ 견주의 모임 개설내역 리스트 (+페이징빈)
	 */
	@Override
	public ListDTO<MeetingDTO> getSetupById(String id, int pageNo) {
		int totalCount=memberDAO.getTotalCountById(id);
		System.out.println("// service : totalCount : " +totalCount);
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
	public ListDTO<MeetingDTO> getAttenderHistoryById(String id, int pageNo){
		System.out.println("********SERVICE 시작*********");
		int totalCount=memberDAO.getTotalCountAttender(id);
		System.out.println("SERVICE:"+totalCount);
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
	public ListDTO<MeetingDTO> getSympathyHistoryById(String id, int pageNo){
		int totalCount=memberDAO.getTotalCountSympathy(id);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(2,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 2, 4, totalCount);
		return new ListDTO<MeetingDTO>(memberDAO.getSympathyHistoryListById(id, pagingBean), pagingBean);
	}
	
	@Transactional
	@Override
	public void insertDogInfo(DogDTO ddto) {
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
	public MemberDTO mypageInfoById(String id) {
		MemberDTO mdto=memberDAO.findMypageInfoById(id);
		System.out.println(mdto);
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
	@Transactional
	@Override
	public void updateDogInfo(DogDTO ddto) {
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

		System.out.println("업데이트할 개의 최종정보 : " + ddto);
		memberDAO.setDogImg(ddto);
		memberDAO.setDogInfo(ddto);
	}
	@Override
	public void updateMemberInfo(MemberDTO member) {
		memberDAO.setMemberInfo(member);
	}
	@Override
	public void updateMemberPWInfo(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.setMemberPWInfo(member);
	}
	@Override
	public List<Object> getPWQuestion(){
		int tableCode=6;
		return memberDAO.getPWQuestion(tableCode);
	}
	@Override
	public String checkIdPwAnswer(MemberDTO member) {
		int count=memberDAO.isIdPwAnswer(member);
		return ( count == 1 ) ? "ok" : "fail";
	}
	@Override
	public void updateMemberPW(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.setMemberPW(member);
	}
	@Transactional
	@Override
	public void exceptMember(MemberDTO member) {
		adminDAO.removeMemberTier(member);
		adminDAO.registerTierExcept(member);
	}
}
