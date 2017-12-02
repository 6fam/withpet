package com.sixidiot.doingtogether.model.dto;

import java.util.List;

/**
 * @테이블정보
 * @테이블명
 * 	-Carer<br>
 * @컬럼명
 * 	변수명		컬럼명			<br>
 *	-boardNo 	=> board_no		<br>
 *	-dateNo		=> date_no 		<br>
 *	-postNo		=> post_no		<br>
 * @클래스설명
 *  -돌보미 게시판의 정보를 갖고 있는 클래스 입니다.<br>
 */
public class CareDTO extends BoardDTO{
	/*
	 * 돌보미 모집 기간
	 * 돌보미가 돌봐줄 시간 등의 날짜정보를 가져올 날짜번호 입니다.
	 */
	private DateDTO date;
	private String place;
	private String categoryName;
	
	/**
	 * Default Constructor
	 */
	public CareDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public CareDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
			List<ReplyDTO> replyList, DateDTO date, String categoryName, String place) {
		super(boardNo, id, title, content, hits, wdate, categoryNo, replyList);
		this.date = date;
		this.categoryName = categoryName;
		this.place=place;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public DateDTO getDate() {
		return date;
	}
	public void setDate(DateDTO date) {
		this.date = date;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	@Override
	public String toString() {
		return "CareDTO [date=" + date + ", place=" + place + ", categoryName=" + categoryName + ", toString()="
				+ super.toString() + "]";
	}
	
	
	

	
}
