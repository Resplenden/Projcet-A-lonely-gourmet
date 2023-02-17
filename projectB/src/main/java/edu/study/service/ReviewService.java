package edu.study.service;

import java.util.List;

import edu.study.vo.ReviewFileVo;
import edu.study.vo.ReviewLikeVo;
import edu.study.vo.ReviewVo;
import edu.study.vo.SearchVo;

public interface ReviewService {
	
	/* 리뷰 작성 */
	int writeReview(ReviewVo vo);
	
	/* 리뷰 목록(페이징) */
	List<ReviewVo> reviewListPage(SearchVo searchVo);
	
	/* 리뷰 개수 카운트*/
	int reviewCount(ReviewVo reviewVo);
	
	/* 리뷰 상세보기 */
	ReviewVo selectByVidx(int vidx);
	
	/* 리뷰 추천수 수정 */
	int updateLikeCnt(int vidx);

	/* 리뷰 추천 */
	int insertReviewLiketb(ReviewLikeVo vo);
	
	/* 리뷰 추천 중복 방지 */
	int updateByLikeCheck(ReviewLikeVo vo);
	
	/* 리뷰 추천 중복여부 체크*/
	int likeCheck(ReviewLikeVo vo);
	
	/* 리뷰 파일업로드*/
	int reviewFile(ReviewFileVo vo);
	
	/* 리뷰 수정 */
    int updateReview(ReviewVo vo);
   
    /* 리뷰 파일 수정 */
    int updateReviewFile(ReviewVo vo);
   
    /* 리뷰 삭제 */
    int deleteReview(int vidx);
}	