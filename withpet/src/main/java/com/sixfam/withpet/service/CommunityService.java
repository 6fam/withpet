package com.sixfam.withpet.service;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.ListDTO;

public interface CommunityService {
	
	public List<BoardDTO> getCommunityCategoryList();
	
	public ListDTO<BoardDTO> getCommunityListPerCategory(int categoryNo,int pageNo);
	
	public BoardDTO getCommunityDetailInfo(int boardNo);
	
	public BoardDTO registerCommunityInfo(BoardDTO boardDTO);

	public void removeCommunityInfo(int boardNo);

	public void updateCommunityInfo(BoardDTO boardDTO);
}
