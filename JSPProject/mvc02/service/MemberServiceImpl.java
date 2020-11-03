package service;

import java.util.List;

import dao.*;
import dto.MemberVo;

public class MemberServiceImpl implements MemberService{
	private MemberDao dao;
	
	public MemberServiceImpl() {
		dao = new MemberDaoImpl();
	}
	public void insert(MemberVo m) {
		dao.insert(m);
	}
	
	public void delete(MemberVo m) {
		dao.delete(m);
	}
	
	public void update(MemberVo m) {
		dao.update(m);
	}
	
	public MemberVo edit(int custno) {
		return dao.edit(custno);
	} 
	
	public List<MemberVo> selectAll(MemberVo m) {
		return dao.selectAll(m);
	}
}
