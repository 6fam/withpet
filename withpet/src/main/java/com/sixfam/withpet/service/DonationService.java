package com.sixfam.withpet.service;

import com.sixfam.withpet.common.exception.InsufficientPay;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.PayDTO;

public interface DonationService {
	
	/***
	 * 모금함 개설하기
	 */
	public void registerDonation(DonationDTO donation);
	
	/**
	 * 모금함 목록보기
	 */
	public ListDTO<DonationDTO> getAllDonationList(int pageNo);
	
	/**
	 * 모금함 상세보기
	 */
	public DonationDTO findDonationByNo(int boardNo);
	
	/**
	 * 모금함 기부하기
	 */
	public void addDonation(PayDTO pay) throws InsufficientPay;
}
