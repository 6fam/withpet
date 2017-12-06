package com.sixfam.withpet.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sixfam.withpet.common.exception.InsufficientPay;
import com.sixfam.withpet.model.PagingBean;
import com.sixfam.withpet.model.dao.DonationDAO;
import com.sixfam.withpet.model.dao.MeetingDAO;
import com.sixfam.withpet.model.dto.DonationDTO;
import com.sixfam.withpet.model.dto.ListDTO;
import com.sixfam.withpet.model.dto.PayDTO;
import com.sixfam.withpet.model.dto.ReplyDTO;

@Service
public class DonationServiceImpl implements DonationService{
	
	@Resource
	DonationDAO donationBox;
	
	@Resource
	MeetingDAO meetingBox;

	@Override
	@Transactional
	public void registerDonation(DonationDTO donation) {
		//게시글 작성
		donationBox.registerMotherDonation(donation);
		donationBox.registerDonation(donation);
		//게시글의 관련된 이미지 넣기
		donationBox.registerImg(donation.getImgPathList());
	}

	@Override
	@Transactional
	public ListDTO<DonationDTO> getAllDonationList(int pageNo) {
		//전체게시물개수가져오기
		int totalCount=donationBox.getTotalCount();
		System.out.println(totalCount);
		
		PagingBean pagingBean=null;
		if(pageNo==1)
			pagingBean=new PagingBean(10, 5, totalCount);
		else
			pagingBean=new PagingBean(pageNo, 10, 5, totalCount);
		
		return new ListDTO<DonationDTO>(donationBox.getAllDonationList(pagingBean), pagingBean);
	}
	
	@Override
	@Transactional
	public DonationDTO findDonationByNo(int boardNo) {
		return donationBox.findDonationByNo(boardNo);
	}

	@Override
	@Transactional
	public void addDonation(PayDTO pay) throws InsufficientPay {
		System.out.println("아이디 " + pay.getId());
		System.out.println("닉네임 " + pay.getNick());
		System.out.println("덧글내용 " + pay.getContent());
		System.out.println("요청금액 " + pay.getPay());
		System.out.println("요청게시물 " + pay.getBoardNo());
		
		//입금
		System.out.println("1");
		donationBox.deposit(pay);
		System.out.println("2");
		//입금이력기록
		donationBox.registerPayDepositHistory(pay);
		System.out.println("3");
		//잔액조회
		int money = donationBox.payLookUp(pay.getId());
		System.out.println("4");
		//잔액이 출금하려는 금액보다 적으면 출금 할 수 없다.
		if(money < Integer.parseInt(pay.getPay()))
			throw new InsufficientPay();
		//출금
		donationBox.withdraw(pay);
		System.out.println("5");
		//출금이력기록
		donationBox.registerPayWithdrawHistory(pay);
		System.out.println("6");
		//기부실시
		donationBox.payDonation(pay);
		System.out.println("7");
		//모금이력기록
		System.out.println("게시글 번호"+pay.getBoardNo());
		donationBox.payHistory(pay);
		System.out.println("8");
		//덧글로 응원기록
		ReplyDTO reply = new ReplyDTO(pay.getContent(), pay.getNick(), pay.getBoardNo());
		reply.setId(pay.getId());
		meetingBox.registerReply(reply);
		System.out.println("9");
	}
	
}
