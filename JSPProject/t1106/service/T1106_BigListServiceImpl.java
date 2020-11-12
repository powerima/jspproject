package service;

import java.util.List;

import dao.T1106_BigListDaoImpl;
import model.T1106_GuestVo;

public class T1106_BigListServiceImpl {
	private T1106_BigListDaoImpl dao;
	
	public T1106_BigListServiceImpl() {
		dao = new T1106_BigListDaoImpl();
	}
	
	public List<T1106_GuestVo> selectAll(int startRow, int endRow){
		return dao.selectAll(startRow, endRow);
	}
	
	public int getCount() {
		return dao.getCount();
	}
}
