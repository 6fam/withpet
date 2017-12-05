package com.sixfam.withpet.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.service.CommunityService;

@Controller
public class CommunityController {
	@Resource
	CommunityService communityService;
	
	/**
	 * 커뮤니티 타입 목록
	 */
	@RequestMapping("communitytype.do")
	public String communityTypeRequest(Model model) {
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		return "community.tiles";
	}
	
	/**
	 * 커뮤니티 목록
	 */
	@RequestMapping("community.do")
	public String communityListRequest(int categoryNo,Model model) {
		model.addAttribute("cmulist",communityService.getCommunityListPerCategory(categoryNo));
		System.out.println(communityService.getCommunityListPerCategory(categoryNo));
		return "community.tiles";
	}

	/**
	 * 커뮤니티 작성
	 */
	@RequestMapping("communityWrite.do")
	public String communityWriteRequest() {
		return "community_write.tiles";
	}
	
	/**
	 * 커뮤니티 상세보기
	 */
	@RequestMapping("communityDetail.do")
	public String communityDetailRequest(Model model,BoardDTO boardDTO) {
		model.addAttribute("cdinfo",communityService.getCommunityDetailInfo(boardDTO));
		return "community_detail.tiles";
	}
	
	/**
	 * 커뮤니티 게시글 수정
	 */
	@RequestMapping("communityUpdate.do")
	public String communityUpdateRequest() {
		return "community/community_update.tiles";
	}
	
	/**
	 * 커뮤니티 게시글 삭제
	 */
	@RequestMapping("communityDelete.do")
	public String communityDeleteRequest() {
		return "community/community_delete.tiles";
	}
}
