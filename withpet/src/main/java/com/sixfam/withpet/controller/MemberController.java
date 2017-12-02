package com.sixfam.withpet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sixfam.withpet.download.UploadFileImage;
import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MeetingDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.MemberService;

@Controller
public class MemberController {

	@Resource
	MemberService service;
	@Resource
    private BCryptPasswordEncoder passwordEncoder;
	/**
	 * 마이페이지>개설내역 페이지
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping("mypage_opened.do")
	public String mypage_opened(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		System.out.println("//controller 처음 : id "+mdto.getId());
		model.addAttribute("listdto", service.getSetupById(mdto.getId(), pageNo));
		ListDTO<MeetingDTO> llistff=service.getSetupById(mdto.getId(), pageNo);
		List<MeetingDTO> list=llistff.getList();
		System.out.println("//controller 끝 : list"+list.size());
		for(MeetingDTO m:list)
			System.out.println(m);
		return "mypage_opened.tiles";
	}
	
	/**
	 * 마이페이지>참여내역 페이지
	 */
	@RequestMapping("mypage_participate.do")
	public String mypage_partcipate(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		model.addAttribute("listdto", service.getAttenderHistoryById(mdto.getId(), pageNo));
		return "mypage_participate.tiles";
	}
	
	/**
	 * 마이페이지>공감내역 페이지
	 */
	@RequestMapping("mypage_liked.do")
	public String mypage_liked(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		model.addAttribute("listdto", service.getSympathyHistoryById(mdto.getId(), pageNo));
		return "mypage_liked.tiles";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value="memberJoin.do",  method= RequestMethod.POST)
	public String registerMember(MemberDTO member) {
		System.out.println("post 방식으로 넘어온 member값 "+member);
		member.setCategoryNo(18);
		service.registerMember(member);
		return "redirect:home.do";
	}
	
	
	@RequestMapping("findMemberByIdAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		return service.idcheck(id);
	}

	/**
	 * 마이페이지 홈
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage.do")
	public String mypage(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.mypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		DogDTO dog=service.selectDogById(mdto.getId());
		System.out.println("강아지정보!:"+dog);
		if(dog!=null) {
			model.addAttribute("ddto", dog);
			System.out.println(dog);
		}
		return "mypage.tiles";
	}
	/**
	 * 강아지 정보 수정페이지 
	 */
	@Secured({"ROLE_STANDBY", "ROLE_DOGMOM"})
	@RequestMapping("dog_update.do")
	public String dogUpdate(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		DogDTO dog=service.selectDogById(mdto.getId());
		if(dog!=null)
			model.addAttribute("ddto", dog);
		return "dog_update.tiles";
	}

	
	/*
	 *  댕댕이등록 (견주신청)
	 */
	//private String uploadPath; //업로드 경로
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="insertDogInfo.do", method=RequestMethod.POST)
	public String insertDogInfo(HttpServletRequest request, Authentication authentication, DogDTO ddto) {
		UploadFileImage<DogDTO> upload = new UploadFileImage<DogDTO>();
		
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ddto.setId(mdto.getId());
		
		upload.setImageUpload(request, ddto);
		
		service.insertDogInfo(ddto);
		return "redirect:updateMemberAuth.do";
	}
	/*
	 *		댕댕이 등록시 견주대기자로 회원 등급 추가
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberAuth.do")
	public String updateMemberAuth(HttpServletRequest request) {
		System.out.println("updateMemberAUTH method");
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> updatedAuthorities=new ArrayList<>(auth.getAuthorities());
		updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_STANDBY"));
		Authentication newAuth=new UsernamePasswordAuthenticationToken(auth.getPrincipal(), auth.getCredentials(), updatedAuthorities);
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		return "redirect:mypage.do";
	}
	/*
	 *  	댕댕이 정보 수정
	 */
	@Secured({"ROLE_STANDBY", "ROLE_DOGMOM"})
	@RequestMapping(value="updateDogInfo.do", method=RequestMethod.POST)
	public String updateDogInfo(HttpServletRequest request, Authentication authentication, DogDTO ddto) {
		System.out.println(ddto.getBdate());
		
		UploadFileImage<DogDTO> upload = new UploadFileImage<DogDTO>();
		
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ddto.setId(mdto.getId());
		
		upload.setImageUpload(request, ddto);
		
		service.updateDogInfo(ddto);
		return "redirect:mypage.do";
	}

	/**
	 * 회원정보수정 폼
	 */
	@RequestMapping("information_modification.do")
	public String informationModification(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.mypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		return "information_modification.tiles";
	}
	/**
	 * 비밀번호수정 폼
	 */
	@RequestMapping("information_pw_modification.do")
	public String informationPwModification(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.mypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		model.addAttribute("pwQuestion", service.getPWQuestion());
		return "information_pw_modification.tiles";
	}
	/*
	 *  회원정보 수정
	 */
	@RequestMapping(value="updateMemberInfo.do", method=RequestMethod.POST)
	public String updateMemberInfo(MemberDTO member, Authentication authentication) {
		System.out.println("회원 정보 수정 memberDTO: "+member);
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		member.setId(mdto.getId());
		service.updateMemberInfo(member);
		return "redirect:mypage.do";
	}
	/*
	 * 회원 비밀번호 수정
	 */
	@RequestMapping(value="updateMemberPWInfo.do", method=RequestMethod.POST)
	public String updateMemberPWInfo(MemberDTO member) {
		System.out.println("비밀번호 수정 memberDTO : "+member);
		service.updateMemberPWInfo(member);
		return "redirect:mypage.do";
	}

	/**
	 * 비밀번호 찾기 - 비번 질문, 답 입력 폼
	 */
	@RequestMapping("f_idbyquestion.do")
	public String fidByQuestion(Model model) {
		model.addAttribute("pwQuestion", service.getPWQuestion());
		return "f_idbyquestion.tiles";
	}

	@ResponseBody
	@RequestMapping("checkIdPwAnswer.do")
	public String checkIdPwAnswer( MemberDTO member ) {
		return service.checkIdPwAnswer(member);
	}
	/*
	 * 비밀번호 찾기 - 비밀번호 변경 폼
	 */
	@RequestMapping("f_changePw.do")
	public String fChangePw(String id, Model model) {
		model.addAttribute("id", id);
		return "f_changePw.tiles";
	}
	@RequestMapping(value="changePw.do", method=RequestMethod.POST)
	public String changePw(MemberDTO member) {
		service.updateMemberPW(member);
		return "redirect:home.do";
	}
	/*
	 * 회원 탈퇴 폼
	 */
	@RequestMapping("dropMemberForm.do")
	public String dropMemberForm(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.mypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		return "information_dropMemberForm.tiles";
	}
	@ResponseBody
	@RequestMapping(value="dropMember.do", method=RequestMethod.POST)
	public String dropMember(Authentication authentication, Model model, MemberDTO dropMember) {
		System.out.println("//////////////dropMember//////////////////");
		System.out.println("dropMember: "+dropMember);
		String result=" ";
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		System.out.println("사용자가 입력한 password: "+dropMember.getPassword());
		
		MemberDTO member=service.findMemberById(mdto.getId());
		System.out.println("db정보 : "+member);
		if (!passwordEncoder.matches(dropMember.getPassword(), member.getPassword())) {
			result="fail";			
		}else
			result="ok";
		System.out.println("결과: "+result);
		return result;
	}
	@RequestMapping("exceptMember.do")
	public String exceptMember(Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		service.exceptMember(mdto);
		return "redirect:logout.do";
	}
}
