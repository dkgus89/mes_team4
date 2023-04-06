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
//		만약 원자재이면 M넘 찾고, 완제품이면 P넘 찾음 
		if(whDTO.getWh_dv().equals("원자재")) {
			System.out.println(whDTO.getWh_dv());
			
			if(whDAO.getMNum()==null) {
				//원자재 없음
				whDTO.setWh_cd("M100");
			}else{
				//원자재 있음 => max(num)+1
				System.out.println("mnum 출력 : "+whDAO.getMNum());
				int num = whDAO.getMNum()+1;
				String str = "M" + num;
				whDTO.setWh_cd(str);
			}
		} else if(whDTO.getWh_dv().equals("완제품")) {
			if(whDAO.getPNum() == null) {
				whDTO.setWh_cd("P100");
			}else{
				int num = whDAO.getPNum()+1;
				String str = "P" + num;
				whDTO.setWh_cd(str);
			}
		}
		
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
	public int getWhCount(PageDTO pageDTO) {
		System.out.println("WHServiceImpl getWhCount()");
		
		return whDAO.getWhCount(pageDTO);
	}

	


	@Override
	public void deletewh(String wh_cd) {
		System.out.println("WHServiceImpl deletewh()");
		
		whDAO.deletewh(wh_cd);
	}

	@Override
	public WHDTO getwh(String wh_cd) {
		System.out.println("WHServiceImpl getwh()");
		
		return whDAO.getwh(wh_cd);
	}

	@Override
	public void updatewh(WHDTO whDTO) {
		System.out.println("WHServiceImpl updatewh()");
		
		whDAO.updatewh(whDTO);
	}

	

	



}
