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
	public BoardDTO getCommunityDetailInfo(BoardDTO boardDTO) {
		return template.selectOne("community.communityDetailInfo",boardDTO.getCategoryNo());
	}

}
