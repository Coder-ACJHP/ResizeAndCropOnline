package com.coder.springmvc.dao;

import com.coder.springmvc.entity.UserDocument;

public interface UserDocumentDao {

	public void save(UserDocument userDocument);
	
	public void deleteUserDoc();
	
	public UserDocument findById(int Id);
	
	public UserDocument findByDescriptionName(String descriptionName);

	public UserDocument getLastDocument();
}
