package com.sixfam.withpet.model.dao;

import java.util.ArrayList;

import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;

public interface DonationDAO extends BoardDAO<DonationDTO>{
	
	/**
	 * 전체 게시물 갯수
	 */
	int getTotalCount();
	
	/**
	 * 모임개설시 등록된 이미지 경로 작성
	 */
	void insertImg(ArrayList<ImgDTO> imgList);
}
