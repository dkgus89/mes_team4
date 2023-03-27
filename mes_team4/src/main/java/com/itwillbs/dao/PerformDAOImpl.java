package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.LineDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PerformDTO;

@Repository
public class PerformDAOImpl implements PerformDAO {
	
	//마이바티스 자동 객체생성
		@Inject
		private SqlSession sqlSession;
			
		// sql구문 전체 이름 정의
		private static final String namespace="com.itwillbs.mappers.PerformMapper";

//		@Override
//		public List<PerformDTO> getPerformList(PageDTO pageDTO) {
//			System.out.println("PerformDAOImpl getPerformList()");
//			// limit #{startRow -1} , #{pageSize} 
//			//        1-1, 10 => 1~10
//			pageDTO.setStartRow(pageDTO.getStartRow()-1);
//			
//			return sqlSession.selectList(namespace+".getPerformList", pageDTO);
//		}
		
		@Override
		public int getPerformCount(PageDTO pageDTO) {
			System.out.println("PerformDAOImpl getPerformCount()");
			
			return sqlSession.selectOne(namespace+".getPerformCount", pageDTO);
		}

		@Override
		public void insertPerform(PerformDTO performDTO) {
			System.out.println("PerformDAOImpl insertPerform()");
			
			sqlSession.insert(namespace+".insertPerform", performDTO);
		}

//		@Override
//		public PerformDTO getPerform(String perform_cd) {
//			System.out.println("PerformDAOImpl getPerform()");
//			
//			return sqlSession.selectOne(namespace+".getPerform", perform_cd);
//		}
		
		@Override
		public void updatePerform(PerformDTO performDTO) {
			System.out.println("InfoDAOImpl updatePerform()");
			
			sqlSession.update(namespace+".updatePerform", performDTO);
		}

		@Override
		public void deletePerform(String perform_cd) {
			System.out.println("InfoDAOImpl deletePerform()");
			
			sqlSession.delete(namespace+".deletePerform", perform_cd);
		}

		@Override
		public List<Map<String, Object>> getInstMap() {
			System.out.println("InfoDAOImpl getInstMap()");
			
			return sqlSession.selectList(namespace+".getInstMap");
		}

		@Override
		public List<Map<String, Object>> getPerformMap(PageDTO pageDTO) {
			System.out.println("InfoDAOImpl getPerformMap()");
			// limit #{startRow -1} , #{pageSize} 
			//        1-1, 10 => 1~10
			pageDTO.setStartRow(pageDTO.getStartRow()-1);
			
			return sqlSession.selectList(namespace+".getPerformMap", pageDTO);
		}

		@Override
		public Map<String, Object> getPerform(String perform_cd) {
			System.out.println("InfoDAOImpl getPerform()");
			
			return sqlSession.selectOne(namespace+".getPerform", perform_cd);
		}

		@Override
		public Map<String, Object> getcallcdMap(String ic) {
			System.out.println("InfoDAOImpl getcallcdMap()");
			
			return sqlSession.selectOne(namespace+".getcallcdMap", ic);
		}
		
}
