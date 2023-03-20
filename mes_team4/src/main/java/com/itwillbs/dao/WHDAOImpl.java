package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.domain.WHDTO;

@Repository
public class WHDAOImpl implements WHDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.whMapper";
	
	@Override
	public void insertwh(WHDTO whdto) {
		System.out.println("WHDAOImpl insertwh()");
		
		sqlSession.insert(namespace+".insertwh", whdto);
		
	}

	@Override
	public WHDTO getWh(int wh_cd) {
		System.out.println("WHDAOImpl getWh()");
		return sqlSession.selectOne(namespace+".getWh", wh_cd);
	}
	
}
