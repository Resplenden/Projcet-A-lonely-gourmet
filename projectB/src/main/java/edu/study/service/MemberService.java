package edu.study.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import edu.study.vo.BoardVo;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;
import edu.study.vo.SearchCriteria;


public interface MemberService {
	
	List<MemberVo> list();
	
	int join(MemberVo vo);
	
	MemberVo selectMember(String email);
		
	int updatePw(MemberVo vo);
	
	int idCheck(String id);
	
	int nameCheck(String name);
	
	int nickCheck(String nickname);
	
	int emailCheck(String email);
	
	MemberVo login(MemberVo vo); //濡쒓렇�씤
	
	int loginCheck(MemberVo vo, HttpSession session);

	MemberVo find_id(MemberVo vo); //�븘�씠�뵒李얘린
	
	int fileInsert(HashMap<String, Object>mfFile);
	
	MemberFileVo file(int midx);
}
