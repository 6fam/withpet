package com.sixfam.withpet.service;

import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;

public interface DonationService {
	
	/**
	 * 모금함 개설하기
	 */
	public void registerDonation(DonationDTO donation);
	
	/*
	 * 모금함 목록보기
	 */
	public ListDTO<DonationDTO> getAllDonationList(int pageNo);
}
