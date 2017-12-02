package com.sixidiot.doingtogether.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sixidiot.doingtogether.model.dto.CareDTO;
import com.sixidiot.doingtogether.model.dto.DateDTO;
import com.sixidiot.doingtogether.model.dto.MemberDTO;
import com.sixidiot.doingtogether.service.CarerService;
import com.sixidiot.doingtogether.service.CommonService;

@Controller
public class CareController {

	@Resource
	CarerService service;
	
	@Resource
	CommonService common;
	
	/**
	 * 돌보미 목록 페이지
	 */
	@RequestMapping("carer.do")
	public String care(Model model,int pageNo) {
		System.out.println("controller: "+pageNo);
		model.addAttribute("careLDTO", service.getAllList(pageNo));
		System.out.println(model.addAttribute("careLDTO", service.getAllList(pageNo)));
		return "carer.tiles";
	}
	
	/**
	 * 돌보미 상세페이지
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("care_detail.do")
	public String careDetail(HttpServletRequest request, HttpServletResponse response, Model model,String boardNo,Authentication authentication) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		
		//조회수 증가
		common.hits(request, response, mdto.getId(), boardNo);
		
		CareDTO careDetail=service.careDetail(Integer.parseInt(boardNo));
		model.addAttribute("careDetail",careDetail);
		model.addAttribute("ddto", service.selectDogById(mdto.getId()));
		return "care_detail.tiles";
	}
	
	/**
	 * 돌보미 작성페이지가기 get
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping("care_write.do")
	public String careWrite(Authentication authentication,Model model) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		model.addAttribute("ddto", service.selectDogById(mdto.getId()));
		return "care_write.tiles";
	}
	
	/**
	 * 돌보미 등록 post
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping(value = "registerCare.do", method = RequestMethod.POST)
	public String careWrite(Authentication authentication,CareDTO care, DateDTO date, String address, String detailAddress) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		care.setPlace(address+" "+detailAddress);
		care.setId(mdto.getId());
		care.setCategoryNo(2);
		service.insertCare(care, date);
		
		return "redirect:carer.do?pageNo=1";
	}
	
	/**
	 * 돌보미 삭제
	 */
	//@Secured("ROLE_DOGMOM")
	@RequestMapping("care_delete.do")
	public String careDelete(int boardNo) {
		System.out.println(boardNo);
		service.deleteCareInfo(boardNo);
		return "redirect:carer.do?pageNo=1";
	}
	
	/**
	 * 돌보미 수정페이지로 가기
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping("care_update.do")
	public String careUdatePage(Authentication authentication,Model model, int boardNo) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		model.addAttribute("ddto", service.selectDogById(mdto.getId()));
		model.addAttribute("boardNo", boardNo);
		return "care_update.tiles";
	}
	
	/**
	 * 돌보미 수정정보가지고 가기
	 */
	@Secured("ROLE_DOGMOM")
	@RequestMapping(value = "care_updateCheck.do", method = RequestMethod.POST)
	public String careUpdate(Authentication authentication, CareDTO care, DateDTO date, String address, String detailAddress) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		care.setPlace(address+" "+detailAddress);
		care.setId(mdto.getId());
		service.updateCare(care, date);
		return "redirect:care_detail.do?boardNo="+care.getBoardNo();
	}
	
}
