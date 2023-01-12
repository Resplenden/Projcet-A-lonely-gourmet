package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;

import edu.study.vo.SearchCriteria;


@Repository
public class BoardDAO {/* 시스템외부 */
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVo> listSearch(SearchCriteria scri){
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch", scri);
		
	}	
	
	public BoardVo selectBybidx(int bidx) {
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx);
	}
	
	public int updateByBidx(BoardVo vo) {
				
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo);
	}
		
	public int insert(BoardVo vo) {
		
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}
	
	public int maxBidx() {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.maxBidx");
	}
	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount");
	}


	public int delete(BoardVo vo) {
	
	return sqlSession.update("edu.study.mapper.boardMapper.delete", vo);
	}
	
}