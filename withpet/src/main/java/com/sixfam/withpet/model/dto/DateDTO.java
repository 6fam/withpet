package com.sixfam.withpet.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-RegDate<br>
 * @컬럼명
 * 	변수명				컬럼명			<br>
 *	-dateNo 		=> date_no			<br>
 *	-gatheringStart	=> gathering_start 	<br>
 *	-gatheringEnd	=> gathering_end	<br>
 *	-meetingStart	=> meeting_start 	<br>
 *	-meetingEnd		=> meeting_end		<br>
 * @클래스설명
 *  -돌보미, 모임게시판에서 사용하는 시간정보를 담고 있는 클래스 입니다.<br>
 */
public class DateDTO {
	/*
	 * 일정 번호 
	 * 컬럼명 : date_no
	 */
	private int dateNo;
	/*
	 * 모집시작 
	 * 컬럼명 : gathering_start
	 */
	private String gatheringStart;
	/*
	 * 모집종료 
	 * 컬럼명 : gathering_end
	 */
	private String gatheringEnd;
	/*
	 * 모집당일종료시간
	 * 컬럼명 : meeting_start
	 */
	private String meetingStart;
	/*
	 * 모집당일종료시간
	 * 컬럼명 : meeting_end
	 */
	private String meetingEnd;
	/**
	 * Default Constructor
	 */
	public DateDTO() {
		super();
	}
	
	/*
	 * 모임 등록하기 위한 생성자 
	 */
	public DateDTO(String gatheringStart, String gatheringEnd, String meetingStart, String meetingEnd) {
		super();
		this.gatheringStart = gatheringStart;
		this.gatheringEnd = gatheringEnd;
		this.meetingStart = meetingStart;
		this.meetingEnd = meetingEnd;
	}

	/**
	 * All has Constructor
	 */
	public DateDTO(int dateNo, String gatheringStart, String gatheringEnd, String meetingStart, String meetingEnd) {
		super();
		this.dateNo = dateNo;
		this.gatheringStart = gatheringStart;
		this.gatheringEnd = gatheringEnd;
		this.meetingStart = meetingStart;
		this.meetingEnd = meetingEnd;
	}
	public int getDateNo() {
		return dateNo;
	}
	public void setDateNo(int dateNo) {
		this.dateNo = dateNo;
	}
	public String getGatheringStart() {
		return gatheringStart;
	}
	public void setGatheringStart(String gatheringStart) {
		this.gatheringStart = gatheringStart;
	}
	public String getGatheringEnd() {
		return gatheringEnd;
	}
	public void setGatheringEnd(String gatheringEnd) {
		this.gatheringEnd = gatheringEnd;
	}
	public String getMeetingStart() {
		return meetingStart;
	}
	public void setMeetingStart(String meetingStart) {
		this.meetingStart = meetingStart;
	}
	public String getMeetingEnd() {
		return meetingEnd;
	}
	public void setMeetingEnd(String meetingEnd) {
		this.meetingEnd = meetingEnd;
	}
	@Override
	public String toString() {
		return "DateDTO [dateNo=" + dateNo + ", gatheringStart=" + gatheringStart + ", gatheringEnd=" + gatheringEnd
				+ ", meetingStart=" + meetingStart + ", meetingEnd=" + meetingEnd + "]";
	}
}
