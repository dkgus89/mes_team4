package com.itwillbs.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
		
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMdd");
		String today = now.format(formatter);
		
		System.out.println("오늘날짜:"+today);
		
		if(orderDAO.getMaxNum(today)==null) {
			
			orderDTO.setOrder_cd("OR"+today+"01");
		}else {
			
			int num = orderDAO.getMaxNum(today)+1;
			String new_num = String.valueOf(num).format("%02d", num);
			String str = "OR" + today + new_num;
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

	@Override
	public int getPCount() {
		System.out.println("OrderServiceImpl getPCount()");
		return orderDAO.getPCount();
	}

	@Override
	public int getFCount() {
		System.out.println("OrderServiceImpl getFCount()");
		return orderDAO.getFCount();
	}

	@Override
	public int getPCount(PageDTO pageDTO) {
		System.out.println("orderService search있는 p갯수구함");
		return orderDAO.getPCount(pageDTO);
	}

	@Override
	public int getFCount(PageDTO pageDTO) {
		System.out.println("orderService search있는 f갯수구함");
		return orderDAO.getFCount(pageDTO);
	}

}
