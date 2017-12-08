package com.sixfam.withpet.controller;


import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixfam.withpet.model.dto.ServiceIntroDTO;
import com.sixfam.withpet.service.ServiceIntroService;

@Controller
public class ServiceIntroController {
	@Resource
	ServiceIntroService service;
	/**
	 * header의 서비스 소개 페이지 이동(detail)
	 */
	@RequestMapping("serviceIntroDetailView.do")
	public String serviceIntroDetailView(Model model,int boardNo) {
		System.out.println("header 페이지 이동 controller");
		model.addAttribute("sdto",service.detailIntro(boardNo));
		return "serviceIntroDetail.tiles";
	}
	
	/**
	 * 관리자 서비스 관리 페이지 이동(write)
	 */
	@RequestMapping("serviceIntroWriteView.do")
	public String serviceIntroWriteView(Model model,int boardNo) {
		System.out.println("관리자 서비스 서비스관리 페이지 이동 controller"+" "+boardNo);
		
		//작성된 게시물이 없으면 그냥
		//작성된 게시물이 있으면 model에 게시물을 담아서 보내준다.
		
		System.out.println("controllerWrite1"+" "+boardNo);
		if(service.getIntroCount() != 0) {//있으면뿌려주고 
			model.addAttribute("sdto", service.detailIntro(boardNo));
		}

		return "admin/serviceIntroWrite.tiles";
		}

	
	/**
	 * 등록
	 */
	@RequestMapping(value="serviceIntroWrite.do", method=RequestMethod.POST)
	public String serviceIntroWrite(ServiceIntroDTO dto) {
		System.out.println("글 등록 합니다.");
		
		List<ServiceIntroDTO> list = service.getIntroBoardNo();
		int bno = 0;
		if(!(list.isEmpty())) { //비어있지 않으면 
			bno = list.get(0).getBoardNo();
		}
		
		if(service.getIntroCount() != 0) { //있으면
			dto.setBoardNo(bno);
			service.updateIntro(dto);
			System.out.println("업데이트실행! : "+dto);
		}else {
			service.insertIntro(dto);
		}
		
		return "redirect:serviceIntroDetailView.do?boardNo="+dto.getBoardNo();
	}
	
}