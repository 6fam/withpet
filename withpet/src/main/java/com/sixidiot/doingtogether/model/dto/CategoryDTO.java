package com.sixidiot.doingtogether.model.dto;

public class CategoryDTO {
	/*
	 * 일정 번호 
	 * 컬럼명 : category_no
	 */
	private int categoryNo;
	/*
	 * 일정 번호 
	 * 컬럼명 : category_no
	 */
	private String tableCode;
	/*
	 * 일정 번호 
	 * 컬럼명 : category_name
	 */
	private String categoryName;
	public CategoryDTO() {
		super();
	}
	public CategoryDTO(int categoryNo, String tableCode, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.tableCode = tableCode;
		this.categoryName = categoryName;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getTableCode() {
		return tableCode;
	}
	public void setTableCode(String tableCode) {
		this.tableCode = tableCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "CategoryDTO [categoryNo=" + categoryNo + ", tableCode=" + tableCode + ", categoryName=" + categoryName
				+ "]";
	}
	
	
}
