package dao;

import java.util.List;

import dto.ProductVo;

public interface ProductDao {
	public int productCount();
	public void productInsert(ProductVo p);
	public void productDelete(ProductVo p);
	public ProductVo productSelect(String pcode);
	public List<ProductVo> productSelectAll();	
}
