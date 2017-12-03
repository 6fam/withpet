package com.sixfam.withpet.common;

/*
 * 공통상수를 선언하는 클래스입니다.
 */
public interface WithPet {
	
	//탈퇴회원
	public final static int ROLE_EXCEPT = 9;
	
	//일반회원
	public final static int ROLE_MEMBER = 10;
	
	//견주대기자
	public final static int ROLE_STANDBY = 11;
	
	//댕댕이맘
	public final static int ROLE_DOGMOM = 12;
	
	//관리자
	public final static int ROLE_MANAGER = 13;
	
	//시스템관리자
	public final static int ROLE_SYSTEMADMIN = 14;

	//게시판:모임
	public final static int BOARD_MEETING = 17;
	
	//게시판:같이가치
	public final static int BOARD_DONATION = 18;
	
	//모금대기
	public final static int DONATION_WAIT = 28;
	
	//게시판:커뮤니티
	public final static int BOARD_COMUNITY = 19;
	
	//댕댕이 성별 : 수컷
	public final static int DOG_MALE = 15;
	
	//댕댕이 성별 : 암컷
	public final static int DOG_FEMALE = 16;
	
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
