package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;

import edu.study.vo.SearchCriteria;


public interface BoardService {
			
	BoardVo selectByBidx(int bidx);

	int updateByBidx(BoardVo vo);
	
	int delete(BoardVo vo);
	
	int insert(BoardVo vo);
	
	int maxBidx();
	
	int listCount(SearchCriteria scri);

	List<BoardVo> list(SearchCriteria scri); 
}
