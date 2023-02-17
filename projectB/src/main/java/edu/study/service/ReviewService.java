package edu.study.service;

import java.util.List;

import edu.study.vo.ReviewFileVo;
import edu.study.vo.ReviewLikeVo;
import edu.study.vo.ReviewVo;
import edu.study.vo.SearchVo;

public interface ReviewService {
	
	/* ���� �ۼ� */
	int writeReview(ReviewVo vo);
	
	/* ���� ���(����¡) */
	List<ReviewVo> reviewListPage(SearchVo searchVo);
	
	/* ���� ���� ī��Ʈ*/
	int reviewCount(ReviewVo reviewVo);
	
	/* ���� �󼼺��� */
	ReviewVo selectByVidx(int vidx);
	
	/* ���� ��õ�� ���� */
	int updateLikeCnt(int vidx);

	/* ���� ��õ */
	int insertReviewLiketb(ReviewLikeVo vo);
	
	/* ���� ��õ �ߺ� ���� */
	int updateByLikeCheck(ReviewLikeVo vo);
	
	/* ���� ��õ �ߺ����� üũ*/
	int likeCheck(ReviewLikeVo vo);
	
	/* ���� ���Ͼ��ε�*/
	int reviewFile(ReviewFileVo vo);
	
	/* ���� ���� */
    int updateReview(ReviewVo vo);
   
    /* ���� ���� ���� */
    int updateReviewFile(ReviewVo vo);
   
    /* ���� ���� */
    int deleteReview(int vidx);
}	