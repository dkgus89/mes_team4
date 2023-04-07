package com.itwillbs.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ConsumptionDTO;

public interface InstructionDAO {

	public List<Map<String, Object>> getorderlist(PageDTO pageDTO);

	public int getordercount(PageDTO pageDTO);

	public OrderDTO orderinfo(String order_cd);

	public List<InstructionDTO> instructionlist(PageDTO pageDTO);

	public int getinstructioncount(PageDTO pageDTO);

	public InstructionDTO instructioninfo(String instruction_code);

	public List<Map<String, Object>> conslist(String order_cd);

	public List<Map<String, Object>> getInstMap();

	public Map<String, Object> getInst(String instruction_code);

	public void instupdatepro(InstructionDTO instructionDTO);

	public int getordercheck(String order_cd);

	public List<Map<String, Object>> getOrderListMap(PageDTO pageDTO);

	public void instinsertpro(InstructionDTO instructionDTO);

	public void instdelete(String instruction_code);

	public void updateCon2(String cd);
	
	public void updateCon3(String cd);

	public List<Map<String, Object>> getConsListMap(String instruction_code);

	public String getInstDate(String instruction_code);

	public int getInstCount(String instruction_code);

	public String getInstCdname(String instruction_code);

	public String getInstPch(String product_cd_name);

	public String getWh_cd(String product_cd_name);

	public List<String> getcountcons(String cdname);

	




}
