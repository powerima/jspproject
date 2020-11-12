package service;

import dao.T1106_InsertDaoImpl;
import model.T1106_TestVo;

public class T1106_InsertServiceImpl {
	private T1106_InsertDaoImpl dao;
	
	public T1106_InsertServiceImpl() {
		dao = new T1106_InsertDaoImpl();
	}
	
	public void insert(T1106_TestVo t) {
		dao.insert(t);
	}
}
