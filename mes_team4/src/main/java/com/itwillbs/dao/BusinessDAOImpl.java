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
	//sql구문의 전체 이름
	private static final String namespace="com.itwillbs.mappers.BusinessMapper";

	@Override
	public void insertBusiness(BusinessDTO businessDTO) {
		System.out.println("businessDAOImpl insertBusiness()");
		
		sqlSession.insert(namespace+".insertBusiness", businessDTO);
		
	}
	
	@Override
	public Integer getONum() {
		System.out.println("BusinessDAOImpl getONum()");
		
		return sqlSession.selectOne(namespace+".getONum");
	}
	
	@Override
	public Integer getPNum() {
		System.out.println("BusinessDAOImpl getPNum()");
		
		return sqlSession.selectOne(namespace+".getPNum");
	}

	@Override
	public int getBusinessCount() {
		System.out.println("businessDAOImpl getcount()");
		
		return sqlSession.selectOne(namespace+".getBusinessCount");
	}

	@Override
	public List<BusinessDTO> getBusinessList(PageDTO pageDTO) {
		System.out.println("BusinessDAOImpl getBusinessList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getBusinessList",pageDTO);
	}

	@Override
	public void deleteBusiness(String cd) {
		System.out.println("businessDAOImpl deleteBusiness()");
		sqlSession.delete(namespace+".deleteBusiness",cd);
	}

}
