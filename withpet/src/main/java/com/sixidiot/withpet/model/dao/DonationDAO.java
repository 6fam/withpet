package com.sixidiot.withpet.model.dao;

import java.util.ArrayList;

import com.sixidiot.withpet.model.dto.DonationDTO;
import com.sixidiot.withpet.model.dto.ImgDTO;

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
