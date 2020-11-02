package service;

import dao.FormDao;
import dao.FormDaoImpl;
import dto.MemberVo;

public class FormServiceImpl implements FormService {
	private FormDao dao;
	
	public FormServiceImpl() {
		dao = new FormDaoImpl();
	}
	public void insert(MemberVo m) {
		dao.insert(m);
	}

}
