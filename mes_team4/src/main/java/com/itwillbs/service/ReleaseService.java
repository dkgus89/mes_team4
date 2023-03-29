package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

public interface ReleaseService {
	
	public void insertrel(ReleaseDTO releaseDTO);
	
	public List<ReleaseDTO> getRelList(PageDTO pageDTO);
	
	public int getRelCount(PageDTO pageDTO);
	
	
}
