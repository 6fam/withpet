package com.sixfam.withpet.model.dao;

import java.util.List;

import com.sixfam.withpet.model.dto.ServiceIntroDTO;

public interface ServiceIntroDAO {
	
	
	public void insertIntro(ServiceIntroDTO dto);
	
	public int getIntroCount();
	
	public List<ServiceIntroDTO> getIntroBoardNo();
	
	public void updateIntro(ServiceIntroDTO dto);
	
	public ServiceIntroDTO detailIntro(int boardNo);
	
}