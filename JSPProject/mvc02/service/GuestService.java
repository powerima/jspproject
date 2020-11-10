package service;

import java.util.List;

import dto.GuestVo;

public interface GuestService {
	public List<GuestVo> selectAll(int startRow, int endRow);
	public int getCount();
}
