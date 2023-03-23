package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WHDTO;

public interface WHService {
	
	public void insertwh(WHDTO whdto);
	
	public List<WHDTO> getWhList(PageDTO pageDTO);
	
	public int getWhCount();
	
	public void updatewh(WHDTO whdto);
	
}
