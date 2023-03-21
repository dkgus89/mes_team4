package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.PerformDAO;
import com.itwillbs.domain.PerformDTO;

@Service
public class PerformServiceImpl implements PerformService{

	// 객체생성 부모 인터페이스 => 자동으로 자식 클래스 객체생성
			@Inject
			private PerformDAO performDAO;

			@Override
			public List<PerformDTO> getPerformList() {
				System.out.println("PerformServiceImpl getPerformList()");

				return performDAO.getPerformList();
			}
}
