package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.SystemDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SystemDTO;

@Service
public class SystemServiceImpl implements SystemService{
	
	@Inject
	private SystemDAO systemDAO;
	
	// 담당자이름 팝업 리스트 
	@Override
	public List<SystemDTO> getEnameList(PageDTO pageDTO) {
		System.out.println("SystemServiceImpl getEnameList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
		return systemDAO.getEnameList(pageDTO);
	}

	@Override
	public int getsystemcount() {
		System.out.println("SystemServiceImpl getsystemCount()");
		
		return systemDAO.getsystemcount();
	}

}
