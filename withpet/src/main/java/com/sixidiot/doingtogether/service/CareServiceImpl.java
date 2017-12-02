package com.sixidiot.doingtogether.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dao.BoardDAO;
import com.sixidiot.doingtogether.model.dao.CareDAO;
import com.sixidiot.doingtogether.model.dto.CareDTO;
import com.sixidiot.doingtogether.model.dto.DateDTO;
import com.sixidiot.doingtogether.model.dto.DogDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;

@Service
public class CareServiceImpl implements CarerService{
	
	@Resource
	BoardDAO<CareDTO> care;
	@Resource
	CareDAO careDAO;

	@Override
	public ListDTO<CareDTO> getAllList(int pageNo) {
		System.out.println("**service**");
		int totalCount=careDAO.getTotalCountCare();
		System.out.println("**totalCount: "+totalCount);
		PagingBean pagingBean=null;
		if(pageNo==1) {
			pagingBean=new PagingBean(10,5,totalCount);	
			System.out.println("1111111111"+pagingBean);
		}else {
			pagingBean=new PagingBean(pageNo, 10, 5,totalCount);
			System.out.println(pagingBean);
		}
		return new ListDTO<CareDTO>(careDAO.getCareList(pagingBean),pagingBean);
	}

	@Override
	public DogDTO selectDogById(String id) {
		return careDAO.selectDogById(id);
	}

	@Override
	public CareDTO careDetail(int boardNo) {
		CareDTO careDTO=careDAO.careDetail(boardNo);
		return careDTO;
	}

	@Override
	public void insertCare(CareDTO careDTO, DateDTO dateDTO) {
		careDAO.insertCare(careDTO, dateDTO);
	}

	@Transactional
	@Override
	public void deleteCareInfo(int boardNo) {
		int dateNo=careDAO.selectDateByBoardNo(boardNo);
		careDAO.deleteBoardByBoardNo(boardNo);
		careDAO.deleteGatheringDateByBoardNo(dateNo);
	}
	
	@Transactional
	@Override
	public void updateCare(CareDTO careDTO, DateDTO dateDTO) {
		int dateNO=careDAO.selectDateByBoardNo(careDTO.getBoardNo());
		dateDTO.setDateNo(dateNO);
		careDAO.updateCareBoard(careDTO);
		careDAO.updateCareDate(dateDTO);
		careDAO.updateCare(careDTO);
	}

}
