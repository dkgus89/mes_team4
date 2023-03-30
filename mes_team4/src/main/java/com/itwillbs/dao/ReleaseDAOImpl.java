package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

@Repository
public class ReleaseDAOImpl implements ReleaseDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.relMapper";
	
	@Override
	public int getRelCount(PageDTO pageDTO) {
		System.out.println("ReleaseDAOImpl getRelCount()");
		return sqlSession.selectOne(namespace+".getRelCount", pageDTO);
	}

	@Override
	public void insertrel(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseDAOImpl insertrel()");
		
		sqlSession.insert(namespace+".insertrel", releaseDTO);
	}

	@Override
	public Integer getRNum() {
		System.out.println("ReleaseDAOImpl getRNum()");
		
		return sqlSession.selectOne(namespace+".getRNum");
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("ReleaseDAOImpl getInstMap()");
		
		return sqlSession.selectList(namespace+".getInstMap");
	}

	@Override
	public List<Map<String, Object>> getRelList(PageDTO pageDTO) {
System.out.println("ReleaseDAOImpl getRelList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getRelList",pageDTO);
	}

	}


