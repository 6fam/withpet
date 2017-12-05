package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.dto.BoardDTO;


public interface CommunityDAO {

	public List<BoardDTO> getCommunityCategoryList();
	public List<BoardDTO> getCommunityListPerCategory(int categoryNo);
	public BoardDTO getCommunityDetailInfo(BoardDTO boardDTO);

}
