package com.sixfam.withpet.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
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
	public List<BoardDTO> getCommunityListPerCategory(PagingBean pagingBean,int categoryNo) {
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("categoryNo", categoryNo);
		param.put("startRowNumber", pagingBean.getStartRowNumber());
		param.put("endRowNumber", pagingBean.getEndRowNumber());
		return template.selectList("community.communityListPerCategory",param);
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
		template.update("community.updateCommunityInfo",boardDTO);
	}
}
