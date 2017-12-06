package com.sixfam.withpet.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.dto.BoardDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	
	@Resource
	SqlSessionTemplate template;
	
	@Override
	public List<BoardDTO> getCommunityCategoryList() {
		return template.selectList("community.communityCategoryList");
	}

	@Override
	public List<BoardDTO> getCommunityListPerCategory(int categoryNo) {
		return template.selectList("community.communityListPerCategory",categoryNo);
	}
	
	@Override
	public BoardDTO getCommunityDetailInfo(int boardNo) {
		return template.selectOne("community.communityDetailInfo",boardNo);
	}
	
	@Override
	public BoardDTO registerCommunityInfo(BoardDTO boardDTO) {
		template.insert("community.insertCommunityInfo",boardDTO);
		return boardDTO;
	}

	@Override
	public void removeCommunityInfo(int boardNo) {
		template.delete("community.deleteCommunityInfo",boardNo);
		
	}

	@Override
	public void updateCommunityInfo(BoardDTO boardDTO) {
		System.out.println(boardDTO);
		template.update("community.updateCommunityInfo",boardDTO);
	}
}
