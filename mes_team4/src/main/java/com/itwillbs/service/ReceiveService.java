package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ReceiveDTO;

public interface ReceiveService {

	public void insertReceive(ReceiveDTO receiveDTO);

	public List<ReceiveDTO> getReceiveList(PageDTO pageDTO);

	public int getReceiveCount(PageDTO pageDTO);

	public ReceiveDTO getReceive(String rec_schedule_cd);

	public void updateReceive(ReceiveDTO receiveDTO);
}
