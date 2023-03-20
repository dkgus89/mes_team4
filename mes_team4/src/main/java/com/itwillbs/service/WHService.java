package com.itwillbs.service;

import com.itwillbs.domain.WHDTO;

public interface WHService {
	
	public void insertwh(WHDTO whdto);
	
	public WHDTO getWh(int wh_cd);
}
