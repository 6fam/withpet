package com.sixidiot.doingtogether.service;

import com.sixidiot.doingtogether.model.dto.DonationDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;

public interface DonationService {
	
	/*
	 * 모금함 목록보기
	 */
	ListDTO<DonationDTO> getAllDonationList(int pageNo);
	
	/**
	 * 모금함 개설하기
	 */
	void insertSuperAndThis(DonationDTO donation);
	
	/**
	 * 모금함 상세보기
	 */
	DonationDTO selectOne(int boardNo);
	
	/**
	 * 모금함 글 수정
	 */
	void updateSuperAndThis(DonationDTO donation);
	
	/**
	 * 모금함 글 삭제
	 */
	void delete(DonationDTO donation);
	
}
