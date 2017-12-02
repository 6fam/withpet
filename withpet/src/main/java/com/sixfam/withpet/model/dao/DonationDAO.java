package com.sixfam.withpet.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;

public interface DonationDAO {
	
	/**
	 * 전체 게시물 갯수
	 */
	int getTotalCount();
	
	/**
	 * 모금함 개설시 등록된 이미지 경로 작성
	 */
	void registerImg(ArrayList<ImgDTO> imgList);

	/*
	 * 모금함 상위게시판 개설
	 */
	void registerMotherDonation(DonationDTO donation);

	/*
	 * 모금함 게시판 개설
	 */
	void registerDonation(DonationDTO donation);

	/*
	 * 모금함목록
	 */
	List<DonationDTO> getAllDonationList(PagingBean pagingBean);
}
