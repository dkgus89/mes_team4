package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;
import com.itwillbs.domain.WHDTO;

public interface ReleaseService {
	
	public void insertrel(ReleaseDTO releaseDTO);
	
	public int getRelCount(PageDTO pageDTO);

	public List<Map<String, Object>> getRelList(PageDTO pageDTO);

	public List<Map<String, Object>> getBInstMap();

	public List<Map<String, Object>> getWInstMap();

	public List<Map<String, Object>> getPInstMap();

	public ReleaseDTO getrel(String rel_schedule_cd);

	public void updaterel(ReleaseDTO releaseDTO);

	



	
}
