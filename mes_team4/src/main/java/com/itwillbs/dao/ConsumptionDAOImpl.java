package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;

@Repository
public class ConsumptionDAOImpl implements ConsumptionDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.ConsumptionMapper";
	
	@Override
	public List<Map<String, Object>> getPrList(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getPrList()");

		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectList(namespace+".getCpList", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectList(namespace+".getRpList", pageDTO);
		} 
		else {
			return null;
		}
	} 
	
	@Override
	public int getPrCount(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getPrCount()");
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectOne(namespace+".getCpCount", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectOne(namespace+".getRpCount", pageDTO);
		} 
		else {
			return 0;
		}
	} 
}
