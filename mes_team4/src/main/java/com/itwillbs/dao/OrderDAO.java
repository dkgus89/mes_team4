package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

public interface OrderDAO {

	void insertOrder(OrderDTO orderDTO);
	
	public Integer getMaxNum(String today);
	
	public List<OrderDTO> getOrderList(PageDTO pageDTO);
	
	public int getOrderCount();

	void deteleOrder(String cd);
	
	public OrderDTO getOrder(String cd);
	
	public void updateOrder(OrderDTO orderDTO);
	
	public int getPCount();
	
	public int getFCount();
	
public int getPCount(PageDTO pageDTO);
	
	public int getFCount(PageDTO pageDTO);

	public String getProduct_cd_name(String order_cd);

	public int getSumRelCount(String order_cd);

	public int getbfOr_count(String order_cd);

}
