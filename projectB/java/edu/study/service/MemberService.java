package edu.study.service;

import java.util.HashMap;

import java.util.List;

import javax.servlet.http.HttpSession;

import edu.study.vo.BoardVo;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;
import edu.study.vo.SearchCriteria;



public interface MemberService {
	
	
	MemberVo login(MemberVo vo); //로그인
	
	int loginCheck(MemberVo vo, HttpSession session);
	
	MemberVo find_id(MemberVo vo); //아이디찾기
	
	MemberVo selectMember(String email);
	
	int updatePw(MemberVo vo); //새 비밀번호
	
	int join(MemberVo vo); //회원가입
	
	int fileInsert(HashMap<String, Object>mfFile);
	
	MemberFileVo file(int midx);
	
	int idCheck(String id); //아이디 중복확인
	
	int nameCheck(String name); //이름 중복확인
	
	int nickCheck(String nickname); //닉네임 중복확인
	
	int emailCheck(String email); //이메일
	
	MemberVo profile(int midx); //회원 정보 조회
	
	int profileModify(MemberVo vo); //회원 정보 수정
	
	int fileUpdate(HashMap<String, Object>mfFile); //회원 사진 수정
	
	int unregister(MemberVo vo); //회원 정보 수정
	
	

}
