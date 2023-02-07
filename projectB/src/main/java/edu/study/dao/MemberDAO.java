package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;
import edu.study.vo.SearchCriteria;


@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
		
	public MemberVo selectMember(String email){		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.selectMember", email);			
	}
	
	public int join(MemberVo vo) {
		return sqlSession.insert("edu.study.mapper.memberMapper.join", vo);
	}
	
	public int updatePw(MemberVo vo) {
		
		return sqlSession.update("edu.study.mapper.memberMapper.updatePw", vo);
	}

	public List<MemberVo> list(){
		
		return sqlSession.selectList("edu.study.mapper.memberMapper.list");
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("edu.study.mapper.memberMapper.idCheck", id);
	}
	
	public int nameCheck(String name) {
		return sqlSession.selectOne("edu.study.mapper.memberMapper.nameCheck", name);
	}
	
	public int nickCheck(String nickname) {
		return sqlSession.selectOne("edu.study.mapper.memberMapper.nameCheck", nickname);
	}
	
	public int emailCheck(String email) {
		return sqlSession.selectOne("edu.study.mapper.memberMapper.emailCheck", email);
	}
	
	//濡쒓렇�씤
	public MemberVo login(MemberVo vo) {
			 
		return sqlSession.selectOne("edu.study.mapper.memberMapper.login", vo);
	}
	
	public int loginCheck(MemberVo vo) {
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.loginCheck", vo);
	}
		
	//�븘�씠�뵒李얘린
	public MemberVo find_id(MemberVo vo) {
		return sqlSession.selectOne("edu.study.mapper.memberMapper.find_id", vo);
	}
	
	public int fileInsert(HashMap<String, Object> mfFile) {
		// TODO Auto-generated method stub
		return sqlSession.update("edu.study.mapper.memberMapper.fileInsert", mfFile);
	}
	
	public MemberFileVo file(int midx){		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.file", midx);
	}
	
	
}