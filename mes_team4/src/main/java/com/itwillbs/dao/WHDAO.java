package com.itwillbs.dao;

import com.itwillbs.domain.WHDTO;

public interface WHDAO {
	
	public void insertwh(WHDTO whdto);
	
	public WHDTO getWh(int wh_cd);

}
