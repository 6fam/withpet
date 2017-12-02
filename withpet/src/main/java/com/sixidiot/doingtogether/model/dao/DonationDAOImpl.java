package com.sixidiot.doingtogether.model.dao;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixidiot.doingtogether.model.dto.DonationDTO;
import com.sixidiot.doingtogether.model.dto.ImgDTO;

@Repository
public class DonationDAOImpl extends BoardDAOImpl<DonationDTO> implements DonationDAO{
	
	@Resource
	SqlSessionTemplate template;

	@Override
	public int getTotalCount() {
		return template.selectOne("donation.getTotalCount");
	}

	@Override
	public void insertImg(ArrayList<ImgDTO> imgList) {
		if(!imgList.isEmpty()) {
			for(int i=0;i<imgList.size();i++) {
				template.insert("donation.insertImg",imgList.get(i));
			}
		}
		
	}

}
