package com.sixidiot.withpet.model.dto;

import java.io.Serializable;

public class Authority implements Serializable {
	private static final long serialVersionUID = 5188280555844223102L;
	private String id;
	private String auth;
	private int categoryNo;
	
	public Authority(){}
	
	public Authority(String id, String auth) {
		super();
		this.id = id;
		this.auth = auth;
	}

	public Authority(String id, String auth, int categoryNo) {
		super();
		this.id = id;
		this.auth = auth;
		this.categoryNo = categoryNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Authority [id=" + id + ", auth=" + auth + ", categoryNo=" + categoryNo + "]";
	}
}
