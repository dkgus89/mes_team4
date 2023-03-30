package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BusinessDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BusinessDAOImpl implements BusinessDAO{
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.BusinessMapper";

	// 거래처이름 팝업 리스트 
	@Override
	public List<BusinessDTO> getBnameList(PageDTO pageDTO) {
		System.out.println("BusinessDAOImpl getBnameList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getBnameList",pageDTO);
	}

	@Override
	public int getBusinessCount() {
		System.out.println("BusinessDAOImpl getBusinessCount()");
		
		return sqlSession.selectOne(namespace+".getBusinessCount");
	}

	
	

}
