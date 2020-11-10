package service;

import java.util.List;

import dao.T1110_StudentDaoImpl;
import model.T1110_StudentVo;

public class T1110_StudentServiceImpl {
	private T1110_StudentDaoImpl dao;
	
	public T1110_StudentServiceImpl() {
		dao = new T1110_StudentDaoImpl();
	}
	public int getSno() {
		return dao.getSno();
	}
	public List<T1110_StudentVo> selectAll(){
		return dao.selectAll();
	}
	
	public void insert(T1110_StudentVo s) {
		dao.insert(s);
	}
}
