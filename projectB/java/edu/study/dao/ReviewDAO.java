package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ReviewFileVo;
import edu.study.vo.ReviewLikeVo;
import edu.study.vo.ReviewVo;
import edu.study.vo.SearchVo;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession sqlSession;


	public int writeReview(ReviewVo vo) {
		
		return sqlSession.insert("edu.study.mapper.reviewMapper.writeReview",vo);
	}
	
	public List<ReviewVo> reviewListPage(SearchVo searchVo){
		
		return sqlSession.selectList("edu.study.mapper.reviewMapper.reviewListPage",searchVo);
	}
	
	public int reviewCount(ReviewVo reviewVo) {
		
		return sqlSession.selectOne("edu.study.mapper.reviewMapper.reviewCount",reviewVo);
	}
	
	public ReviewVo selectByVidx(int vidx) {

		return sqlSession.selectOne("edu.study.mapper.reviewMapper.selectByVidx",vidx);
	}
	
	public int updateReviewCnt(int vidx) {
		
		return sqlSession.update("edu.study.mapper.reviewMapper.updateReviewCnt",vidx);
	}
	
	public int updateLikeCnt(int vidx) {

		return sqlSession.update("edu.study.mapper.reviewMapper.updateLikeCnt",vidx);
	}
	
	public int insertReviewLiketb(ReviewLikeVo vo) {

		return sqlSession.insert("edu.study.mapper.reviewMapper.insertReviewLiketb",vo);
	}

	public int updateByLikeCheck(ReviewLikeVo vo) {

		return sqlSession.update("edu.study.mapper.reviewMapper.updateByLikeCheck",vo);
	}
	
	public int likeCheck(ReviewLikeVo vo) {

		return sqlSession.selectOne("edu.study.mapper.reviewMapper.likeCheck",vo);
	}
	

	public int reviewFile(ReviewFileVo vo) {

		return sqlSession.insert("edu.study.mapper.reviewMapper.reviewFile",vo);
	}
}