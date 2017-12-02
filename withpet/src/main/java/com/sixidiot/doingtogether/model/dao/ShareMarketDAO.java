package com.sixidiot.doingtogether.model.dao;

import java.util.List;

import com.sixidiot.doingtogether.model.dto.BoardDTO;
import com.sixidiot.doingtogether.model.dto.ShareMarketDTO;

public interface ShareMarketDAO extends BoardDAO<ShareMarketDTO>{
	List<BoardDTO> getPostList();
}
