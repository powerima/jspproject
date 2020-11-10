package service;

import java.util.List;

import dao.*;
import dto.GuestVo;

public class GuestServiceImpl implements GuestService{
	private GuestDao dao;
	
	public GuestServiceImpl() {
		dao = new GuestDaoImpl();
	}
	
	public List<GuestVo> selectAll(int startRow, int endRow) {
		return dao.selectAll(startRow, endRow);
	}
	
	public int getCount() {
		return dao.getCount();
	}
}
