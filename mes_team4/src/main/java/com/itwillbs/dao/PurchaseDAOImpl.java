package com.itwillbs.dao;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseDTO;

@Repository
public class PurchaseDAOImpl implements PurchaseDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.PurchaseMapper";
	
	@Override
	public List<Map<String, Object>> getPrList(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getPrList()");
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectList(namespace+".getCpList", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectList(namespace+".getRpList", pageDTO);
		} 
		else {
			return null;
		}
	}   
	
	@Override
	public int getPrCount(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getPrCount()");
		
		if (pageDTO.getProduct_dv().equals("cp")) {
			return sqlSession.selectOne(namespace+".getCpCount", pageDTO);
		} 
		else if (pageDTO.getProduct_dv().equals("rp")) {
			return sqlSession.selectOne(namespace+".getRpCount", pageDTO);
		} 
		else {
			return 0;
		}
	} 
	
	@Override
	public List<Map<String, Object>> getBsList(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getBsList()");
		
		return sqlSession.selectList(namespace+".getBsList", pageDTO);
	}   
	
	@Override
	public int getBsCount(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getBsCount()");
		
		return sqlSession.selectOne(namespace+".getBsCount", pageDTO);
	} 
	
	@Override
	public List<Map<String, Object>> getEmList(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getEmList()");
		
		return sqlSession.selectList(namespace+".getEmList", pageDTO);
	}   
	
	@Override
	public int getEmCount(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getEmCount()");
		
		return sqlSession.selectOne(namespace+".getEmCount", pageDTO);
	} 
	
	@Override
	public void insertPurchase(PurchaseDTO purchaseDTO) {
		System.out.println("ConsumptionDAOImpl insertPurchase()");
		
		sqlSession.insert(namespace+".insertPurchase", purchaseDTO);
	}
	
	@Override
	public String getPurchase_cd() {
		System.out.println("ConsumptionDAOImpl getPurchase_cd()");
		
		return sqlSession.selectOne(namespace+".getPurchase_cd");
	}
	
	@Override
	public List<PurchaseDTO> getPurchaseList(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getCprConsmptList()");
		
		return sqlSession.selectList(namespace+".getPurchaseList", pageDTO);
	}
	
	@Override
	public int getPurchaseCount(PageDTO pageDTO) {
		System.out.println("ConsumptionDAOImpl getCprConsmptCount()");
		
		return sqlSession.selectOne(namespace+".getPurchaseCount", pageDTO);
	}
	
	@Override
	public PurchaseDTO getPurchaseDTO(String purchase_cd) {
		System.out.println("ConsumptionDAOImpl getPurchaseDTO()");
		
		return sqlSession.selectOne(namespace+".getPurchaseDTO", purchase_cd);
	}
	
	@Override
	public void deletePurchase(String[] checkedValue) {
		System.out.println("ConsumptionDAOImpl deletePurchase()");
		
		sqlSession.delete(namespace+".deletePurchase", Map.of("checkedValue" ,checkedValue));
	}
	
	@Override
	public void updatePurchase(PurchaseDTO purchaseDTO) {
		System.out.println("ConsumptionDAOImpl updatePurchase()");
		
		sqlSession.update(namespace+".updatePurchase", purchaseDTO);
	}
	
}// class
