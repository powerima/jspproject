package dao;

import java.util.List;

import dto.MemberVo;

public interface MemberSelectDao {
	public List<MemberVo> selectAll();
	public List<MemberVo> selectAll(MemberVo m);
}
