package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReceiveDAOImpl implements ReceiveDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.receiveMapper";
	
	@Override
	public void insertReceive(ReceiveDAO receiveDAO) {
		// TODO Auto-generated method stub
		
	}

}
