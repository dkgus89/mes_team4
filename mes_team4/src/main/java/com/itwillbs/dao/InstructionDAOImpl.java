package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.InstructionDTO;
import com.itwillbs.domain.OrderDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class InstructionDAOImpl implements InstructionDAO {
	@Inject
	private SqlSession sqlSession;
	
	static String namespace="com.itwillbs.mappers.instructionMapper";

	@Override
	public List<Map<String, Object>> getorderlist(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getorderlist()");
		
		return sqlSession.selectList(namespace +".getorderlist", pageDTO);
	}

	@Override
	public int getordercount(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getordercount()");
		
		return sqlSession.selectOne(namespace + ".getordercount", pageDTO);
	}

	@Override
	public OrderDTO orderinfo(String order_cd) {
		System.out.println("InstructionDAOImpl orderinfo()");
		
		return sqlSession.selectOne(namespace + ".orderinfo", order_cd);
	}

	@Override
	public List<InstructionDTO> instructionlist(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl instructionlist()");
		
		return sqlSession.selectList(namespace + ".instructionlist", pageDTO);
	}

	@Override
	public int getinstructioncount(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getinstructioncount()");
		
		return sqlSession.selectOne(namespace + ".getinstructioncount", pageDTO);
	}

	@Override
	public void instinsertpro(InstructionDTO instructionDTO) {
		System.out.println("InstructionDAOImpl instinsertpro()");
		
		sqlSession.insert(namespace + ".instinsertpro", instructionDTO);
	}

	@Override
	public InstructionDTO instructioninfo(String instruction_code) {
		System.out.println("InstructionDAOImpl instructioninfo()");
		
		return sqlSession.selectOne(namespace + ".instructioninfo", instruction_code);
	}

	@Override
	public List<Map<String, Object>> conslist(String order_cd) {
		System.out.println("InstructionDAOImpl conslist()");
		
		return sqlSession.selectList(namespace +".conslist", order_cd);
	}

	@Override
	public List<Map<String, Object>> getInstMap() {
		System.out.println("InstructionDAOImpl getInstMap()");
		
		return sqlSession.selectList(namespace +".getInstMap");
	}

	@Override
	public Map<String, Object> getInst(String instruction_code) {
		System.out.println("InstructionDAOImpl getInst()");
		
		return sqlSession.selectOne(namespace +".getInst", instruction_code);
	}

	@Override
	public void instupdatepro(InstructionDTO instructionDTO) {
		System.out.println("InstructionDAOImpl instupdatepro()");
		
		sqlSession.update(namespace +".instupdatepro", instructionDTO);
		
	}

	@Override
	public int getordercheck(String order_cd) {
		System.out.println("InstructionDAOImpl getordercheck()");
		
		return sqlSession.selectOne(namespace +".getordercheck", order_cd);
	}

	@Override
	public List<Map<String, Object>> getOrderListMap(PageDTO pageDTO) {
		System.out.println("InstructionDAOImpl getOrderListMap()");
		
		return sqlSession.selectList(namespace +".getOrderListMap", pageDTO);
	}

	@Override
	public void instdelete(String instruction_code) {
		System.out.println("InstructionDAOImpl instdelete()");
		
		sqlSession.delete(namespace +".instdelete", instruction_code);
		
	}

	@Override
	public void updateCon2(String cd) {
		System.out.println("InstructionDAOImpl updateCon2 생산중으로변경");
		
		sqlSession.update(namespace+".updateCon2",cd);
		
	}
	
	
	
	
}
