package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;

public interface CommunityService {
	
	public List<BoardDTO> getCommunityCategoryList();
	
	public List<BoardDTO> getCommunityListPerCategory(int categoryNo);
	
	public BoardDTO getCommunityDetailInfo(int boardNo);
	
	public BoardDTO registerCommunityInfo(BoardDTO boardDTO);

	public void removeCommunityInfo(int boardNo);

	public void updateCommunityInfo(BoardDTO boardDTO);
}
