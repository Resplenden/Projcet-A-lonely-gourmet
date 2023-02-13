package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.EventDAO;
import edu.study.vo.EventVo;

import edu.study.vo.SearchVo;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List<EventVo> list(SearchVo searchVo) {

		List<EventVo> list = eventDAO.list(searchVo);

		return list;
	}

	@Override
	public int count(SearchVo searchVo) {
		
		return eventDAO.count(searchVo);
	}

	@Override
	public EventVo selectByEidx(int eidx) {
		
		return eventDAO.selectByEidx(eidx);
	}

	@Override
	public int updateREC(int eidx) {
	
		return eventDAO.updateREC(eidx);
	}

	@Override
	public int write(EventVo vo) {
		
		return eventDAO.write(vo);
	}

	@Override
	public int modify(EventVo vo) {
		
		return eventDAO.modify(vo);
	}

	@Override
	public int delete(int eidx) {
		
		return eventDAO.delete(eidx);
	}
	
	

















































}