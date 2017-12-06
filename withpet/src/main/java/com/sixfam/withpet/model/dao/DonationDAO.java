package com.sixfam.withpet.model.dao;

import java.util.ArrayList;
import java.util.List;

import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ImgDTO;
import com.sixfam.withpet.model.dto.PayDTO;

public interface DonationDAO {
	
	/**
	 * 전체 게시물 갯수
	 */
	public int getTotalCount();
	
	/**
	 * 모금함 개설시 등록된 이미지 경로 작성
	 */
	public void registerImg(ArrayList<ImgDTO> imgList);

	/**
	 * 모금함 상위게시판 개설
	 */
	public void registerMotherDonation(DonationDTO donation);

	/**
	 * 모금함 게시판 개설
	 */
	public void registerDonation(DonationDTO donation);

	/*
	 * 모금함목록
	 */
	public List<DonationDTO> getAllDonationList(PagingBean pagingBean);
	
	/**
	 * 모금함 상세보기
	 */
	public DonationDTO findDonationByNo(int boardNo);
	
	/**
	 * 입금
	 */
	public void deposit(PayDTO pay);
	
	/**
	 * 출금
	 */
	public void withdraw(PayDTO pay);
	
	/**
	 * 계좌이력
	 */
	public void payHistory(PayDTO pay);
	
	/**
	 * 모금실시
	 */
	public void payDonation(PayDTO pay);
	
	/**
	 * 현재잔액확인
	 */
	public int payLookUp(String id);
	
	/**
	 * 입금이력기록
	 */
	public void registerPayDepositHistory(PayDTO pay);
	
	/**
	 * 출금이력기록
	 */
	public void registerPayWithdrawHistory(PayDTO pay);
}
