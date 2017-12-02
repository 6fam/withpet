package com.sixfam.withpet.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.DonationDAO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;

@Service
public class DonationServiceImpl implements DonationService{
	
	@Resource
	DonationDAO donationBox;

	@Override
	public void registerDonation(DonationDTO donation) {
		//게시글 작성
		donationBox.registerMotherDonation(donation);
		donationBox.registerDonation(donation);
		//게시글의 관련된 이미지 넣기
		donationBox.registerImg(donation.getImgPathList());
	}

	@Override
	public ListDTO<DonationDTO> getAllDonationList(int pageNo) {
		//전체게시물개수가져오기
		int totalCount=donationBox.getTotalCount();
		
		
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10, 5, totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 5, totalCount);
		
		
		
		return new ListDTO<DonationDTO>(donationBox.getAllDonationList(pagingBean), pagingBean);
	}
	
}
