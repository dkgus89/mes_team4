package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.InfoDAO;
import com.itwillbs.domain.LineDTO;

@Service
public class InfoServiceImpl implements InfoService{

	// 객체생성 부모 인터페이스 => 자동으로 자식 클래스 객체생성
		@Inject
		private InfoDAO infoDAO;

		@Override
		public List<LineDTO> getLineList() {
			System.out.println("InfoServiceImpl getLineList()");

			
			return infoDAO.getLineList();
		}

		@Override
		public void insertLine(LineDTO lineDTO) {
			System.out.println("InfoServiceImpl insertLine()");
			
			infoDAO.insertLine(lineDTO);			
		}

		@Override
		public LineDTO getLine(String line_cd) {
			System.out.println("InfoServiceImpl getLine()");
			
			return infoDAO.getLine(line_cd);
		}

		@Override
		public void updateLine(LineDTO lineDTO) {
			System.out.println("InfoServiceImpl updateLine()");
			
			infoDAO.updateLine(lineDTO);
		}

		@Override
		public void deleteLine(String line_cd) {
			System.out.println("InfoServiceImpl deleteLine()");
			
			infoDAO.deleteLine(line_cd);
		}
}
