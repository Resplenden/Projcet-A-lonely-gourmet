package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ReviewDAO;
import edu.study.vo.ReviewFileVo;
import edu.study.vo.ReviewLikeVo;
import edu.study.vo.ReviewVo;
import edu.study.vo.SearchVo;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int writeReview(ReviewVo vo) {
		
		return reviewDAO.writeReview(vo);
	}

	@Override
	public List<ReviewVo> reviewListPage(SearchVo searchVo) {

		List<ReviewVo> review = reviewDAO.reviewListPage(searchVo);
		
		return review;
	}

	@Override
	public int reviewCount(ReviewVo reviewVo) {
		
		return reviewDAO.reviewCount(reviewVo);
	}

	@Override
	public ReviewVo selectByVidx(int vidx) {
		
		return reviewDAO.selectByVidx(vidx);
	}

	@Override
	public int updateLikeCnt(int vidx) {
		
		return reviewDAO.updateLikeCnt(vidx);
	}

	@Override
	public int insertReviewLiketb(ReviewLikeVo vo) {
		
		return reviewDAO.insertReviewLiketb(vo);
	}

	@Override
	public int updateByLikeCheck(ReviewLikeVo vo) {
		
		return reviewDAO.updateByLikeCheck(vo);
	}

	@Override
	public int likeCheck(ReviewLikeVo vo) {
	
		return reviewDAO.likeCheck(vo);
	}

	@Override
	public int reviewFile(ReviewFileVo vo) {
		
		return reviewDAO.reviewFile(vo);
	}

	@Override
	public int updateReview(ReviewVo vo) {
	 
	 return reviewDAO.updateReview(vo);
	}
	
	@Override
	public int deleteReview(int vidx) {
	 
	 return reviewDAO.deleteReview(vidx);
	}
	
	@Override
	public int updateReviewFile(ReviewVo vo) {
	 
	 return reviewDAO.updateReviewFile(vo);
	}
















































}