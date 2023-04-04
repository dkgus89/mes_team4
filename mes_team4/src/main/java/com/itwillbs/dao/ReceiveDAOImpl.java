package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;

@Repository
public class ReceiveDAOImpl implements ReceiveDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.receiveMapper";
	
	@Override
	public void insertReceive(ReceiveDAO receiveDAO) {
		// TODO Auto-generated method stub
	}
	@Override
	public List<ReceiveDTO> getReciveList(PageDTO pageDTO) {
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getReceiveList", pageDTO);
	}
	@Override
	public int getReceiveCount(PageDTO pageDTO) {
		return sqlSession.selectOne(namespace+".getReceiveCount",pageDTO);
	}

}
