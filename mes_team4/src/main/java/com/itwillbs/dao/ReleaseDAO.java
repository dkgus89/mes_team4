package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReleaseDTO;

public interface ReleaseDAO {
	
	public int getRelCount(PageDTO pageDTO);
	
	public void insertrel(ReleaseDTO releaseDTO);
	
	public Integer getLNum();

	public List<Map<String, Object>> getInstMap();
	
	public List<Map<String, Object>> getRelList(PageDTO pageDTO);

	public ReleaseDTO getrel(String rel_schedule_cd);

	public void updaterel(ReleaseDTO releaseDTO);

	public void deleterel(String rel_schedule_cd);

	public String getRel_cd();





}
