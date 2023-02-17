package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;
import edu.study.vo.LikeVo;
import edu.study.vo.SearchVo;

public interface BoardService {
	
	/* 게시물 조회(검색조건) */
	List<BoardVo> listPage(SearchVo searchVo);
	
	List<BoardVo> listView();
	
	/* 게시물 총 개수(검색조건) */
	int count(SearchVo searchVo);
	
	/* 글 쓰기 */
	int write(BoardVo vo);
	
	/* 글 상세보기 */
	BoardVo selectByBidx(int bidx);
	
	/* 조회수 */
	int hitCnt(int bidx);
	
	/* 글 수정 */
	int updateByBidx(BoardVo vo);
	
	/* 글 삭제 */
	int deleteByBidx(int bidx);
	
	/* 글 추천수 수정 */
	int updateLikeCnt(int bidx);
	
	/* 글 비추천수 수정 */
	int updateHateCnt(int bidx);

	/* 글 추천 */
	int insertLiketb(LikeVo vo);
	
	/* 글 추천 중복 방지 */
	int updateByLikeCheck(LikeVo vo);
	
	/* 글 비추천 중복 방지 */
	int updateByHateCheck(LikeVo vo);
	
	/* 글 추천or비추천 중복여부 체크*/
	int likeCheck(LikeVo vo);
	
	/* 게시물의 댓글 개수 수정*/
	int updateReplyCnt(int bidx);
}	