package com.sixidiot.withpet.model.dao;

import java.util.List;

import com.sixidiot.withpet.model.PagingBean;
import com.sixidiot.withpet.model.dto.BoardDTO;
import com.sixidiot.withpet.model.dto.ReplyDTO;

public interface BoardDAO<T extends BoardDTO> {

	void insertSuperAndThis(String superStatement, String thisStatement, Object dto);

	void insertSuperAndThis(String superStatement, String thisStatement, Object superDTO, Object thisDTO);

	int insert(String statement);

	int insert(String statement, Object dto);

	T selectOne(String statement, Object boardNo);

	List<T> selectList(String statement);
	
	List<T> selectList(String statement, PagingBean pagingbean);

	void updateSuperAndThis(String superStatement, String thisStatement, Object dto);

	void updateSuperAndThis(String superStatement, String thisStatement, Object superDTO, Object thisDTO);

	void update(String statement);

	void update(String statement, Object dto);

	void delete(String statement);

	void delete(String statement, Object object);

	void insertReply(String statement, ReplyDTO rdto);

	List<ReplyDTO> selectReply(String statement, int boardNo);
	
}