package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WHDAO;
import com.itwillbs.domain.WHDTO;


@Service
public class WHServiceImpl implements WHService{
	
	@Inject
	private WHDAO whDAO;
	
	@Override
	public void insertwh(WHDTO whdto) {
		System.out.println("WHServiceImpl insertwh()");
		
		whDAO.insertwh(whdto);
		
	}

	@Override
	public WHDTO getWh(int wh_cd) {
		System.out.println("WHServiceImpl getWh()");
		return whDAO.getWh(wh_cd);
	}
	
	

}
