package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ReleaseDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

@Service
public class ReleaseServiceImpl implements ReleaseService{
	
	@Inject
	private ReleaseDAO releaseDAO;
	
	@Override
	public void insertrel(ReleaseDTO releaseDTO) {
		System.out.println("ReleaseServiceImpl insertrel()");
		
		if(releaseDAO.getLNum()==null) {
			//출고품목 없음
			releaseDTO.setRel_schedule_cd("L001");
			releaseDTO.setOut_complete("진행중");
		}else{
			//출고품목 => max(num)+1
			System.out.println("LNum 출력 : "+releaseDAO.getLNum());
			int num = releaseDAO.getLNum()+1;
			String str = "L00" + num;
			
			releaseDTO.setRel_schedule_cd(str);
			releaseDTO.setOut_complete("진행중");
		}
		
		
		releaseDAO.insertrel(releaseDTO);
	}
	
	
	@Override
	public int getRelCount(PageDTO pageDTO) {
		System.out.println("ReleaseServiceImpl getRelList()");
		
		return releaseDAO.getRelCount(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getRelList(PageDTO pageDTO) {
		System.out.println("ReleaseServiceImpl getRelList()");
		// 시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow= startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return releaseDAO.getRelList(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getBInstMap() {
		System.out.println("ReleaseServiceImpl getBInstMap()");
		
		return releaseDAO.getBInstMap();
	}

	@Override
	public List<Map<String, Object>> getWInstMap() {
		System.out.println("ReleaseServiceImpl getWInstMap()");
		
		return releaseDAO.getWInstMap();
	}

	@Override
	public List<Map<String, Object>> getPInstMap() {
		System.out.println("ReleaseServiceImpl getPInstMap()");
		
		return releaseDAO.getPInstMap();
	}





	

}
