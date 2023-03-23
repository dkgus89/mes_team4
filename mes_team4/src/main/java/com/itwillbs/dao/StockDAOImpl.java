package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class StockDAOImpl implements StockDAO {

	//마이바티스 자동 객체생성
	@Inject
	private SqlSession sqlSession;
		
	// sql구문 전체 이름 정의
	private static final String namespace="com.itwillbs.mappers.StockMapper";

	@Override
	public List<StockDTO> getStockList(PageDTO pageDTO) {
		System.out.println("InfoDAOImpl getStockList()");
		// limit #{startRow -1} , #{pageSize} 
		//        1-1, 10 => 1~10
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getStockList", pageDTO);
	}		

	@Override
	public int getStockCount() {
		System.out.println("InfoDAOImpl getStockCount()");
		
		return sqlSession.selectOne(namespace+".getStockCount");
	}

	@Override
	public void insertStock(StockDTO stockDTO) {
		System.out.println("InfoDAOImpl insertStock()");
		
		sqlSession.insert(namespace+".insertStock", stockDTO);			
	}

	@Override
	public StockDTO getStock(String stock_cd) {
		System.out.println("InfoDAOImpl getStock()");
		
		return sqlSession.selectOne(namespace+".getStock", stock_cd);
	}

	@Override
	public void updateStock(StockDTO stockDTO) {
		System.out.println("InfoDAOImpl updateStock()");
		
		sqlSession.update(namespace+".updateStock", stockDTO);
	}

	@Override
	public void deleteStock(String stock_cd) {
		System.out.println("InfoDAOImpl deleteStock()");
		
		sqlSession.delete(namespace+".deleteStock", stock_cd);
	}
}
