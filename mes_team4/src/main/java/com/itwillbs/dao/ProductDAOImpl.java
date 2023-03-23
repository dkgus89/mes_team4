package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.productMapper";
	
	@Override
	public void insertProduct(ProductDTO productDTO) {
		System.out.println("ProductDAOImpl insertProduct()");
		
		sqlSession.insert(namespace+".insertProduct", productDTO);
	}

	@Override
	public List<ProductDTO> getProductList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getProductList", pageDTO);
	}

	@Override
	public int getProductCount() {
		return sqlSession.selectOne(namespace+".getProductCount");
	}

	@Override
	public Integer getMaxNum() {
		System.out.println("ProductDAOImpl getMaxNum()");
		return sqlSession.selectOne(namespace+".getMaxNum");
	}

}
