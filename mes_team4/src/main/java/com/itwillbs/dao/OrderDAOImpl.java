package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.OrderMapper";
	
	@Override
	public Integer getMaxNum() {
		System.out.println("OrderDAOImpl getMaxNum()");

		return sqlSession.selectOne(namespace+".getMaxNum");
	}

	@Override
	public void insertOrder(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl insertOrder()");
		
		sqlSession.insert(namespace+".insertOrder",orderDTO);
		
	}

	@Override
	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		System.out.println("OrderDAOImpl getOrderList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
	
		return sqlSession.selectList(namespace+".getOrderList",pageDTO);
	}

	@Override
	public int getOrderCount() {
		System.out.println("OrderDAOImpl getOrderCount()");
		
		
		return sqlSession.selectOne(namespace+".getOrderCount");
	}

	@Override
	public void deteleOrder(String cd) {
		System.out.println("OrderDAOImpl deleteOrder()");
		
		sqlSession.delete(namespace+".deleteOrder",cd);
		
	}

	@Override
	public OrderDTO getOrder(String cd) {
		System.out.println("OrderDAOImpl getOrder()");
		
		return sqlSession.selectOne(namespace+".getOrder",cd);
	}

	@Override
	public void updateOrder(OrderDTO orderDTO) {
		System.out.println("OrderDAOImpl updateOrder()");
		
		sqlSession.update(namespace+".updateOrder",orderDTO);
	}

	

}
