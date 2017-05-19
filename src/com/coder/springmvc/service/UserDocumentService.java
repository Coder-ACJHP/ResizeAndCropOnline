package com.coder.springmvc.service;

import com.coder.springmvc.entity.UserDocument;

public interface UserDocumentService {

	public void save(UserDocument userDocument);

	public UserDocument getLastDocument();

	public void deleteUserDoc();
	
}
