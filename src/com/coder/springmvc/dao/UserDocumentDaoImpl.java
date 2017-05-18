package com.coder.springmvc.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coder.springmvc.entity.UserDocument;

@Repository
public class UserDocumentDaoImpl implements UserDocumentDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void save(UserDocument userDocument) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(userDocument);
		System.out.println("UserDocumentDaoImpl -> SAVE method is working...");
	}

	@Override
	public void delete(int Id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<UserDocument> query = currentSession.createQuery("delete from UserDocument where id=:theId",UserDocument.class);
		query.setParameter("theId", Id);
		query.executeUpdate();
	}

	@Override
	public UserDocument findById(int Id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDocument findByDescriptionName(String descriptionName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDocument getDocumentbyId(int i) {
		Session currentSession = sessionFactory.getCurrentSession();
		UserDocument usrDoc = currentSession.get(UserDocument.class, i);
		return usrDoc;
	}

}
