package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ReplyLikeVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchVo;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<ReplyVo> replyListPage(SearchVo searchVo){
		
		return sqlSession.selectList("edu.study.mapper.replyMapper.replyListPage",searchVo);
	}

	public int count(int bidx) {
		
		return sqlSession.selectOne("edu.study.mapper.replyMapper.count",bidx);
	}
	
	public int writeReply(ReplyVo vo) {

		return sqlSession.insert("edu.study.mapper.replyMapper.writeReply",vo);
	}

	public int updateReply(ReplyVo vo) {
		
		return sqlSession.update("edu.study.mapper.replyMapper.updateReply",vo);
	}
	
	public int deleteReply(int ridx) {
		
		return sqlSession.delete("edu.study.mapper.replyMapper.deleteReply",ridx);
	}
	
	public ReplyVo selectReply(int ridx) {
		
		return sqlSession.selectOne("edu.study.mapper.replyMapper.selectReply",ridx);
	}
	
	public int writeRereply(ReplyVo vo) {
		
		return sqlSession.insert("edu.study.mapper.replyMapper.writeRereply",vo);
	}
	
	public int updateDepth(ReplyVo vo) {
		
		return sqlSession.update("edu.study.mapper.replyMapper.updateDepth",vo);
	}
	
	public int updateReplyLikeCnt(int ridx) {

		return sqlSession.update("edu.study.mapper.replyMapper.updateReplyLikeCnt",ridx);
	}

	public int updateReplyHateCnt(int ridx) {

		return sqlSession.update("edu.study.mapper.replyMapper.updateReplyHateCnt",ridx);
	}
	
	public int insertReplyLiketb(ReplyLikeVo vo) {

		return sqlSession.insert("edu.study.mapper.replyMapper.insertReplyLiketb",vo);
	}

	public int updateByReplyLikeCheck(ReplyLikeVo vo) {

		return sqlSession.update("edu.study.mapper.replyMapper.updateByReplyLikeCheck",vo);
	}
	
	public int updateByReplyHateCheck(ReplyLikeVo vo) {

		return sqlSession.update("edu.study.mapper.replyMapper.updateByReplyHateCheck",vo);
	}

	public int replyLikeCheck(ReplyLikeVo vo) {

		return sqlSession.selectOne("edu.study.mapper.replyMapper.replyLikeCheck",vo);
	}
}
