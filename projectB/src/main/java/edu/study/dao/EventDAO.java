package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.EventVo;
import edu.study.vo.SearchVo;

@Repository
public class EventDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<EventVo> list(SearchVo searchVo){
		
		return sqlSession.selectList("edu.study.mapper.eventMapper.list",searchVo);
	}
	
	//글개수
	public int count(SearchVo searchVo) {
		return sqlSession.selectOne("edu.study.mapper.eventMapper.count",searchVo);
	}
	
	public EventVo selectByEidx(int eidx) {
		return sqlSession.selectOne("edu.study.mapper.eventMapper.selectByEidx", eidx);
	}
	
	//조회수
	public int updateREC(int eidx) {
		return sqlSession.update("edu.study.mapper.eventMapper.updateREC", eidx);
	}
	
	//글쓰기
	public int write(EventVo vo) {
		return sqlSession.insert("edu.study.mapper.eventMapper.write", vo);
	}
	//글수정
	public int modify(EventVo vo) {
		return sqlSession.update("edu.study.mapper.eventMapper.modify", vo);
	}
	//글삭제
	public int delete(int eidx) {
		return sqlSession.delete("edu.study.mapper.eventMapper.delete", eidx);
	}
	
	
	
}