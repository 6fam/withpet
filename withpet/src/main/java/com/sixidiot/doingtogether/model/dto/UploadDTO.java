package com.sixidiot.doingtogether.model.dto;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class UploadDTO {

	/*
	 * 파일업로드 변수
	 */
	private MultipartFile uploadFile;
	/*
	 * 이미지 주소
	 */
	private String imgPath;
	
	/*
	 * 파일업로드 여러개 받는 변수
	 */
	private ArrayList<MultipartFile> uploadFileList;
	
	/*
	 * 이미지 주소 여러개 받는 변수
	 */
	private ArrayList<ImgDTO> imgPathList;
	
	public UploadDTO() {
		super();
	}
	
	public UploadDTO(MultipartFile uploadFile) {
		super();
		this.uploadFile = uploadFile;
	}

	public UploadDTO(MultipartFile uploadFile, String imgPath, ArrayList<MultipartFile> uploadFileList,
			ArrayList<ImgDTO> imgPathList) {
		super();
		this.uploadFile = uploadFile;
		this.imgPath = imgPath;
		this.uploadFileList = uploadFileList;
		this.imgPathList = imgPathList;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public ArrayList<MultipartFile> getUploadFileList() {
		return uploadFileList;
	}

	public void setUploadFileList(ArrayList<MultipartFile> uploadFileList) {
		this.uploadFileList = uploadFileList;
	}

	public ArrayList<ImgDTO> getImgPathList() {
		return imgPathList;
	}

	public void setImgPathList(ArrayList<ImgDTO> imgPathList) {
		this.imgPathList = imgPathList;
	}

	@Override
	public String toString() {
		return "UploadDTO [uploadFile=" + uploadFile + ", imgPath=" + imgPath + ", uploadFileList=" + uploadFileList
				+ ", imgPathList=" + imgPathList + "]";
	}
}
