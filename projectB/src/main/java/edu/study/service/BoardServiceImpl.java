package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BoardDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.LikeVo;
import edu.study.vo.SearchVo;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVo> listPage(SearchVo searchVo) {

		List<BoardVo> list = boardDAO.listPage(searchVo);

		return list;
	}
	
	
	@Override
	public int count(SearchVo searchVo) {
		
		return boardDAO.count(searchVo);
	}
	
	@Override
	public int write(BoardVo vo) {

		return boardDAO.write(vo);
	}

	@Override
	public BoardVo selectByBidx(int bidx) {

		return boardDAO.selectByBidx(bidx);
	}

	@Override
	public int hitCnt(int bidx) {

		return boardDAO.hitCnt(bidx);
	}

	@Override
	public int updateByBidx(BoardVo vo) {

		return boardDAO.updateByBidx(vo);
	}

	@Override
	public int deleteByBidx(int bidx) {

		return boardDAO.deleteByBidx(bidx);
	}

	@Override
	public int updateLikeCnt(int bidx) {

		return boardDAO.updateLikeCnt(bidx);
	}
	
	@Override
	public int updateHateCnt(int bidx) {
		
		return boardDAO.updateHateCnt(bidx);
	}

	@Override
	public int insertLiketb(LikeVo vo) {

		return boardDAO.insertLiketb(vo);
	}

	@Override
	public int updateByLikeCheck(LikeVo vo) {

		return boardDAO.updateByLikeCheck(vo);
	}

	@Override
	public int updateByHateCheck(LikeVo vo) {
		
		return boardDAO.updateByHateCheck(vo);
	}
	
	@Override
	public int likeCheck(LikeVo vo) {

		return boardDAO.likeCheck(vo);
	}


	@Override
	public int updateReplyCnt(int bidx) {
		
		return boardDAO.updateReplyCnt(bidx);
	}


	@Override
	public List<BoardVo> listView() {
		List<BoardVo> list2 = boardDAO.listView();
		return list2;
	}



	



	
	

















































}