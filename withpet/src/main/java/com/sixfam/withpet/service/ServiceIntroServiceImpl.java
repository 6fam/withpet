package com.sixfam.withpet.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixfam.withpet.model.dao.ServiceIntroDAO;
import com.sixfam.withpet.model.dto.ServiceIntroDTO;

@Service
public class ServiceIntroServiceImpl implements ServiceIntroService {
	@Resource
	ServiceIntroDAO dao;

	@Override
	public void insertIntro(ServiceIntroDTO dto) {
		dao.insertIntro(dto);
	}
	
	@Override
	public int getIntroCount() {
		return dao.getIntroCount();
	}
	
	@Override
	public List<ServiceIntroDTO> getIntroBoardNo(){
		return dao.getIntroBoardNo();
	}
	
	@Override
	public void updateIntro(ServiceIntroDTO dto) {
		dao.updateIntro(dto);
	}
	
	@Override
	public ServiceIntroDTO detailIntro(int boardNo) {
		return dao.detailIntro(boardNo);
	}
/*	@Override
	public int boardNoSelect() {
		return dao.boardNoSelectIntro();
	}*/
	/*@Override
	public ServiceIntroDTO updateInsertIntro(ServiceIntroDTO dto) {
		if(dto.getBoardNo()==0) {
			dao.registerIntro(dto);
		}else{
			dao.updateServiceIntro(dto);
		}
		return dto;
	}*/




}
