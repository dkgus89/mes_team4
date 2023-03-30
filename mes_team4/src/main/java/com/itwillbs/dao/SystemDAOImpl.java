package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Repository
public class SystemDAOImpl implements SystemDAO {
	
	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.systemMapper";
	
	// 담당자이름 팝업 리스트 
	@Override
	public List<SystemDTO> getEnameList(PageDTO pageDTO) {
		System.out.println("SystemDAOImpl getEnameList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getEnameList",pageDTO);
	}

	@Override
	public int getsystemcount() {
		System.out.println("SystemDAOImpl getsystemcount()");
		
		return sqlSession.selectOne(namespace+".getsystemcount");
	}

}
