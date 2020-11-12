package service;

import dao.T1106_BigInsertDaoImpl;

public class T1106_BigInsertServiceImpl {
	private T1106_BigInsertDaoImpl dao;
	
	public T1106_BigInsertServiceImpl() {
		dao = new T1106_BigInsertDaoImpl();
	}
	
	public void insert() {
		dao.insert();
	}
	

}
