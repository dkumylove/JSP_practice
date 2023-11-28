package com.momo.book.service;

import java.io.IOException;

import com.oreilly.servlet.MultipartRequest;

import jakarta.servlet.http.HttpServletRequest;

public class FileUploadService_9 {
	private int maxSize = 1024*1000;
	private String uploadDir = "c:/app/jsp/upload";
	private String encode = "utf-8";
	
	public FileUploadService_9() {
		
	}

	public FileUploadService_9(int maxSize, String uploadDir, String encode) {
		super();
		this.maxSize = maxSize;
		this.uploadDir = uploadDir;
		this.encode = encode;
	}
	
	public int fileUpload(HttpServletRequest request) {
		int res= 0;
		
		try {
			MultipartRequest mr = new MultipartRequest(request, uploadDir, maxSize, encode);
			String fileName = mr.getFilesystemName(uploadDir);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	/**
	 * 파일의 이름을 변경하고 이름을 반환
	 * 	- 중복된파일명의 경우 소실될 위험이 있으므로 파일명을 변경
	 * @return
	 */
	public String rename() {
		
	}
}
