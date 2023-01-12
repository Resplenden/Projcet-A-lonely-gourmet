package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.UserDAO;
import edu.study.vo.UserVo;

/*구현클래스*/

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public List<UserVo> list(){			
			
		List<UserVo> list = userDAO.list();
			
		return list;
	}

	@Override
	public UserVo selectByUidx(int uidx) {
				
		return userDAO.selectByUidx(uidx);
	}

	@Override
	public int updateByUidx(UserVo vo) {
		
		return userDAO.updateByUidx(vo);
	}

	@Override
	public UserVo login(UserVo vo) {
		
		return userDAO.login(vo);
	}

	@Override
	public int join(UserVo vo) {
		
		return userDAO.join(vo);
	}

	@Override
	public int idCheck(String id) {		
		
		return userDAO.idCheck(id);
	}

	
}
