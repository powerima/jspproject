package service;

import java.util.List;

import dto.MemberVo;

public interface MemberService {
	public void insert(MemberVo m);
	public void delete(MemberVo m);
	public void update(MemberVo m);
	public MemberVo edit(int custno);
	public List<MemberVo> selectAll(MemberVo m);
	
}
