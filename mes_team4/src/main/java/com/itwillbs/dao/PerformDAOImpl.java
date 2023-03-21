package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PerformDTO;

@Repository
public class PerformDAOImpl implements PerformDAO {
	
	//마이바티스 자동 객체생성
		@Inject
		private SqlSession sqlSession;
			
		// sql구문 전체 이름 정의
		private static final String namespace="com.itwillbs.mappers.PerformMapper";

		@Override
		public List<PerformDTO> getPerformList() {
			System.out.println("PerformDAOImpl getPerformList()");
			
			return sqlSession.selectList(namespace+".getPerformList");
		}
}
