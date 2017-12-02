package com.sixidiot.doingtogether.model.dao;

import java.util.List;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dto.Authority;
import com.sixidiot.doingtogether.model.dto.CareDTO;
import com.sixidiot.doingtogether.model.dto.DateDTO;
import com.sixidiot.doingtogether.model.dto.DogDTO;

public interface CareDAO extends BoardDAO<CareDTO>{
	List<Authority> selectAuthorityById(String id);
	DogDTO selectDogById(String id);
	CareDTO careDetail(int boardNo);
	void insertCare(CareDTO careDTO, DateDTO dateDTO);
	void deleteBoardByBoardNo(int boardNo);
	void deleteGatheringDateByBoardNo(int dateNo);
	int selectDateByBoardNo(int boardNo);
	void updateCareBoard(CareDTO careDTO);
	void updateCare(CareDTO careDTO);
	void updateCareDate(DateDTO dateDTO);
	int getTotalCountCare();
	List<CareDTO> getCareList(PagingBean pagingBean);
}