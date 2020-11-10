package dao;

import java.util.List;

import dto.GuestVo;

public interface GuestDao {
	public List<GuestVo> selectAll(int startRow, int endRow, GuestVo g);
	public int getCount(GuestVo g);
}
