package com.sixidiot.withpet.service;

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
	void hits(HttpServletRequest request, HttpServletResponse response, String id, String boardNo);

}