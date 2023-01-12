package edu.study.service;

import java.util.List;


import edu.study.vo.UserVo;


public interface UserService {
	
	public List<UserVo> list();
	
	UserVo selectByUidx(int uidx);
	
	int updateByUidx(UserVo vo);
	
	UserVo login(UserVo vo);
	
	int join(UserVo vo);
	
	int idCheck(String id);
}
