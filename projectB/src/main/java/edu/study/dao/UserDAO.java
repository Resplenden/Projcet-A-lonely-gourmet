package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.UserVo;

@Repository
public class UserDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<UserVo> list(){
		
		return sqlSession.selectList("edu.study.mapper.userMapper.list");
	}
	
	public UserVo selectByUidx(int uidx) {
				
		return sqlSession.selectOne("edu.study.mapper.userMapper.selectByUidx", uidx);
	}
	
	public int updateByUidx(UserVo vo) {
		
		return sqlSession.update("edu.study.mapper.userMapper.updateByUidx", vo);
	}
	
	public UserVo login(UserVo vo){
		
		return sqlSession.selectOne("edu.study.mapper.userMapper.login", vo);
	}
	
	public int join(UserVo vo) {
		return sqlSession.insert("edu.study.mapper.userMapper.join", vo);
	}
	
	public int idCheck(String id) {
		return sqlSession.selectOne("edu.study.mapper.userMapper.idCheck", id);
	}
	
}
