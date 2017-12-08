package com.sixfam.withpet.model.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * @테이블정보
 * @테이블명 -Meeting<br>
 * @컬럼명 변수명 컬럼명 <br>
 *      -place => place <br>
 *      -peopleCount => people_count <br>
 *      -dateNo => date_no <br>
 *      -imgNo => img_no <br>
 *      -categoryStateNo => category_no <br>
 * @클래스설명 -모임게시판의 정보를 담고 있는 클래스입니다.<br>
 */
public class MeetingDTO extends BoardDTO {
	
	/*
	 * 모임 장소 컬럼명 : place
	 */
	private String place;
	/*
	 * 모임장소 상세주소
	 */
	private String detailPlace;
	
	/*
	 * 모임 모집 총 인원 컬럼명 : people_count
	 */
	private int peopleCount;
	
	/*
	 * 모임 참여 가능인원
	 */
	private int possibleCount;

	/*
	 * 모임 참여 인원
	 */
	private int attenderCount;
	
	/*
	 * 모임 공감 인원
	 */
	private int sympathyCount;
	
	/*
	 * 모임 썸네일 이미지 컬럼명 : img_no
	 */
	private int imgNo;
	
	/*
	 * 모임 한줄 소개
	 */
	private String intro;
	
	/*
	 * 모임 상태 분류 -모집대기/모집중/모집만료 등의 정보가 올 수 있습니다. 컬럼명 : category_no
	 */
	private int categoryStateNo;
	
	/*
	 * 모집중 상태??
	 */
	private String meetingState;
	
	/*
	 *  모임의 종류 (친목, 훈련, 산책, 세미나)
	 */
	private String meetingType;
	
	
	private String tel;
	
	/*
	 * 모임 모집 기간 돌보미가 돌봐줄 시간 등의 날짜정보를 가져올 날짜정보 입니다.
	 */
	private DateDTO date;

	/*
	 * 모임 공감 여부
	 */
	private boolean like;
	
	/**
	 * Default Constructor
	 */
	public MeetingDTO() {
		super();
	}

		
	/*public MeetingDTO(String place, int peopleCount, String imgPath, String meetingType, DateDTO date) {
		super(boardNo, id, title, content, hits, wdate);
		this.place = place;
		this.peopleCount = peopleCount;
		this.imgPath = imgPath;
		this.meetingType = meetingType;
		this.date = date;
	}*/

	public MeetingDTO(MultipartFile uploadFile) {
		super(uploadFile);
	}
	
	public MeetingDTO(String id, String title, String content, int categoryNo, String place, int peopleCount, String imgPath, DateDTO date) {
		super(id, title, content, categoryNo);
		this.place = place;
		this.peopleCount = peopleCount;
		this.date = date;
	}
	
	public MeetingDTO(int boardNo, String id, String title, String content, int categoryNo, String place, int peopleCount, DateDTO date) {
		super(boardNo, id, title, content, categoryNo);
		this.place = place;
		this.peopleCount = peopleCount;
		this.date = date;
	}
	
	
	public MeetingDTO(int boardNo, String title, int hits, int peopleCount, String imgPath) {
		super(boardNo, title, hits);
		this.peopleCount = peopleCount;
	}
	

	// 모임 상세보기
	public MeetingDTO(int boardNo, String id, String title, String content, 
			String place, int peopleCount, String tel, DateDTO date, List<ReplyDTO> replyList) {
		super(boardNo, id, title, content, replyList);
		this.place = place;
		this.peopleCount = peopleCount;
		this.tel = tel;
		this.date = date;
	}
	
	/**
	 * All has Constructor
	 */
	public MeetingDTO(int boardNo, String id, String title, String content, int hits, String wdate, int categoryNo,
			List<ReplyDTO> replyList, String place, int peopleCount, int imgNo, String intro, int categoryStateNo,
			String meetingState, String meetingType, String tel, MultipartFile uploadFile, DateDTO date) {
		super(boardNo, id, title, content, hits, wdate, categoryNo, replyList, uploadFile);
		this.place = place;
		this.peopleCount = peopleCount;
		this.imgNo = imgNo;
		this.intro = intro;
		this.categoryStateNo = categoryStateNo;
		this.meetingState = meetingState;
		this.meetingType = meetingType;
		this.tel = tel;
		this.date = date;
	}
	
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	
	public int getPeopleCount() {
		return peopleCount;
	}

	public void setPeopleCount(int peopleCount) {
		this.peopleCount = peopleCount;
	}

	public int getImgNo() {
		return imgNo;
	}

	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public int getCategoryStateNo() {
		return categoryStateNo;
	}

	public void setCategoryStateNo(int categoryStateNo) {
		this.categoryStateNo = categoryStateNo;
	}

	public DateDTO getDate() {
		return date;
	}

	public void setDate(DateDTO date) {
		this.date = date;
	}

	public String getMeetingState() {
		return meetingState;
	}

	public void setMeetingState(String meetingState) {
		this.meetingState = meetingState;
	}
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMeetingType() {
		return meetingType;
	}

	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}
	
	public String getDetailPlace() {
		return detailPlace;
	}

	public void setDetailPlace(String detailPlace) {
		this.detailPlace = detailPlace;
	}

	public int getPossibleCount() {
		return possibleCount;
	}

	public void setPossibleCount(int possibleCount) {
		this.possibleCount = possibleCount;
	}

	public int getAttenderCount() {
		return attenderCount;
	}
	public void setAttenderCount(int attenderCount) {
		this.attenderCount = attenderCount;
	}
	public int getSympathyCount() {
		return sympathyCount;
	}
	public void setSympathyCount(int sympathyCount) {
		this.sympathyCount = sympathyCount;
	}
	public boolean isLike() {
		return like;
	}
	public void setLike(boolean like) {
		this.like = like;
	}


	@Override
	public String toString() {
		return "MeetingDTO [place=" + place + ", detailPlace=" + detailPlace + ", peopleCount=" + peopleCount
				+ ", possibleCount=" + possibleCount + ", attenderCount=" + attenderCount + ", sympathyCount="
				+ sympathyCount + ", imgNo=" + imgNo + ", intro=" + intro + ", categoryStateNo=" + categoryStateNo
				+ ", meetingState=" + meetingState + ", meetingType=" + meetingType + ", tel=" + tel + ", date=" + date
				+ ", like=" + like +  ", toString()=" + super.toString() +"]";
	}
	
}
