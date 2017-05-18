package com.coder.springmvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coder.springmvc.dao.UserDocumentDao;
import com.coder.springmvc.entity.UserDocument;

@Service
public class UserDocumentServiceImpl implements UserDocumentService {

	@Autowired
	private UserDocumentDao userDocumentDao;
	
	@Override
	@Transactional
	public void save(UserDocument userDocument) {
		userDocumentDao.save(userDocument);
		System.out.println("UserDocumentServiceImpl -> SAVE method is working...");

	}

	@Override
	@Transactional
	public UserDocument getDocumentById(int i) {
		return userDocumentDao.getDocumentbyId(i);
		
	}

}
