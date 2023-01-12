package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BoardDAO;
import edu.study.dao.ReplyDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchCriteria;


@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVo> list(int bidx) {
		
		List<ReplyVo> list = replyDAO.list(bidx);
		
		return list;
	}

	@Override
	public int write(ReplyVo vo) {
		
		return replyDAO.write(vo);
	}

	
	
	
	

	
}
