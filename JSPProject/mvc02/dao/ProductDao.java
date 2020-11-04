package dao;

import java.util.List;

import dto.ProductVo;

public interface ProductDao {
	public void productInsert(ProductVo p);
	public List<ProductVo> productSelectAll();
}
