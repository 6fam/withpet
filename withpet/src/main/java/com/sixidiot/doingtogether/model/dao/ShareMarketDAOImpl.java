package com.sixidiot.doingtogether.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.model.dto.ShareMarketDTO;

@Repository
public class ShareMarketDAOImpl extends BoardDAOImpl<ShareMarketDTO> implements ShareMarketDAO{
	@Resource
	private SqlSessionTemplate template;
	
	@Override
	public List<BoardDTO> getPostList() {//kms의 mapper.xml의 namespace인 ms를 찾아감. 
		return template.selectList("ms.getPostList"); 
	}
	/*@Override
	public ShareMarketDTO getBoard(ShareMarketDTO sdto) {
		template.insert("ms.insertBoard", sdto);
		return sdto;
	}
	@Override
	public void getBoard1(ShareMarketDTO sdto) {
		template.insert("ms.insertSM", sdto);
	}*/
}
