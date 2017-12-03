package com.sixfam.withpet.upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.sixfam.withpet.model.dto.ImgDTO;
import com.sixfam.withpet.model.dto.UploadDTO;

public class UploadFileImage<T extends UploadDTO> {
	private String uploadPath;

	/*
	 * 단일업로드
	 */
	public void setImageUpload(HttpServletRequest request, T dto) {
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir = new File(uploadPath);

		if (uploadDir.exists() == false)
			uploadDir.mkdirs();

		MultipartFile file = dto.getUploadFile();

		if (file != null && file.isEmpty() == false) {
			dto.setImgPath(file.getOriginalFilename());
			File uploadFile = new File(uploadPath + file.getOriginalFilename());
			try {
				file.transferTo(uploadFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	

	/*
	 * 다중 업로드
	 */
	public ArrayList<ImgDTO> setImageUploadList(HttpServletRequest request, T dto) {
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir = new File(uploadPath);
		ArrayList<ImgDTO> imgPath = new ArrayList<ImgDTO>();

		if (uploadDir.exists() == false)
			uploadDir.mkdirs();

		for (MultipartFile file : dto.getUploadFileList()) {
			if (file != null && file.isEmpty() == false) {
				dto.setImgPathList(imgPath);
				dto.getImgPathList().add(new ImgDTO(file.getOriginalFilename()));
				// dto.getImgPathList().add(file.getOriginalFilename());
				File uploadFile = new File(uploadPath + file.getOriginalFilename());
				try {
					file.transferTo(uploadFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
		}

		return imgPath;
	}
}
