package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;
import com.itwillbs.domain.StockDTO;

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
	public ReceiveDTO getPch_cd(String pch) {
		System.out.println("sql "+pch);
		
		return sqlSession.selectOne(namespace+".getPch_cd", pch);
	}
	@Override
	public int getReceiveCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+".getReceiveCount",pageDTO);
	}
	@Override
	public Integer getRECNum(String today) {
		
		return sqlSession.selectOne(namespace+".getRECNum",today);
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
	@Override
	public void deleteReceive(String rec_schedule_cd) {
		System.out.println("ReceiveDAOImpl deleteReceive()");
		
		sqlSession.delete(namespace+".deleteReceive",rec_schedule_cd);
	}
	@Override
	public void updateStockcount(StockDTO stockDTO) {
		System.out.println("ReceiveDAOImpl updateStockcount()");
		
		sqlSession.insert(namespace+".updateStockcount", stockDTO);
	}
	@Override
	public int getStock_count(String product_cd_name) {
		System.out.println("ReceiveDAOImpl getStock_count()");
		
		return sqlSession.selectOne(namespace+".getStock_count",product_cd_name);
	}
	@Override
	public ReceiveDTO getbfRec_count(ReceiveDTO receiveDTO) {
		System.out.println("ReceiveDAOImpl getbfRec_count()");
		
		return sqlSession.selectOne(namespace+".getbfRec_count", receiveDTO);
	}
	@Override
	public String getProduct_cd_name2(String rec_schedule_cd) {
		System.out.println("ReceiveDAOImpl getProduct_cd_name2()");
		
		return sqlSession.selectOne(namespace+".getProduct_cd_name2",rec_schedule_cd);
	}
	@Override
	public String getPchor_cd(String rec_schedule_cd) {
		System.out.println("ReceiveDAOImpl getPchor_cd()");
		
		return sqlSession.selectOne(namespace+".getPchor_cd",rec_schedule_cd);
	}
	@Override
	public int getSumRelCount(String pchor_cd) {
		System.out.println("ReceiveDAOImpl getSumRelCount()");
		
		return sqlSession.selectOne(namespace+".getSumRelCount",pchor_cd);
	}
	@Override
	public int getRel_count(String pchor_cd) {
		System.out.println("ReceiveDAOImpl getRel_count()");
		
		return sqlSession.selectOne(namespace+".getRel_count",pchor_cd);
	}
	@Override
	public int getpurcheck(String purchase_cd) {
		System.out.println("ReceiveDAOImpl getpurcheck()");
		
		return sqlSession.selectOne(namespace+".getpurcheck", purchase_cd);
	}
}
