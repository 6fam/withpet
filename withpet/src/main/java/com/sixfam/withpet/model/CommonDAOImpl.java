package com.sixfam.withpet.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAOImpl implements CommonDAO{
	
	@Resource
	SqlSessionTemplate template;

	@Override
	public void addHits(int boardNo) {
		template.update("common.updateBoardHits", boardNo);
	}
}
