package com.sixidiot.doingtogether.service;

import com.sixidiot.doingtogether.model.dto.CareDTO;
import com.sixidiot.doingtogether.model.dto.DateDTO;
import com.sixidiot.doingtogether.model.dto.DogDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;

public interface CarerService {

	DogDTO selectDogById(String id);
	CareDTO careDetail(int boardNo);
	public void insertCare(CareDTO careDTO, DateDTO dateDTO);
	void deleteCareInfo(int boardNo);
	void updateCare(CareDTO careDTO, DateDTO dateDTO);
	ListDTO<CareDTO> getAllList(int pageNo);
}
