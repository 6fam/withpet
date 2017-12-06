package com.sixfam.withpet.common.exception;

public class InsufficientPay extends Exception{
	private static final long serialVersionUID = 2341729692827478933L;
	public InsufficientPay() {
		super("잔액이 부족합니다.");
	}
}
