package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

public interface ReleaseDAO {
	
	public List<ReleaseDTO> getRelList(PageDTO pageDTO);
	
	public int getRelCount(PageDTO pageDTO);
	
	public void insertrel(ReleaseDTO releaseDTO);
	
	public Integer getRNum();
}
