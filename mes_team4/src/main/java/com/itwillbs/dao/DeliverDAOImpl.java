package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;



@Repository
public class DeliverDAOImpl implements DeliverDAO  {

	//마이바티스 자동 객체 생성
	@Inject
	private SqlSession sqlSession;
	
	//sql구문 이름 정의
	private static final String namespace="com.itwillbs.mappers.deliverMapper";

	
	@Override
	public List<DeliverDTO> getDeliverList(PageDTO pageDTO) {
		System.out.println("DeliverDAOImpl getDeliverList()");
		// startRow -1
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);		
		
		return sqlSession.selectList(namespace+".getDeliverList",pageDTO);
	}
	
	@Override
	public void insertDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverDAOImpl insertDeliver()");
		
		sqlSession.insert(namespace+".insertDeliver", deliverDTO);
	}

	@Override
	public DeliverDTO getDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverDAOImpl getDeliver()");
		
		return sqlSession.selectOne(namespace+".getDeliver", deliverDTO);
	}

	
	@Override
	public void updateDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverDAOImpl updateDeliver()");
		System.out.println(deliverDTO.getDeliver_cd());
	//	System.out.println(deliverDTO.getDeliver_cd());
		
		sqlSession.update(namespace+".updateDeliver", deliverDTO);
		
		
	}

	@Override
	public int getDeliverCount(PageDTO pageDTO) {
		System.out.println("DeliverDAOImpl getDeliverCount()");
		
		return sqlSession.selectOne(namespace+".getDeliverCount", pageDTO);
	}

	@Override
	public void deleteDeliver(String deliver_cd) {
		System.out.println("DeliverDAOImpl deleteDeliver()");
		
		sqlSession.delete(namespace+".deletDeliver", deliver_cd);
		
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("DeliverDAOImpl getInstMap()");
		
		
		return sqlSession.selectList(namespace+".getInstMap");
	}

	@Override
	public List<Map<String, Object>> getInstMap2() {
		System.out.println("DeliverDAOImpl getInstMap2()");
		
		
		return sqlSession.selectList(namespace+".getInstMap2");
	}

	@Override
	public List<Map<String, Object>> getInstMap3() {
		System.out.println("DeliverDAOImpl getInstMap2()");
		
		return sqlSession.selectList(namespace+".getInstMap3");
	}

	
	
	

}
