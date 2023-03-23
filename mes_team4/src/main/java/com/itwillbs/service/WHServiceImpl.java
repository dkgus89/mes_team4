package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WHDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WHDTO;


@Service
public class WHServiceImpl implements WHService{
	
	@Inject
	private WHDAO whDAO;
	
	@Override
	public void insertwh(WHDTO whDTO) {
		System.out.println("WHServiceImpl insertwh()");
		
//		if(whDAO.getMaxNum()==null) {
//			whDTO.setWh_cd("1");
//		}else {
//			whDTO.setWh_cd(whDAO.getMaxNum()+"1");
//		}
		
		whDAO.insertwh(whDTO);
		
	}

	@Override
	public List<WHDTO> getWhList(PageDTO pageDTO) {
		System.out.println("WHServiceImpl getWhList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
			
			return whDAO.getWhList(pageDTO);
	}

	@Override
	public int getWhCount() {
		System.out.println("WHServiceImpl getWhCount()");
		
		return whDAO.getWhCount();
	}

	
	@Override
	public void updatewh(WHDTO whdto) {
		System.out.println("WHServiceImpl updatewh()");
		
		whDAO.updatewh(whdto);
	



	
	}

}
