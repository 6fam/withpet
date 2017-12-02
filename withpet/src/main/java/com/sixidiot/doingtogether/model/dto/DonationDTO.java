package com.sixidiot.doingtogether.model.dto;

/**
 * @테이블정보
 * @테이블명
 * 	-Donation<br>
 * @컬럼명
 * 	변수명		컬럼명				<br>
 * 	-donationOrg	=> donation_org	<br>
 *	-bankName		=> bank_name	<br>
 *	-accountNo 		=> account_no	<br>
 *	-account_host	=> accountHost 	<br>
 *	-current_money	=> currentMoney	<br>
 *	-dream_money	=> dreamMoney	<br>
 *	-donation_flag	=> donationFlag	<br>
 *	-category_no	=> donationStateNo
 * @클래스설명
 *  -모금함 게시판의 정보를 담고있는 클래스입니다.	<br>
 */
public class DonationDTO extends BoardDTO{
	/**
	 * 썸네일 번호 : thumnail_no
	 */
	private int thumnailNo;
	/**
	 * 단체 이름 : donation_org
	 */
	private String donationOrg;
	/**
	 * 은행 이름 : bank_name
	 */
	private String bankName;
	/**
	 * 계좌 번호 : account_no
	 */
	private String accountNo;
	/**
	 * 계좌주 : account_host
	 */
	private String accountHost;
	/**
	 * 현재 목므액 : current_money
	 */
	private int currentMoney;
	/**
	 * 총모금액 : final_money
	 */
	private int dreamMoney;
	/**
	 * 모금 권한 : donation_flag
	 */
	private int donationFlag;
	/**
	 * 모금 상태 : category_no
	 */
	private int donationStateNo;
	
	public DonationDTO() {
		super();
	}
	public DonationDTO(int thumnailNo, String donationOrg, String bankName, String accountNo, String accountHost,
			int currentMoney, int dreamMoney, int donationFlag, int donationStateNo) {
		super();
		this.thumnailNo = thumnailNo;
		this.donationOrg = donationOrg;
		this.bankName = bankName;
		this.accountNo = accountNo;
		this.accountHost = accountHost;
		this.currentMoney = currentMoney;
		this.dreamMoney = dreamMoney;
		this.donationFlag = donationFlag;
		this.donationStateNo = donationStateNo;
	}

	public int getThumnailNo() {
		return thumnailNo;
	}

	public void setThumnailNo(int thumnailNo) {
		this.thumnailNo = thumnailNo;
	}

	public String getDonationOrg() {
		return donationOrg;
	}

	public void setDonationOrg(String donationOrg) {
		this.donationOrg = donationOrg;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getAccountHost() {
		return accountHost;
	}

	public void setAccountHost(String accountHost) {
		this.accountHost = accountHost;
	}

	public int getCurrentMoney() {
		return currentMoney;
	}

	public void setCurrentMoney(int currentMoney) {
		this.currentMoney = currentMoney;
	}

	public int getDreamMoney() {
		return dreamMoney;
	}

	public void setDreamMoney(int dreamMoney) {
		this.dreamMoney = dreamMoney;
	}

	public int getDonationFlag() {
		return donationFlag;
	}

	public void setDonationFlag(int donationFlag) {
		this.donationFlag = donationFlag;
	}

	public int getDonationStateNo() {
		return donationStateNo;
	}

	public void setDonationStateNo(int donationStateNo) {
		this.donationStateNo = donationStateNo;
	}
	

	@Override
	public String toString() {
		return "DonationDTO [thumnailNo=" + thumnailNo + ", donationOrg=" + donationOrg + ", bankName=" + bankName
				+ ", accountNo=" + accountNo + ", accountHost=" + accountHost + ", currentMoney=" + currentMoney
				+ ", dreamMoney=" + dreamMoney + ", donationFlag=" + donationFlag
				+ ", donationStateNo=" + donationStateNo+", getImgPath()="+ getImgPath() + "]";
	}
}
