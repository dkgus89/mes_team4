package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;

public interface StockDAO {

	public List<StockDTO> getStockList(PageDTO pageDTO);
	
	public int getStockCount();
	
	public void insertStock(StockDTO stockDTO);
	
	public StockDTO getStock(String stock_cd);
	
	public void updateStock(StockDTO stockDTO);
	
	public void deleteStock(String stock_cd);
}
