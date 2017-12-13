package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.AdminDAO;
import com.sixfam.withpet.model.dao.CommunityDAO;
import com.sixfam.withpet.model.dto.BoardDTO;
import com.sixfam.withpet.model.dto.ListDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Resource
	CommunityDAO communityDAO;
	
	@Resource
	AdminDAO adminDAO;
	
	@Override
	public List<BoardDTO> getCommunityCategoryList() {
		return communityDAO.getCommunityCategoryList();
	}

	@Override
	public ListDTO<BoardDTO> getCommunityListPerCategory(int categoryNo,int pageNo) {
		int totalCount=adminDAO.getBoardCountPerCategory(categoryNo);
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10,4,totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 4, totalCount);
		return new ListDTO<BoardDTO>(communityDAO.getCommunityListPerCategory(pagingBean,categoryNo), pagingBean);
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
