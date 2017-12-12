package com.sixfam.withpet.controller;

import java.text.NumberFormat;
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

import com.sixfam.withpet.model.dto.DogDTO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.MemberService;
import com.sixfam.withpet.upload.UploadFileImage;

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
	public String mypage_openedRequest(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		model.addAttribute("listdto", service.getSetupListById(mdto.getId(), pageNo));
		return "mypage_opened.tiles";
	}
	
	/**
	 * 마이페이지>참여내역 페이지
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage_participate.do")
	public String mypage_partcipateRequest(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		model.addAttribute("listdto", service.getAttenderHistoryListById(mdto.getId(), pageNo));
		return "mypage_participate.tiles";
	}
	
	/**
	 * 마이페이지>공감내역 페이지
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage_liked.do")
	public String mypage_likedRequest(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		model.addAttribute("listdto", service.getSympathyHistoryListById(mdto.getId(), pageNo));
		return "mypage_liked.tiles";
	}
	
	/**
	 * 마이페이지>모금함 개설내역 
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping("mypage_dSetup.do")
	public String mypage_dSetup(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ListDTO <DonationDTO> setupDTO=service.getDonationSetupListById(mdto.getId(), pageNo);
		List<DonationDTO> listDonation=setupDTO.getList();
		for(DonationDTO donation:listDonation) {
			String dreamMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getDreamMoney())));
			String currentMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getCurrentMoney())));
			int c = donation.getCurrentMoney();
			int d = donation.getDreamMoney();
			float donationPercent = (float)c/d;
			donation.setDonationPercent(donationPercent*100);
			donation.setDreamMoneyStr(dreamMoney);
			donation.setCurrentMoneyStr(currentMoney);
			
			String[] imgPathList = donation.getImgPath().split(",");
			donation.setImgPath(imgPathList[0]);
			/*donation.setImgPathList(new ArrayList<ImgDTO>());
			for(int i=0;i<imgPathList.length;i++) {
				donation.getImgPathList().add(new ImgDTO(imgPathList[i]));*/
			//}
		}
		
		model.addAttribute("listdto", setupDTO);
		
		return "mypage_dSetup.tiles";
	}
	/**
	 * 마이페이지> 나의 기부내역
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage_dHistory.do")
	public String mypage_dHistory(int pageNo, Model model, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ListDTO <DonationDTO> listDTO=service.getDonationListById(mdto.getId(), pageNo);
		List<DonationDTO> listDonation=listDTO.getList();
		for(DonationDTO donation:listDonation) {
			String dreamMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getDreamMoney())));
			String currentMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getCurrentMoney())));
			int c = donation.getCurrentMoney();
			int d = donation.getDreamMoney();
			float donationPercent = (float)c/d;
			donation.setDonationPercent(donationPercent*100);
			donation.setDreamMoneyStr(dreamMoney);
			donation.setCurrentMoneyStr(currentMoney);
			
			String[] imgPathList = donation.getImgPath().split(",");
			donation.setImgPath(imgPathList[0]);
			/*donation.setImgPathList(new ArrayList<ImgDTO>());
			for(int i=0;i<imgPathList.length;i++) {
				donation.getImgPathList().add(new ImgDTO(imgPathList[i]));
			}*/
		}
		
		model.addAttribute("listdto", listDTO);
		
		return "mypage_dHistory.tiles";
	}
	
	/**
	 * 회원가입
	 */
	@RequestMapping(value="memberJoin.do",  method= RequestMethod.POST)
	public String registerMemberRequest(MemberDTO member) {
		member.setCategoryNo(4);
		service.registerMember(member);
		return "redirect:home.do";
	}
	
	/**
	 * 회원가입 중복체크
	 */
	@RequestMapping("findMemberByIdAjax.do")
	@ResponseBody
	public String idCheckAjaxRequest(String id) {
		return service.isIdcheck(id);
	}
	
	@RequestMapping("findMemberByNickAjax.do")
	@ResponseBody
	public String nickCheckAjaxRequest(String nick) {
		return service.isNickcheck(nick);
	}

	/**
	 * 마이페이지 홈
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("mypage.do")
	public String mypageRequest(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.findMypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		DogDTO dog=service.findDogById(mdto.getId());
		
		if(dog!=null) 
			model.addAttribute("ddto", dog);
		
		return "mypage.tiles";
	}
	
	/**
	 * 강아지 정보 수정페이지 
	 */
	@Secured({"ROLE_STANDBY", "ROLE_DOGMOM"})
	@RequestMapping("dog_update.do")
	public String dogUpdateRequest(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		DogDTO dog=service.findDogById(mdto.getId());
		if(dog!=null)
			model.addAttribute("ddto", dog);
		return "dog_update.tiles";
	}
	
	/**
	 *  댕댕이등록 (견주신청)
	 */
	//private String uploadPath; //업로드 경로
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="insertDogInfo.do", method=RequestMethod.POST)
	public String registerDogInfoRequest(HttpServletRequest request, Authentication authentication, DogDTO ddto) {
		UploadFileImage<DogDTO> upload = new UploadFileImage<DogDTO>();
		
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ddto.setId(mdto.getId());
		
		upload.setImageUpload(request, ddto);
		service.registerDogInfo(ddto);
		return "redirect:updateMemberAuth.do";
	}
	
	/**
	 *		댕댕이 등록시 견주대기자로 회원 등급 추가
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("updateMemberAuth.do")
	public String updateMemberAuthRequest(Authentication authentication, HttpServletRequest request) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		List<GrantedAuthority> updatedAuthorities=new ArrayList<>(auth.getAuthorities());
		updatedAuthorities.add(new SimpleGrantedAuthority("ROLE_STANDBY"));
		
		MemberDTO member = service.findMemberById(mdto.getId());
		
		Authentication newAuth=new UsernamePasswordAuthenticationToken(member, auth.getCredentials(), updatedAuthorities);
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		return "redirect:mypage.do";
	}
	
	/**
	 *  	댕댕이 정보 수정
	 */
	@Secured({"ROLE_STANDBY", "ROLE_DOGMOM"})
	@RequestMapping(value="updateDogInfo.do", method=RequestMethod.POST)
	public String updateDogInfoRequest(HttpServletRequest request, Authentication authentication, DogDTO ddto) {
		UploadFileImage<DogDTO> upload = new UploadFileImage<DogDTO>();
		
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		ddto.setId(mdto.getId());
		
		upload.setImageUpload(request, ddto);
		
		service.setDogInfo(ddto);
		
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		MemberDTO member = service.findMemberById(mdto.getId());
		Authentication newAuth=new UsernamePasswordAuthenticationToken(member, auth.getCredentials(), auth.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		return "redirect:mypage.do";
	}

	/**
	 * 회원정보수정 폼
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("information_modification.do")
	public String informationModificationRequest(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.findMypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		return "information_modification.tiles";
	}
	
	/**
	 * 비밀번호수정 폼
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("information_pw_modification.do")
	public String informationPwModificationRequest(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.findMypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		model.addAttribute("pwQuestion", service.getPWQuestion());
		return "information_pw_modification.tiles";
	}
	
	/**
	 *  회원정보 수정
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="updateMemberInfo.do", method=RequestMethod.POST)
	public String updateMemberInfoRequest(MemberDTO member, Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		member.setId(mdto.getId());
		service.setMemberInfo(member);
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		MemberDTO memberHeader = service.findMemberById(mdto.getId());
		System.out.println("/////memberHeader////"+memberHeader);
		Authentication newAuth=new UsernamePasswordAuthenticationToken(memberHeader, auth.getCredentials(), auth.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(newAuth);
		return "redirect:mypage.do";
	}
	
	/**
	 * 회원 비밀번호 수정
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="updateMemberPWInfo.do", method=RequestMethod.POST)
	public String updateMemberPWInfoRequest(MemberDTO member) {
		service.setMemberPWInfo(member);
		return "redirect:mypage.do";
	}

	/**
	 * 비밀번호 찾기 - 비번 질문, 답 입력 폼
	 */
	@RequestMapping("f_idbyquestion.do")
	public String fidByQuestionRequest(Model model) {
		model.addAttribute("pwQuestion", service.getPWQuestion());
		return "f_idbyquestion.tiles";
	}

	@ResponseBody
	@RequestMapping("checkIdPwAnswer.do")
	public String checkIdPwAnswerRequest( MemberDTO member ) {
		return service.isIdPwAnswer(member);
	}
	
	/**
	 * 비밀번호 찾기 - 비밀번호 변경 폼
	 */
	@RequestMapping("f_changePw.do")
	public String fChangePwRequest(String id, Model model) {
		model.addAttribute("id", id);
		return "f_changePw.tiles";
	}
	@RequestMapping(value="changePw.do", method=RequestMethod.POST)
	public String changePwRequest(MemberDTO member) {
		service.setMemberPW(member);
		return "redirect:home.do";
	}
	
	/**
	 * 회원 탈퇴 폼
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("dropMemberForm.do")
	public String dropMemberFormRequest(Authentication authentication, Model model) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		MemberDTO member=service.findMypageInfoById(mdto.getId());
		model.addAttribute("member", member);
		return "information_dropMemberForm.tiles";
	}
	
	@Secured("ROLE_MEMBER")
	@ResponseBody
	@RequestMapping(value="dropMember.do", method=RequestMethod.POST)
	public String dropMemberRequest(Authentication authentication, Model model, MemberDTO dropMember) {
		String result=" ";
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		
		MemberDTO member=service.findMemberById(mdto.getId());
		if (!passwordEncoder.matches(dropMember.getPassword(), member.getPassword())) {
			result="fail";			
		}else
			result="ok";
		
		return result;
	}
	
	@Secured("ROLE_MEMBER")
	@RequestMapping("exceptMember.do")
	public String exceptMemberRequest(Authentication authentication) {
		MemberDTO mdto=(MemberDTO)authentication.getPrincipal();
		service.removeExceptMember(mdto);
		return "redirect:member_drop_result.do";
	}
	
	@Secured({"ROLE_EXCEPT", "ROLE_MEMBER"})
	@RequestMapping("member_drop_result.do")
	public String sendDropResultRequest(Authentication authentication) {
		return "member_drop_result.tiles";
	}
	
}
