package com.sixfam.withpet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonService {

	/**
	 * 조회수증가
	 * @param request
	 * @param response
	 * @param id
	 * @param boardNo
	 */
	public void addHits(HttpServletRequest request, HttpServletResponse response, String id, String boardNo);

}