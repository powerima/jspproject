package service;

import java.util.List;

import dao.T1106_SelectDaoImpl;
import model.T1106_TestVo;

public class T1106_SelectServiceImpl {
	private T1106_SelectDaoImpl dao;
	
	public T1106_SelectServiceImpl() {
		dao = new T1106_SelectDaoImpl();
	}
	
	public List<T1106_TestVo> select(){
		return dao.select();
	}
	
	
}
