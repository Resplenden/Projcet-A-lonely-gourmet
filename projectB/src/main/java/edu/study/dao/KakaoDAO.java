package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.KakaoVo;
import edu.study.vo.SearchCriteria;


@Repository
public class KakaoDAO {	
	
	private SqlSession sqlSession;
	
	public static final String MAPPER = "edu.study.mapper.kakaoMapper";
	
	@Autowired
	public KakaoDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void kakaoinsert(HashMap<String,Object> userInfo) {
		sqlSession.insert(MAPPER+".insert",userInfo);
	}
	
	public KakaoVo findkakao(HashMap<String,Object> userInfo) {
		System.out.println("RE"+userInfo.get("nickname"));
		System.out.println("RE"+userInfo.get("email"));
		
		return sqlSession.selectOne(MAPPER+".kakao",userInfo);
	}
}