package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.PerformDAO;
import com.itwillbs.domain.LineDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PerformDTO;

@Service
public class PerformServiceImpl implements PerformService{

	// 객체생성 부모 인터페이스 => 자동으로 자식 클래스 객체생성
			@Inject
			private PerformDAO performDAO;

			@Override
			public List<PerformDTO> getPerformList(PageDTO pageDTO) {
				System.out.println("PerformServiceImpl getPerformList()");
				//시작하는 행번호 구하기
				int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
				int endRow = startRow+pageDTO.getPageSize()-1;
				
				pageDTO.setStartRow(startRow);
				pageDTO.setEndRow(endRow);
				
				return performDAO.getPerformList(pageDTO);
			}
			
			@Override
			public int getPerformCount() {
				System.out.println("PerformServiceImpl getPerformCount()");
				
				return performDAO.getPerformCount();
			}

			@Override
			public void insertPerform(PerformDTO performDTO) {
				System.out.println("PerformServiceImpl insertPerform()");
				
				performDAO.insertPerform(performDTO);
			}

			@Override
			public PerformDTO getPerform(String perform_cd) {
				System.out.println("PerformServiceImpl getPerform()");

				return performDAO.getPerform(perform_cd);
			}

			@Override
			public void updatePerform(PerformDTO performDTO) {
				System.out.println("PerformServiceImpl updatePerform()");
				
				performDAO.updatePerform(performDTO);
			}

			@Override
			public void deletePerform(String perform_cd) {
				System.out.println("PerformServiceImpl deletePerform()");
				
				performDAO.deletePerform(perform_cd);
			}
									
}
