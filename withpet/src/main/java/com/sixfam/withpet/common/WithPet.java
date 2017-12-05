package com.sixfam.withpet.common;

/*
 * 공통상수를 선언하는 클래스입니다.
 */
public interface WithPet {
	
	//탈퇴회원
	public final static int ROLE_EXCEPT = 9;
	
	//일반회원
	public final static int ROLE_MEMBER = 10;
	
	//예비주인님
	public final static int ROLE_STANDBY = 11;
	
	//댕댕이주인님
	public final static int ROLE_DOGMOM = 12;
	
	//관리자
	public final static int ROLE_MANAGER = 13;
	
	//운영자
	public final static int ROLE_SYSTEMADMIN = 14;

	//게시판:모임
	public final static int BOARD_MEETING = 17;
	
	//게시판:같이가치
	public final static int BOARD_DONATION = 18;
	
	//모금대기
	public final static int DONATION_WAIT = 28;
	
	//게시판:커뮤니티
	public final static int BOARD_COMUNITY = 19;

	//모임 :  모집중
	public final static int MEETING_ING = 25;
	
	//모임 :  모집마감
	public final static int MEETING_CLOSE = 26;
	
	//모임 :  모임종료
	public final static int MEETING_RUNOUT = 27;
	
	//댕댕이 성별 : 수컷
	public final static int DOG_MALE = 15;
	
	//댕댕이 성별 : 암컷
	public final static int DOG_FEMALE = 16;

	//비밀번호 질문 table_code
	public final static int PW_QUESTION = 1;
	
	//탈퇴회원
	public final static String ROLE_EXCEPT_STR = "ROLE_EXCEPT";
	
	//일반회원
	public final static String ROLE_MEMBER_STR = "ROLE_MEMBER";
	
	//견주대기자
	public final static String ROLE_STANDBY_STR = "ROLE_STANDBY";
	
	//댕댕이맘
	public final static String ROLE_DOGMOM_STR = "ROLE_DOGMOM";
	
	//관리자
	public final static String ROLE_MANAGER_STR = "ROLE_MANAGER";
	
	//시스템관리자
	public final static String ROLE_SYSTEMADMIN_STR = "ROLE_SYSTEMADMIN";
	
}
