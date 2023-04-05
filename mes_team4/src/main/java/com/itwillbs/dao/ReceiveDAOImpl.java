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
	public void insertReceive(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAOImpl insertReceive()");
		
		sqlSession.insert(namespace+".insertReceive", receiveDTO);
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
	@Override
	public Integer getCNum() {
		
		return sqlSession.selectOne(namespace+".getCNum");
	}
	@Override
	public ReceiveDTO getReceive(String rec_schedule_cd) {
		System.out.println("ReceiveDAOImpl getReceive()");
		
		return sqlSession.selectOne(namespace+".getReceive",rec_schedule_cd);
	}
	@Override
	public void updateReceive(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAOImpl updateReceive()");
		
		sqlSession.update(namespace+".updateReceive", receiveDTO);
	}

}
