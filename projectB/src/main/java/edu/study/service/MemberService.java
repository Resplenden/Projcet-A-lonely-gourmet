package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;
import edu.study.vo.MemberVo;
import edu.study.vo.SearchCriteria;


public interface MemberService {
	
	List<MemberVo> list();
	
	int join(MemberVo vo);
	
	MemberVo selectMember(String email);
		
	int updatePw(MemberVo vo);
	
	int idCheck(String id);
	
	int nameCheck(String name);
	
	int emailCheck(String email);
	
	MemberVo login(MemberVo vo); //로그인
	
	MemberVo find_id(MemberVo vo); //아이디찾기
	
}
