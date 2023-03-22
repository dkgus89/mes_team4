package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.DeliverDAO;
import com.itwillbs.domain.DeliverDTO;

@Service
public class DeliverServiceImpl implements DeliverService{
	
	//객체생성 부모 인터페이스 -> 자동으로 자식 클래스 객체생성
	@Inject
	private DeliverDAO deliverDAO;

	
	@Override
	public void insertDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverServiceImpl insertDeliver()");
		
		//메소드 호출
	 deliverDAO.insertDeliver(deliverDTO);
	}


	@Override
	public List<DeliverDTO> getDeliverList() {
		System.out.println("DeliverServiceImpl getDeliverList()");
		
		return deliverDAO.getDeliverList();
	}
	
	

	

}
