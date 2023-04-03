package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.OrderDAO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class OrderServiceImpl implements OrderService{

	@Inject
	private OrderDAO orderDAO;
	
	@Override
	public void insertOrder(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl insertORder()");
		
		if(orderDAO.getMaxNum()==null) {
			
			orderDTO.setOrder_cd("OR1000");
		}else {
			int num = orderDAO.getMaxNum()+1;
			String str = "OR" + num;
			orderDTO.setOrder_cd(str);
		}
		orderDAO.insertOrder(orderDTO);
	}

	@Override
	public List<OrderDTO> getOrderList(PageDTO pageDTO) {
		System.out.println("OrderServiceImpl getOrderList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
				
		return orderDAO.getOrderList(pageDTO);
	}

	@Override
	public int getOrderCount() {
		System.out.println("OrderServiceImpl getOrderCount()");
		
		return orderDAO.getOrderCount();
	}

	@Override
	public void deleteOrder(String cd) {
		System.out.println("OrderServiceImpl deleteOrder()");
		
		orderDAO.deteleOrder(cd);
		
	}

	@Override
	public OrderDTO getOrder(String cd) {
		System.out.println("OrderServiceImpl getOrder()");
		
		return orderDAO.getOrder(cd);
	}

	@Override
	public void updateOrder(OrderDTO orderDTO) {
		System.out.println("OrderServiceImpl updateOrder()");
		
		orderDAO.updateOrder(orderDTO);
		
	}

}
