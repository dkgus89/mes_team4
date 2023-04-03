package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

public interface OrderService {

	void insertOrder(OrderDTO orderDTO);

	public List<OrderDTO> getOrderList(PageDTO pageDTO);
	
	public int getOrderCount();

	void deleteOrder(String cd);

	public OrderDTO getOrder(String cd);

	public void updateOrder(OrderDTO orderDTO);
	

}
