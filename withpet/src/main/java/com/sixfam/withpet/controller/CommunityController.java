package com.sixfam.withpet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommunityController {
	
	/**
	 * 커뮤니티 목록
	 */
	@RequestMapping("community.do")
	public String communityListRequest() {
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
	public String communityDetailRequest() {
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
