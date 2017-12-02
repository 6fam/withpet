package com.sixidiot.doingtogether.model.dto;

import java.util.List;

/**
 * @테이블정보
 * @테이블명
 * 	-ShareMarket<br>
 * @컬럼명
 * 	변수명				컬럼명			<br>
 *	-categorySellerNo	=> category_no 	<br>
 * @클래스설명
 *  -나눔 게시판의 정보를 담고있는 클래스 입니다.<br>
 */
public class ShareMarketDTO extends BoardDTO {
	/*
	 * 게시글 번호 
	 * 컬럼명 : category_no
	 */
	private int categorySellerNo;
	/**
	 * Default Constructor
	 */
	public ShareMarketDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public ShareMarketDTO(int boardNo,String id, String title, String content, int hits, String wdate, int categoryNo, List<ReplyDTO> replyList,
			 int categorySellerNo) {
		super(boardNo, id, title, content, hits, wdate, categoryNo, replyList);
		this.categorySellerNo = categorySellerNo;
	}
	public int getCategorySellerNo() {
		return categorySellerNo;
	}
	public void setCategorySellerNo(int categorySellerNo) {
		this.categorySellerNo = categorySellerNo;
	}
	@Override
	public String toString() {
		return "ShareMarketDTO [categorySellerNo=" + categorySellerNo + "]";
	}
}
