package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.DeliverDAO;
import com.itwillbs.domain.DeliverDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class DeliverServiceImpl implements DeliverService{
	
	//객체생성 부모 인터페이스 -> 자동으로 자식 클래스 객체생성
	@Inject
	private DeliverDAO deliverDAO;

	
	@Override
	public List<DeliverDTO> getDeliverList(PageDTO pageDTO) {
		System.out.println("DeliverServiceImpl getDeliverList()");
		//startRow endRow 구하기
		// 시작하는 행번호 구하기
		int startRow =(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndPage(endRow);
		
		return deliverDAO.getDeliverList(pageDTO);
	}
	
	
	
	@Override
	public void insertDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverServiceImpl insertDeliver()");
		
		//메소드 호출
	 deliverDAO.insertDeliver(deliverDTO);
	}




	@Override
	public DeliverDTO getDeliver(String deliver_cd) {
		System.out.println("DeliverServiceImpl getDeliver()");
		
		return deliverDAO.getDeliver(deliver_cd);
	}


	@Override
	public void updateDeliver(DeliverDTO deliverDTO) {
		System.out.println("DeliverServiceImpl updateDeliver()");
		
		deliverDAO.updateDeliver(deliverDTO);
	}



	@Override
	public int getDeliverCount(PageDTO pageDTO) {
		System.out.println("DeliverServiceImpl getDeliverCount()");
		return deliverDAO.getDeliverCount(pageDTO);
	}


	
	
	

	

}
