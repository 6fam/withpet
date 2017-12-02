package com.sixfam.withpet.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;

@Repository
public class DonationDAOImpl implements DonationDAO{
	
	@Resource
	SqlSessionTemplate template;
	

	@Override
	public void registerMotherDonation(DonationDTO donation) {
		template.insert("donation.writeDonationSuper",donation);
	}

	@Override
	public void registerDonation(DonationDTO donation) {
		template.insert("donation.writeDonation",donation);
	}

	@Override
	public int getTotalCount() {
		return template.selectOne("donation.getTotalCount");
	}

	@Override
	public void registerImg(ArrayList<ImgDTO> imgList) {
		if(!imgList.isEmpty()) {
			for(int i=0;i<imgList.size();i++) {
				template.insert("donation.insertImg",imgList.get(i));
			}
		}
	}

	@Override
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean) {
		return template.selectList("donation.selectDonationList", pagingBean);
	}
}
