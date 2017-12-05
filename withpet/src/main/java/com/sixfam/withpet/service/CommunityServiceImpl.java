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
	public BoardDTO getCommunityDetailInfo(BoardDTO boardDTO) {
		return communityDAO.getCommunityDetailInfo(boardDTO);
	}

}
