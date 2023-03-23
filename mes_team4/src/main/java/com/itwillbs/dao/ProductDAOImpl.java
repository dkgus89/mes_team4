package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
