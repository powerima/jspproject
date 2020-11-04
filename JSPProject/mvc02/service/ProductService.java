package service;

import java.util.List;

import dto.ProductVo;

public interface ProductService {
	public void productInsert(ProductVo p);
	public List<ProductVo> productSelectAll();
}
