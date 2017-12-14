package com.sixfam.withpet.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.common.WithPet;
import com.sixfam.withpet.common.exception.InsufficientPay;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.model.dto.PayDTO;
import com.sixfam.withpet.service.DonationService;
import com.sixfam.withpet.upload.UploadFileImage;

@Controller
public class DonationController {
	
	@Resource
	DonationService service;
	
	/*
	 * 모금함 기부 페이지 목록
	 */
	@RequestMapping("togetherdog.do")
	public String togetherDogRequest(Model model, int pageNo) {
		List<DonationDTO> list = service.getAllDonationList(pageNo).getList();
		for(int i=0;i<list.size();i++) {
			//로우 1개의 이미지 경로를 가져온다.
			String imgPath = list.get(i).getImgPath();
			//, 로 짜른다.
			String[] imgPathList = imgPath.split(",");
			
			//이미지 개수만큼 for를 돌린다.
			list.get(i).setImgPathList(new ArrayList<ImgDTO>());
			for(int j=0; j<imgPathList.length; j++) {
				//로우 1개의 배열에 이미지를 넣어준다.
				list.get(i).getImgPathList().add(new ImgDTO(imgPathList[j]));
			}
		}
		model.addAttribute("donationList", list);
		return "together.tiles";
	}
	
	/*
	 * 모금함 작성 페이지로 가기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("donationWrite.do")
	public String donationWritePageRequest() {
		return "together/donationWrite.tiles";
	}
	
	/*
	 * 모금함 상세보기
	 */
	@RequestMapping("donationDetail.do")
	public String donationDetailRequest(Model model, int boardNo) {
		DonationDTO donation = service.findDonationByNo(boardNo);
		String dreamMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getDreamMoney())));
		String currentMoney = (NumberFormat.getNumberInstance().format(Integer.valueOf(donation.getCurrentMoney())));
		donation.setDreamMoneyStr(dreamMoney);
		donation.setCurrentMoneyStr(currentMoney);
		
		String[] imgPathList = donation.getImgPath().split(",");
		donation.setImgPathList(new ArrayList<ImgDTO>());
		for(int i=0;i<imgPathList.length;i++) {
			donation.getImgPathList().add(new ImgDTO(imgPathList[i]));
		}

		int c = donation.getCurrentMoney();
		int d = donation.getDreamMoney();
		float donationPercent = (float)c/d;
		
		donation.setDonationPercent(donationPercent*100);
		model.addAttribute("donation", donation);
		
		return "together/donationDetail.tiles";
	}
	
	/*
	 * 모금함 개설하기
	 */
	@RequestMapping(value="donationOpen.do", method=RequestMethod.POST)
	public String donationWriteRequest(Authentication authentication, HttpServletRequest request ,DonationDTO donation) {
		MemberDTO member = (MemberDTO)authentication.getPrincipal();
		
		UploadFileImage<DonationDTO> upload = new UploadFileImage<DonationDTO>();
		upload.setImageUpload(request, donation);
		upload.setImageUploadList(request, donation);
		
		//게시판번호
		donation.setCategoryNo(WithPet.BOARD_DONATION);
		//작성자 아이디
		donation.setId(member.getId());
		//모금대기상태
		donation.setDonationStateNo(WithPet.DONATION_WAIT);
		
		service.registerDonation(donation);
		return "redirect:togetherdog.do?pageNo=1";
	}
	
	/**
	 * 모금 결제 요청
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping(value="pay.do", method=RequestMethod.POST)
	public String donationPayRequest(Authentication authentication, PayDTO pay) {
		MemberDTO member = (MemberDTO)authentication.getPrincipal();
		pay.setId(member.getId());
		pay.setNick(member.getNick());
		
		try {
			service.addDonation(pay);
		} catch (InsufficientPay e) {
			e.printStackTrace();
		}
		  
		return "redirect:donationDetail.do?boardNo="+pay.getBoardNo();
	}
}
