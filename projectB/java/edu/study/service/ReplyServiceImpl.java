package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ReplyDAO;
import edu.study.vo.ReplyLikeVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchVo;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVo> replyListPage(SearchVo searchVo) {
		
		List<ReplyVo> replyList = replyDAO.replyListPage(searchVo);
		
		return replyList;
	}
	
	@Override
	public int count(int bidx) {
		
		return replyDAO.count(bidx);
	}
	
	@Override
	public int writeReply(ReplyVo vo) {

		return replyDAO.writeReply(vo);
	}

	@Override
	public int updateReply(ReplyVo vo) {
		
		return replyDAO.updateReply(vo);
	}

	@Override
	public int deleteReply(int ridx) {
	
		int result = replyDAO.deleteReply(ridx);
		
		return result;
	}

	@Override
	public ReplyVo selectReply(int ridx) {
		
		return replyDAO.selectReply(ridx);
	}

	@Override
	public int writeRereply(ReplyVo vo) {

		return replyDAO.writeRereply(vo);
	}

	@Override
	public int updateDepth(ReplyVo vo) {
		
		return replyDAO.updateDepth(vo);
	}

	@Override
	public int updateReplyLikeCnt(int ridx) {
		
		return replyDAO.updateReplyLikeCnt(ridx);
	}

	@Override
	public int updateReplyHateCnt(int ridx) {
		
		return replyDAO.updateReplyHateCnt(ridx);
	}
	
	@Override
	public int insertReplyLiketb(ReplyLikeVo vo) {
		
		return replyDAO.insertReplyLiketb(vo);
	}

	@Override
	public int updateByReplyLikeCheck(ReplyLikeVo vo) {
		
		return replyDAO.updateByReplyLikeCheck(vo);
	}
	

	@Override
	public int updateByReplyHateCheck(ReplyLikeVo vo) {
		
		return replyDAO.updateByReplyHateCheck(vo);
	}
	
	@Override
	public int replyLikeCheck(ReplyLikeVo vo) {
		
		return replyDAO.replyLikeCheck(vo);
	}

}
