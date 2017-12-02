package com.sixidiot.doingtogether.controller;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.service.ShareMarketService;

@Controller
public class ShareMarketController {
	
	@Resource
	ShareMarketService service;

	/**
	 * 나눔마켓 목록 페이지
	 * 나눔마켓 리스트 보기 
	 * shareMarket.do 실행하여 글목록을 list에 담아옴
	 */
	@RequestMapping("sharemarket.do")
	public String getPostList(Model model) {
		List<BoardDTO> list = service.getPostList();
		model.addAttribute("list", list);
		return "sharemarket.tiles";
	}
	
	
	/**
	 * 상세보기
	 */
/*	@RequestMapping("sharemarket_detail.do")
	public String showContent(int boardNo) {
		
		
		return "home.tiles";
	}*/
}		
		
