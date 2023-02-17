package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;
import edu.study.vo.LikeVo;
import edu.study.vo.SearchVo;

public interface BoardService {
	
	/* �Խù� ��ȸ(�˻�����) */
	List<BoardVo> listPage(SearchVo searchVo);
	
	List<BoardVo> listView();
	
	/* �Խù� �� ����(�˻�����) */
	int count(SearchVo searchVo);
	
	/* �� ���� */
	int write(BoardVo vo);
	
	/* �� �󼼺��� */
	BoardVo selectByBidx(int bidx);
	
	/* ��ȸ�� */
	int hitCnt(int bidx);
	
	/* �� ���� */
	int updateByBidx(BoardVo vo);
	
	/* �� ���� */
	int deleteByBidx(int bidx);
	
	/* �� ��õ�� ���� */
	int updateLikeCnt(int bidx);
	
	/* �� ����õ�� ���� */
	int updateHateCnt(int bidx);

	/* �� ��õ */
	int insertLiketb(LikeVo vo);
	
	/* �� ��õ �ߺ� ���� */
	int updateByLikeCheck(LikeVo vo);
	
	/* �� ����õ �ߺ� ���� */
	int updateByHateCheck(LikeVo vo);
	
	/* �� ��õor����õ �ߺ����� üũ*/
	int likeCheck(LikeVo vo);
	
	/* �Խù��� ��� ���� ����*/
	int updateReplyCnt(int bidx);
}	