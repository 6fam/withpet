package com.sixidiot.withpet.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.BoardDTO;
import com.sixidiot.withpet.model.dto.ReplyDTO;

@Repository
public class BoardDAOImpl<T extends BoardDTO> implements BoardDAO<T>{
	@Resource
	SqlSessionTemplate template;

	@Override
	@Transactional
	public void insertSuperAndThis(String superStatement, String thisStatement, Object dto) {
		template.insert(superStatement, dto);
		template.insert(thisStatement, dto);
	}
	
	@Override
	@Transactional
	public void insertSuperAndThis(String superStatement, String thisStatement, Object superDTO, Object thisDTO) {
		template.insert(superStatement, superDTO);
		template.insert(thisStatement, thisDTO);
	}

	@Override
	public int insert(String statement) {
		return template.insert(statement);
	}
	
	@Override
	public int insert(String statement, Object dto) {
		return template.insert(statement, dto);
	}
	
	@Override
	public T selectOne(String statement, Object boardNo) {
		return template.selectOne(statement, boardNo);
	}

	@Override
	public List<T> selectList(String statement) {
		return template.selectList(statement);
	}
	
	@Override
	public List<T> selectList(String statement, PagingBean pagingbean) {
		return template.selectList(statement, pagingbean);
	} 

	@Override
	@Transactional
	public void updateSuperAndThis(String superStatement, String thisStatement, Object dto) {
		template.update(superStatement, dto);
		template.update(thisStatement, dto);
	}
	
	@Override
	@Transactional
	public void updateSuperAndThis(String superStatement, String thisStatement, Object superDTO, Object thisDTO) {
		template.update(superStatement, superDTO);
		template.update(thisStatement, thisDTO);
	}

	@Override
	public void update(String statement) {
		template.update(statement);
	}
	
	@Override
	public void update(String statement, Object dto) {
		template.update(statement, dto);
	}

	@Override
	public void delete(String statement) {
		template.delete(statement);
	}
	
	@Override
	public void delete(String statement,Object object) {
		template.delete(statement, object);
	}

	@Override
	public void insertReply(String statement, ReplyDTO rdto) {
		template.insert(statement, rdto); 
	}

	@Override
	public List<ReplyDTO> selectReply(String statement, int boardNo) {
		return template.selectList(statement, boardNo);
	}
	
}
