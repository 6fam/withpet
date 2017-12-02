package com.sixidiot.doingtogether.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dao.AdminDAO;
import com.sixidiot.doingtogether.model.dao.MemberDAO;
import com.sixidiot.doingtogether.model.dto.Authority;
import com.sixidiot.doingtogether.model.dto.DogDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;
import com.sixidiot.doingtogether.model.dto.MeetingDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;

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
		DogDTO dog=memberDAO.selectDogById(id);
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
		int count = memberDAO.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		return memberDAO.selectAuthorityById(id);
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
		return new ListDTO<MeetingDTO>(memberDAO.getSetupById(id, pagingBean), pagingBean);
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
		return new ListDTO<MeetingDTO>(memberDAO.getAttenderHistoryById(id, pagingBean), pagingBean);
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
		return new ListDTO<MeetingDTO>(memberDAO.getSympathyHistoryById(id, pagingBean), pagingBean);
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
			ddto.setCategoryNo(13);
		else
			ddto.setCategoryNo(12);
		if(ddto.getNeutralization()==null)
			ddto.setNeutralization("0");
		else
			ddto.setNeutralization("1");
		memberDAO.insertDogImg(ddto);
		memberDAO.insertDogInfo(ddto);
		memberDAO.insertTierStandBy(ddto.getId());
	}
	@Override
	public MemberDTO mypageInfoById(String id) {
		MemberDTO mdto=memberDAO.mypageInfoById(id);
		System.out.println(mdto);
		switch (mdto.getRole()) {
		case "27":
			mdto.setRole("일반회원");
			break;
		case "28":
			mdto.setRole("견주 대기자");
			break;
		case "29":
			mdto.setRole("반려견주");
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
		ddto = memberDAO.selectDogById(ddto.getId());
		//사용자가 입력한 개생일과 개사진 등록
		ddto.setBdate(bdate);
		ddto.setImgPath(imgPath);
		
		if(ddto.getGender().equals("female"))
			ddto.setCategoryNo(13);
		else
			ddto.setCategoryNo(12);
		
		if(ddto.getNeutralization()==null)
			ddto.setNeutralization("0");
		else
			ddto.setNeutralization("1");

		System.out.println("업데이트할 개의 최종정보 : " + ddto);
		memberDAO.updateDogImg(ddto);
		memberDAO.updateDogInfo(ddto);
	}
	@Override
	public void updateMemberInfo(MemberDTO member) {
		memberDAO.updateMemberInfo(member);
	}
	@Override
	public void updateMemberPWInfo(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.updateMemberPWInfo(member);
	}
	@Override
	public List<Object> getPWQuestion(){
		int tableCode=6;
		return memberDAO.getPWQuestion(tableCode);
	}
	@Override
	public String checkIdPwAnswer(MemberDTO member) {
		int count=memberDAO.checkIdPwAnswer(member);
		return ( count == 1 ) ? "ok" : "fail";
	}
	@Override
	public void updateMemberPW(MemberDTO member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		memberDAO.updateMemberPW(member);
	}
	@Transactional
	@Override
	public void exceptMember(MemberDTO member) {
		adminDAO.deleteMemberTier(member);
		adminDAO.insertTierExcept(member);
	}
}
