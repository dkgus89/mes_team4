package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ConsumptionDAO;
import com.itwillbs.dao.PurchaseDAO;
import com.itwillbs.domain.ConsumptionDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PurchaseDTO;

@Service
public class PurchaseServiceImpl implements PurchaseService{
	
	@Inject 
	private PurchaseDAO purchaseDAO;
	
	@Override
	public List<Map<String, Object>> getPrList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getPrList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);  
		pageDTO.setEndRow(endRow);
		
		return purchaseDAO.getPrList(pageDTO);
	}
	
	@Override
	public int getPrCount(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getPrCount()");
		
		return purchaseDAO.getPrCount(pageDTO);
	}
	
	@Override
	public List<Map<String, Object>> getBsList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getBsList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);  
		pageDTO.setEndRow(endRow);
		
		return purchaseDAO.getBsList(pageDTO);
	}
	
	@Override
	public int getBsCount(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getBsCount()");
		
		return purchaseDAO.getBsCount(pageDTO);
	}
	
	@Override
	public List<Map<String, Object>> getEmList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getEmList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);  
		pageDTO.setEndRow(endRow);
		
		return purchaseDAO.getEmList(pageDTO);
	}
	
	@Override
	public int getEmCount(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getEmCount()");
		
		return purchaseDAO.getEmCount(pageDTO);
	}
	
	@Override
	public void insertPurchase(PurchaseDTO purchaseDTO) {
		System.out.println("ConsumptionServiceImpl insertPurchase()");
		
		purchaseDAO.insertPurchase(purchaseDTO);
	}
	
	@Override
	public String getPurchase_cd() {
		System.out.println("ConsumptionServiceImpl getPurchase_cd()");
		
		return purchaseDAO.getPurchase_cd();
	}
	
	@Override
	public List<PurchaseDTO> getPurchaseList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getCprConsmptList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return purchaseDAO.getPurchaseList(pageDTO);
	}
	
	@Override
	public List<Map<String, Object>> getPurchaseMapList(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getPurchaseMapList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize();
		int endRow = startRow + pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);  
		pageDTO.setEndRow(endRow);
		
		return purchaseDAO.getPurchaseMapList(pageDTO);
	}
	
	@Override
	public int getPurchaseCount(PageDTO pageDTO) {
		System.out.println("ConsumptionServiceImpl getCprConsmptCount()");
		
		return purchaseDAO.getPurchaseCount(pageDTO);
	}
	
	@Override
	public PurchaseDTO getPurchaseDTO(String purchase_cd) {
		System.out.println("ConsumptionServiceImpl getPurchaseDTO()");
		
		return purchaseDAO.getPurchaseDTO(purchase_cd);
	}
	
	@Override
	public void deletePurchase(String[] checkedValue) {
		System.out.println("ConsumptionServiceImpl deletePurchase()");
		
		purchaseDAO.deletePurchase(checkedValue);
	}
	
	@Override
	public void updatePurchase(PurchaseDTO purchaseDTO) {
		System.out.println("ConsumptionServiceImpl purchaseDTO()");
		
		purchaseDAO.updatePurchase(purchaseDTO);
	}
	
}// class
