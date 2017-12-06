package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixfam.withpet.model.dao.CommunityDAO;
import com.sixfam.withpet.model.dto.BoardDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Resource
	CommunityDAO communityDAO;
	
	@Override
	public List<BoardDTO> getCommunityCategoryList() {
		return communityDAO.getCommunityCategoryList();
	}

	@Override
	public List<BoardDTO> getCommunityListPerCategory(int categoryNo) {
		return communityDAO.getCommunityListPerCategory(categoryNo);
	}

	@Override
	public BoardDTO getCommunityDetailInfo(int boardNo) {
		return communityDAO.getCommunityDetailInfo(boardNo);
	}

	@Override
	public BoardDTO registerCommunityInfo(BoardDTO boardDTO) {
		return communityDAO.registerCommunityInfo(boardDTO);
		
	}

	@Override
	public void removeCommunityInfo(int boardNo) {
		communityDAO.removeCommunityInfo(boardNo);
		
	}

	@Override
	public void updateCommunityInfo(BoardDTO boardDTO) {
		communityDAO.updateCommunityInfo(boardDTO);		
	}

}
