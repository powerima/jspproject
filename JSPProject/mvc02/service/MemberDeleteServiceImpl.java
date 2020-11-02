package service;

import dao.MemberDeleteDao;
import dao.MemberDeleteDaoImpl;
import dto.MemberVo;

public class MemberDeleteServiceImpl implements MemberDeleteService{
	private MemberDeleteDao dao;
	
	public MemberDeleteServiceImpl() {
		dao = new MemberDeleteDaoImpl();
	}
	
	public void delete(MemberVo m) {
		dao.delete(m);
	}
}
