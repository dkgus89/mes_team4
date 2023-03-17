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
		private InfoDAO InfoDAO;

		@Override
		public List<LineDTO> getLineList() {
			System.out.println("InfoServiceImpl getLineList()");

			
			return InfoDAO.getLineList();
		}
}
