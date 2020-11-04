package service;

import java.util.List;

import dao.*;
import dto.ProductVo;

public class ProductServiceImpl implements ProductService{
	private ProductDao dao;
	
	public ProductServiceImpl() {
		dao = new ProductDaoImpl();
	}
	
	public int productCount() {
		return dao.productCount(); 
	}
	
	public void productInsert(ProductVo p) {
		dao.productInsert(p);
	}

	public List<ProductVo> productSelectAll() {
		return dao.productSelectAll();
	}
	
	public void productDelete(ProductVo p){
		dao.productDelete(p);
	}
	
	public ProductVo productSelect(String pcode) {
		return dao.productSelect(pcode);
	}
}
