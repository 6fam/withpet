package com.sixidiot.doingtogether.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-Member<br>
 * @컬럼명
 * 	변수명			컬럼명		<br>
 *	-id 		=> id			<br>
 *	-nick		=> nick 		<br>
 *	-password	=> password		<br>
 *	-tel		=> tel			<br>
 *	-pwAnswer	=> pw_answer	<br>
 *	-categoryNo	=> category_no	<br>
 * @클래스설명
 *  -회원정보를 관리하는 클래스입니다.<br>
 */
public class MemberDTO {
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	/*
	 * 회원 아이디 
	 * 컬럼명 : id
	 */
	private String id;
	/*
	 * 회원 닉네임 
	 * 컬럼명 : nick
	 */
	private String nick;
	/*
	 * 회원 비밀번호
	 * 컬럼명 : password
	 */
	private String password;
	/*
	 * 회원 전화번호 
	 * 컬럼명 : tel
	 */
	private String tel;
	/*
	 * 회원 비밀번호 찾기 답변
	 * 컬럼명 : pw_answer
	 */
	private String pwAnswer;
	/*
	 * 회원 비밀번호 찾기 질문 번호 
	 * 컬럼명 : category_no
	 */
	private String regdate;
	/*
	 * 회원 가입일자
	 */
	private String permitdate;
	/*
	 * 견주 승인날짜
	 */
	private int categoryNo;
	/**
	 * Default Constructor
	 */
	private String categoryName;
	/**
	 * 삭제 안한 총 메세지
	 */
	private int messageTotalCount;
	/**
	 * 안읽은 메세지
	 */
	private int notReadTotalCount;
	
	private DogDTO dogDTO;
	
	private String role;
	
	public MemberDTO() {
		super();
	}
	/**
	 * All has Constructor
	 */
	
	public MemberDTO(String id, String nick, String password, String tel, String pwAnswer, int categoryNo,
			DogDTO dogDTO) {
		super();
		this.id = id;
		this.nick = nick;
		this.password = password;
		this.tel = tel;
		this.pwAnswer = pwAnswer;
		this.categoryNo = categoryNo;
		this.dogDTO = dogDTO;
	}
	
	/**
	 * 전체회원리스트 
	 * @param id
	 * @param nick
	 * @param password
	 * @param tel
	 * @param pwAnswer
	 * @param categoryNo
	 * @param categoryName
	 */
	public MemberDTO(String id, String nick, String password, String tel, String pwAnswer, int categoryNo,
			String categoryName) {
		super();
		this.id = id;
		this.nick = nick;
		this.password = password;
		this.tel = tel;
		this.pwAnswer = pwAnswer;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}
	/**
	 * 11/27  회원 가입일자, 견주승인일자,메세지카운트,안읽은 메시지, 댕댕이has a
	 * @param id
	 * @param nick
	 * @param password
	 * @param tel
	 * @param pwAnswer
	 * @param regdate
	 * @param permitdate
	 * @param categoryNo
	 * @param categoryName
	 * @param messageTotalCount
	 * @param notReadTotalCount
	 * @param dogDTO
	 */
	public MemberDTO(String id, String nick, String password, String tel, String pwAnswer, String regdate,
			String permitdate, int categoryNo, String categoryName, int messageTotalCount, int notReadTotalCount,
			DogDTO dogDTO) {
		super();
		this.id = id;
		this.nick = nick;
		this.password = password;
		this.tel = tel;
		this.pwAnswer = pwAnswer;
		this.regdate = regdate;
		this.permitdate = permitdate;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.messageTotalCount = messageTotalCount;
		this.notReadTotalCount = notReadTotalCount;
		this.dogDTO = dogDTO;
	}
	public MemberDTO(String id, String nick, String password, String tel, String pwAnswer, int categoryNo,
			String categoryName, int messageTotalCount, int notReadTotalCount, DogDTO dogDTO) {
		super();
		this.id = id;
		this.nick = nick;
		this.password = password;
		this.tel = tel;
		this.pwAnswer = pwAnswer;
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.messageTotalCount = messageTotalCount;
		this.notReadTotalCount = notReadTotalCount;
		this.dogDTO = dogDTO;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getPwAnswer() {
		return pwAnswer;
	}
	public void setPwAnswer(String pwAnswer) {
		this.pwAnswer = pwAnswer;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	public DogDTO getDogDTO() {
		return dogDTO;
	}
	public void setDogDTO(DogDTO dogDTO) {
		this.dogDTO = dogDTO;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getMessageTotalCount() {
		return messageTotalCount;
	}
	public void setMessageTotalCount(int messageTotalCount) {
		this.messageTotalCount = messageTotalCount;
	}
	public int getNotReadTotalCount() {
		return notReadTotalCount;
	}
	public void setNotReadTotalCount(int notReadTotalCount) {
		this.notReadTotalCount = notReadTotalCount;
	}
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String getPermitdate() {
		return permitdate;
	}
	public void setPermitdate(String permitdate) {
		this.permitdate = permitdate;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", nick=" + nick + ", password=" + password + ", tel=" + tel + ", pwAnswer="
				+ pwAnswer + ", regdate=" + regdate + ", permitdate=" + permitdate + ", categoryNo=" + categoryNo
				+ ", categoryName=" + categoryName + ", messageTotalCount=" + messageTotalCount + ", notReadTotalCount="
				+ notReadTotalCount + ", dogDTO=" + dogDTO + ", role=" + role + "]";
	}

}
