package service;

import java.util.List;

import dao.MemberSelectDao;
import dao.MemberSelectDaoImpl;
import dto.MemberVo;

public class MemberSelectServiceImpl implements MemberSelectService {
	MemberSelectDao dao;
	
	public MemberSelectServiceImpl(){
		dao = new MemberSelectDaoImpl();
	}
	
	public List<MemberVo> selectAll(MemberVo m){
		return dao.selectAll(m);
	}
	
	public List<MemberVo> selectAll(){
		return dao.selectAll();
	}

}
