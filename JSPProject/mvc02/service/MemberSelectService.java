package service;

import java.util.List;

import dto.MemberVo;

public interface MemberSelectService {
	public List<MemberVo> selectAll();
	public List<MemberVo> selectAll(MemberVo m);
}
