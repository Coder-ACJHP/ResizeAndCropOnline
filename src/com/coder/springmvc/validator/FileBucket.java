package com.coder.springmvc.validator;

import org.springframework.web.multipart.MultipartFile;

public class FileBucket {
	
	private String description;
	
	private MultipartFile multipartFile;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}


}
