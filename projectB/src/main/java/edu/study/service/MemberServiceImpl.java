package edu.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.study.dao.MemberDAO;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;



@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVo selectMember(String email) {
		// TODO Auto-generated method stub
		return memberDAO.selectMember(email);
	}

	@Override
	public int updatePw(MemberVo vo) {
		// TODO Auto-generated method stub
		return memberDAO.updatePw(vo);
	}

	@Override
	public List<MemberVo> list() {
		// TODO Auto-generated method stub
		return memberDAO.list();
	}

	@Override
	public int idCheck(String id) {
		// TODO Auto-generated method stub
		return memberDAO.idCheck(id);
	}

	@Override
	public int nameCheck(String name) {
		// TODO Auto-generated method stub
		return memberDAO.nameCheck(name);
	}

	@Override
	public int emailCheck(String email) {
		// TODO Auto-generated method stub
		return memberDAO.emailCheck(email);
	}

	@Override
	public int join(MemberVo vo) {
		// TODO Auto-generated method stub
		return memberDAO.join(vo);
	}

	@Override
	public MemberVo login(MemberVo vo) {
		
		return memberDAO.login(vo);
	}

	@Override
	public MemberVo find_id(MemberVo vo) {
		
		return memberDAO.find_id(vo);
	}

	@Override
	public int fileInsert(HashMap<String, Object> mfFile) {
		// TODO Auto-generated method stub
		return memberDAO.fileInsert(mfFile);
	}

	@Override
	public int nickCheck(String nickname) {
		// TODO Auto-generated method stub
		return memberDAO.nickCheck(nickname);
	}

	@Override
	public MemberFileVo file(int midx) {
		// TODO Auto-generated method stub
		return memberDAO.file(midx);
	}

	
	
	

	

	
	

	
}
