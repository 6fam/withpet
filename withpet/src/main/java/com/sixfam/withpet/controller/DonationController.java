package com.sixfam.withpet.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.download.UploadFileImage;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.DonationService;

@Controller
public class DonationController {
	
	@Resource
	DonationService service;
	
	/*
	 * 반려견 기부 페이지 목록
	 */
	@RequestMapping("togetherdog.do")
	public String togetherDog(Model model, int pageNo) {
		
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

		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i).getImgPathList().toString());
		}
		
		model.addAttribute("donationList", list);
		return "together.tiles";
	}
	
	@RequestMapping("donationWrite.do")
	public String donationWritePage() {
		return "together/donationWrite.tiles";
	}
	
	@RequestMapping("donationDetail.do")
	public String donationDetail() {
		return "together/donationDetail.tiles";
	}
	
	
	@RequestMapping(value="donationOpen.do", method=RequestMethod.POST)
	public String donationWrite(Authentication authentication, HttpServletRequest request ,DonationDTO donation) {
		MemberDTO member = (MemberDTO)authentication.getPrincipal();
		
		UploadFileImage<DonationDTO> upload = new UploadFileImage<DonationDTO>();
		upload.setImageUpload(request, donation);
		upload.setImageUploadList(request, donation);
		
		//게시판번호 34
		donation.setCategoryNo(34);
		//작성자 아이디
		donation.setId(member.getId());
		//모금대기상태
		donation.setDonationStateNo(31);
		System.out.println("썸네일경로 :" + donation.getImgPath());
		System.out.println("모금협회명 :" + donation.getDonationOrg());
		System.out.println("은행명 :" + donation.getBankName());
		System.out.println("계좌번호 :" + donation.getAccountNo());
		System.out.println("계좌주 :" + donation.getAccountHost() );
		System.out.println("모인현재금액 :" + donation.getCurrentMoney());
		System.out.println("모금목표금액 :" + donation.getDreamMoney());
		System.out.println("모금함제목 :" + donation.getTitle() );
		System.out.println("모금함내용 :" + donation.getContent());
		System.out.println("게시판의게시상태 :" + donation.getDonationStateNo());
		System.out.println("게시판대분류 :" + donation.getCategoryNo());
		System.out.println("작성자 :" + donation.getId());
		
		for(int i=0;i<donation.getImgPathList().size();i++)
			System.out.println("등록이미지 명 :" + donation.getImgPathList().get(i).getImgPath());
		
		service.insertSuperAndThis(donation);
		return "redirect:togetherdog.do?pageNo=1";
	}
}
