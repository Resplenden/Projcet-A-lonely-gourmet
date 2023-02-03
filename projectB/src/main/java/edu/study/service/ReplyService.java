package edu.study.service;

import java.util.List;

import edu.study.vo.ReplyLikeVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchVo;


public interface ReplyService {
	
	/* 댓글 보기(페이징)*/
	List<ReplyVo> replyListPage(SearchVo searchVo);
	
	/* 선택한 게시글의 댓글 총 갯수*/
	int count(int bidx);
	
	/* 댓글 쓰기 */
	int writeReply(ReplyVo vo);
	
	/* 댓글 수정 */
	int updateReply(ReplyVo vo);
	
	/* 댓글 삭제 */
	int deleteReply(int ridx);
	
	/* 댓글 1개 조회 */
	ReplyVo selectReply(int ridx);

	/* 답글 쓰기 */
	int writeRereply(ReplyVo vo);

	/* 댓글에 답글 쓰기(depth 증가) */
	int updateDepth(ReplyVo vo);
	
	/* 댓글 추천수 수정 */
	int updateReplyLikeCnt(int ridx);
	
	/* 댓글 비추천수 수정 */
	int updateReplyHateCnt(int ridx);
	
	/* 댓글 추천 */
	int insertReplyLiketb(ReplyLikeVo vo);
	
	/* 댓글 추천 중복 방지 */
	int updateByReplyLikeCheck(ReplyLikeVo vo);
	
	/* 댓글 비추천 중복 방지 */
	int updateByReplyHateCheck(ReplyLikeVo vo);
	
	/* 댓글 추천or비추천 중복여부 체크*/
	int replyLikeCheck(ReplyLikeVo vo);
}
