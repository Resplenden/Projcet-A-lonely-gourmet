package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.LikeVo;
import edu.study.vo.SearchVo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public List<BoardVo> listPage(SearchVo searchVo){
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.listPage",searchVo);
	}
	
	public List<BoardVo> listView(){
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.listView");
	}
	
	public int count(SearchVo searchVo) {
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.count",searchVo);
	}
	
	public int write(BoardVo vo) {

		return sqlSession.insert("edu.study.mapper.boardMapper.write",vo);	
	}

	public BoardVo selectByBidx(int bidx) {

		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx",bidx);
	}

	public int hitCnt(int bidx) {

		return sqlSession.update("edu.study.mapper.boardMapper.hitCnt",bidx);		
	}

	public int updateByBidx(BoardVo vo) {

		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx",vo);	
	}

	public int deleteByBidx(int bidx) {

		return sqlSession.delete("edu.study.mapper.boardMapper.deleteByBidx", bidx);	
	}

	public int updateLikeCnt(int bidx) {

		return sqlSession.update("edu.study.mapper.boardMapper.updateLikeCnt",bidx);
	}
	
	public int updateHateCnt(int bidx) {
		
		return sqlSession.update("edu.study.mapper.boardMapper.updateHateCnt",bidx);
	}

	public int insertLiketb(LikeVo vo) {

		return sqlSession.insert("edu.study.mapper.boardMapper.insertLiketb",vo);
	}

	public int updateByLikeCheck(LikeVo vo) {

		return sqlSession.update("edu.study.mapper.boardMapper.updateByLikeCheck",vo);
	}
	
	public int updateByHateCheck(LikeVo vo) {
		
		return sqlSession.update("edu.study.mapper.boardMapper.updateByHateCheck",vo);
	}

	public int likeCheck(LikeVo vo) {

		return sqlSession.selectOne("edu.study.mapper.boardMapper.likeCheck",vo);
	}

	public int updateReplyCnt(int bidx) {
		
		return sqlSession.update("edu.study.mapper.boardMapper.updateReplyCnt",bidx);
	}
	
}