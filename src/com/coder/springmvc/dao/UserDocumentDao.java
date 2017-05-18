package com.coder.springmvc.dao;

import com.coder.springmvc.entity.UserDocument;

public interface UserDocumentDao {

	public void save(UserDocument userDocument);
	
	public void delete(int Id);
	
	public UserDocument findById(int Id);
	
	public UserDocument findByDescriptionName(String descriptionName);

	public UserDocument getDocumentbyId(int i);
}
