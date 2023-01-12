package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchCriteria;


public interface ReplyService {
		
	List<ReplyVo> list(int bidx);
	
	int write(ReplyVo vo);
}
		
		
		
		
