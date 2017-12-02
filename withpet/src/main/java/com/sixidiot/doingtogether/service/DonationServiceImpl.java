package com.sixidiot.doingtogether.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixidiot.doingtogether.model.PagingBean;
import com.sixidiot.doingtogether.model.dao.BoardDAO;
import com.sixidiot.doingtogether.model.dao.DonationDAO;
import com.sixidiot.doingtogether.model.dto.DonationDTO;
import com.sixidiot.doingtogether.model.dto.ListDTO;

@Service
public class DonationServiceImpl implements DonationService{
	
	@Resource
	BoardDAO<DonationDTO> boardBox;
	
	@Resource
	DonationDAO donationBox;

	@Override
	public void insertSuperAndThis(DonationDTO donation) {
		//게시글 작성
		boardBox.insertSuperAndThis("donation.writeDonationSuper", "donation.writeDonation", donation);
		//게시글의 관련된 이미지 넣기
		donationBox.insertImg(donation.getImgPathList());
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
		
		
		System.out.println(pagingBean.getStartRowNumber());
		System.out.println(pagingBean.getEndRowNumber());
		return new ListDTO<DonationDTO>(boardBox.selectList("donation.selectDonationList", pagingBean), pagingBean);
	}
	
	@Override
	public DonationDTO selectOne(int boardNo) {
		return null;
	}

	@Override
	public void updateSuperAndThis(DonationDTO donation) {
		
	}

	@Override
	public void delete(DonationDTO donation) {
		
	}
	
	
}
