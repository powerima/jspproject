package dao;

import java.util.List;

import dto.*;

public interface MemberDao {
	public void insert(MemberVo m);
	public void delete(MemberVo m);
	public void update(MemberVo m);
	public MemberVo edit(int custno);
	public List<MemberVo> selectAll(MemberVo m);	
	public List<MemberMoneyVo> memberMoneyAll();
}
