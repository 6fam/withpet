package com.sixfam.withpet.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-Post<br>
 * @컬럼명
 * 	변수명			컬럼명	<br>
 *	-postNo 	=> post_no	<br>
 *	-postAddr	=> post_addr
 * @클래스설명
 *  -우편번호, 주소의 정보를 담고있는 DTO 클래스 입니다.
 */
public class AddressDTO {
	/*
	 * 우편번호 
	 * 컬럼명 : post_no
	 */
	private int postNo;
	/*
	 * 주소
	 * 컬럼명 : post_addr
	 */
	private String postAddr;
	/**
	 * Default Constructor
	 */
	public AddressDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public AddressDTO(int postNo, String postAddr) {
		super();
		this.postNo = postNo;
		this.postAddr = postAddr;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostAddr() {
		return postAddr;
	}
	public void setPostAddr(String postAddr) {
		this.postAddr = postAddr;
	}
	@Override
	public String toString() {
		return "AddressDTO [postNo=" + postNo + ", postAddr=" + postAddr + "]";
	}
}
