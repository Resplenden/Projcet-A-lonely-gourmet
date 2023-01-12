package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BoardDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.SearchCriteria;


@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	
	

	@Override
	public BoardVo selectByBidx(int bidx) {
		
		return boardDAO.selectBybidx(bidx);
	}

	@Override
	public int updateByBidx(BoardVo vo) {
		// TODO Auto-generated method stub
		return boardDAO.updateByBidx(vo);
	}
	
	@Override
	public int insert(BoardVo vo) {
		
		return boardDAO.insert(vo);
	}

	@Override
	public int maxBidx() {
		
		return boardDAO.maxBidx();
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return boardDAO.listCount(scri);
	}

	@Override
	public List<BoardVo> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return boardDAO.listSearch(scri);
	}

	@Override
	public int delete(BoardVo vo) {
		// TODO Auto-generated method stub
		return boardDAO.delete(vo);
	}

	
	
	

	

	
	

	
}
