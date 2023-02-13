package edu.study.service;

import java.util.List;

import edu.study.vo.EventVo;
import edu.study.vo.SearchVo;

public interface EventService {
	
	List<EventVo> list(SearchVo searchVo);
	int count(SearchVo searchVo);
	EventVo selectByEidx(int eidx); 
	int updateREC(int eidx); //��ȸ��
	int write(EventVo vo); //�۾���
	int modify(EventVo vo);
	int delete(int eidx);
}
