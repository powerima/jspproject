package service;

import java.util.List;

import dao.*;
import dto.GuestVo;

public class GuestServiceImpl implements GuestService{
	private GuestDao dao;
	
	public GuestServiceImpl() {
		dao = new GuestDaoImpl();
	}
	
	public List<GuestVo> selectAll(int startRow, int endRow, GuestVo g) {
		return dao.selectAll(startRow, endRow, g);
	}
	
	public int getCount(GuestVo g) {
		return dao.getCount(g);
	}
}
