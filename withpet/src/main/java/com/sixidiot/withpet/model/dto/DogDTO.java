package com.sixidiot.withpet.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-Dog<br>
 * @컬럼명
 * 	변수명			컬럼명		<br>
 *	-dogNo 		=> dog_no		<br>
 *	-bdate		=> bdate 		<br>
 *	-intro		=> intro		<br>
 *	-id			=> id 			<br>
 *	-imgNo		=> img_no		<br>
 *	-categoryNo	=> category_no	<br>
 * @클래스설명
 *  -반려견의 정보를 담고 있는 클래스 입니다.<br>
 */
public class DogDTO extends UploadDTO{
	/*
	 * 회원 아이디
	 * 컬럼명 : id
	 */
	private String id;
	/*
	 * 반려견 번호(PK)
	 * 컬럼명 : dog_no
	 */
	private int dogNo;
	/*
	 * 반려견 생일
	 * 컬럼명 : bdate
	 */
	private String bdate;
	/*
	 * 반려견 나이
	 */
	private int age;
	/*
	 * 반려견 이름
	 * 컬럼명 : name
	 */
	private String name;
	/*
	 * 반려견 소개
	 * 컬럼명 : intro
	 */
	private String intro;
	/*
	 * 중성화 여부
	 * 컬럼명 : neutralization
	 */
	private String neutralization;
	/*
	 * 이미지 경로
	 * 컬럼명 : img_no
	 */
	private int imgNo;
	/*
	 * 반려견 성별 카테고리
	 * 컬럼명 : category_no
	 */
	private int categoryNo;
	/*
	 *  반려견 성별
	 */
	private String gender;
	/**
	 * Default Constructor
	 */
	public DogDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	public DogDTO(String id, int dogNo, String bdate, String name, String intro, String neutralization, int imgNo,
			int categoryNo, String gender, int age) {
		super();
		this.id = id;
		this.dogNo = dogNo;
		this.bdate = bdate;
		this.name = name;
		this.intro = intro;
		this.neutralization = neutralization;
		this.imgNo = imgNo;
		this.categoryNo = categoryNo;
		this.gender = gender;
		this.age=age;
	}	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDogNo() {
		return dogNo;
	}
	public void setDogNo(int dogNo) {
		this.dogNo = dogNo;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getNeutralization() {
		return neutralization;
	}
	public void setNeutralization(String neutralization) {
		this.neutralization = neutralization;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getImgNo() {
		return imgNo;
	}
	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "DogDTO [id=" + id + ", dogNo=" + dogNo + ", bdate=" + bdate + ", age=" + age + ", name=" + name
				+ ", intro=" + intro + ", neutralization=" + neutralization + ", imgNo=" + imgNo + ", categoryNo=" + categoryNo + ", gender=" + gender + "]";
	}
}
