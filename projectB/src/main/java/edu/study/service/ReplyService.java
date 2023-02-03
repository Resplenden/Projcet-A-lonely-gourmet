package edu.study.service;

import java.util.List;

import edu.study.vo.ReplyLikeVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchVo;


public interface ReplyService {
	
	/* ��� ����(����¡)*/
	List<ReplyVo> replyListPage(SearchVo searchVo);
	
	/* ������ �Խñ��� ��� �� ����*/
	int count(int bidx);
	
	/* ��� ���� */
	int writeReply(ReplyVo vo);
	
	/* ��� ���� */
	int updateReply(ReplyVo vo);
	
	/* ��� ���� */
	int deleteReply(int ridx);
	
	/* ��� 1�� ��ȸ */
	ReplyVo selectReply(int ridx);

	/* ��� ���� */
	int writeRereply(ReplyVo vo);

	/* ��ۿ� ��� ����(depth ����) */
	int updateDepth(ReplyVo vo);
	
	/* ��� ��õ�� ���� */
	int updateReplyLikeCnt(int ridx);
	
	/* ��� ����õ�� ���� */
	int updateReplyHateCnt(int ridx);
	
	/* ��� ��õ */
	int insertReplyLiketb(ReplyLikeVo vo);
	
	/* ��� ��õ �ߺ� ���� */
	int updateByReplyLikeCheck(ReplyLikeVo vo);
	
	/* ��� ����õ �ߺ� ���� */
	int updateByReplyHateCheck(ReplyLikeVo vo);
	
	/* ��� ��õor����õ �ߺ����� üũ*/
	int replyLikeCheck(ReplyLikeVo vo);
}
