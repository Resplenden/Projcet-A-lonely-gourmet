package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchCriteria;


@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
		
	public List<ReplyVo> list(int bidx){
		return sqlSession.selectList("edu.study.mapper.replyMapper.list", bidx);
	}	
		
	public int write(ReplyVo vo) {
		return sqlSession.insert("edu.study.mapper.replyMapper.replyWrite", vo);
	}
	
	
}