package com.sixfam.withpet.model;

public interface CommonDAO {
	/**
	 * 조회수 증가
	 * @param boardNo
	 */
	void addHits(int boardNo);
}
