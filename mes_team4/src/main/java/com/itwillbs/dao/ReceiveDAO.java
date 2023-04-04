package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;

public interface ReceiveDAO {

	public void insertReceive(ReceiveDTO receiveDTO);

	public List<ReceiveDTO> getReciveList(PageDTO pageDTO);

	public int getReceiveCount(PageDTO pageDTO);

	public Integer getCNum();

}
