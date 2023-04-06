package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;
import com.itwillbs.domain.StockDTO;

public interface ReceiveDAO {

	public void insertReceive(ReceiveDTO receiveDTO);

	public List<ReceiveDTO> getReciveList(PageDTO pageDTO);
	
	public ReceiveDTO getPch_cd(String pch);

	public int getReceiveCount(PageDTO pageDTO);

	public Integer getCNum();

	public ReceiveDTO getReceive(String rec_schedule_cd);

	public void updateReceive(ReceiveDTO receiveDTO);

	public void deleteReceive(String rec_schedule_cd);

	public void updateStockcount(StockDTO stockDTO);

	public int getStock_count(String product_cd_name);

	public int getbfRec_count(String product_cd_name);

	public String getProduct_cd_name2(String rec_schedule_cd);

	public String getPchor_cd(String rec_schedule_cd);

}
