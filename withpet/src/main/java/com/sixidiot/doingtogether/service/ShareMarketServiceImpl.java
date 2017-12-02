package com.sixidiot.doingtogether.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sixidiot.doingtogether.model.dao.BoardDAO;
import com.sixidiot.doingtogether.model.dao.ShareMarketDAO;
import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.model.dto.ShareMarketDTO;

@Service
public class ShareMarketServiceImpl implements ShareMarketService{

	@Resource
	ShareMarketDAO shareMarketDAO;
	
	@Resource
	BoardDAO<ShareMarketDTO> board;

	//구현된 boardDAO 클래스에서 getPostList() 매서드를 호출하는 곳
	@Override
	public List<BoardDTO> getPostList(){
		return shareMarketDAO.getPostList();
	}
}
