package com.sixfam.withpet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.CommonService;
import com.sixfam.withpet.service.CommunityService;

@Controller
public class CommunityController {
	@Resource
	CommunityService communityService;
	
	@Resource
	CommonService common;
	
	/**
	 * 커뮤니티 목록
	 */
	@RequestMapping("community.do")
	public String communityListRequest(int categoryNo,String categoryName,Model model,int pageNo) {
		model.addAttribute("cn",categoryName);
		model.addAttribute("cmulist",communityService.getCommunityListPerCategory(categoryNo,pageNo));
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		return "community.tiles";
	}

	/**
	 * 커뮤니티 작성폼
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("communityWriteView.do")
	public String communityWriteViewRequest(Model model) {
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		return "community_write.tiles";
	}
	
	/**
	 * 커뮤니티 작성 등록
	 */
	@RequestMapping("communityWrite.do")
	public String communityWriteRequest(Model model,BoardDTO boardDTO) {
		communityService.registerCommunityInfo(boardDTO);
		return "redirect:communityDetail.do?boardNo="+boardDTO.getBoardNo();
	}
	
	/**
	 * 커뮤니티 상세보기
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("communityDetail.do")
	public String communityDetailRequest(Model model,String boardNo,Authentication authentication, HttpServletRequest request, HttpServletResponse response) {
		MemberDTO mdto=(MemberDTO) authentication.getPrincipal();
		//조회수 증가
		common.addHits(request, response, mdto.getId(), boardNo);
		
		model.addAttribute("cdinfo",communityService.getCommunityDetailInfo(Integer.parseInt(boardNo)));
		return "community_detail.tiles";
	}
	
	/**
	 * 커뮤니티 게시글 수정 폼
	 */
	@RequestMapping("communityUpdateView.do")
	public String communityUpdateRequest(int boardNo,Model model) {
		model.addAttribute("categoryType",communityService.getCommunityCategoryList());
		model.addAttribute("cdinfo",communityService.getCommunityDetailInfo(boardNo));
		return "community_updateview.tiles";
	}
	/**
	 * 커뮤니티 게시글 수정하기
	 */
	@RequestMapping("communityUpdate.do")
	public String communityUpdateRequest(Model model,BoardDTO boardDTO) {
		communityService.updateCommunityInfo(boardDTO);
		return "redirect:communityDetail.do?boardNo="+boardDTO.getBoardNo();
	}
	/**
	 * 커뮤니티 게시글 삭제
	 */
	@RequestMapping("communityDelete.do")
	public String communityDeleteRequest(int boardNo,int categoryNo) {
		communityService.removeCommunityInfo(boardNo);
		return "redirect:community.do?categoryNo="+categoryNo;
	}
}
