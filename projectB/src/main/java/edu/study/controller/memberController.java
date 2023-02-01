package edu.study.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.MemberService;
import edu.study.vo.MemberVo;



//@ComponentScan(basePackages = {"edu.study.service.UserService"})
@RequestMapping(value="/member")
@Controller

public class memberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;

	@RequestMapping(value="/memberLogin.do",method=RequestMethod.GET)
	public String login() {

		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public String login(MemberVo vo, HttpSession session, Model model) {
		
		MemberVo loginVO = memberService.login(vo);
		
		boolean passMatch = passEncoder.matches(vo.getPwd(), loginVO.getPwd());
		System.out.println("passMatch"+passMatch);
		
		if (loginVO != null && passMatch) {
			//성공
			//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
			model.addAttribute("msg", true);
			session.setAttribute("login", loginVO);
			
			
		} else {
			model.addAttribute("msg", false);
			return "redirect:/member/memberLogin.do";
		}
		
		return "redirect:/";
		
	}
	
	/* 로그아웃 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String join() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(MemberVo vo) {
		
		String inputPwd = vo.getPwd();
		String pwd = passEncoder.encode(inputPwd); //암호화
		
		vo.setPwd(pwd); //vo에 저장

		memberService.join(vo); //db에 보낸다
		
		return "member/memberLoin";
	}
	
	/*  중복검사  */
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(String id) {
		int result = memberService.idCheck(id);

		if(result >0) {
			return "1";
		} else {
			return "0";
		}
	} 
	
	/* 닉네임 중복검사 */
	@ResponseBody
	@RequestMapping(value="/checkNick.do", method=RequestMethod.POST)
	public String checkNick(String nickname) {
		int result = memberService.nameCheck(nickname);
		
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	/* 이메일 중복검사 */
	@ResponseBody
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	public String checkEmail(String email) {
		int result = memberService.emailCheck(email);
		
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	
	
	
	
	
	
	
	
	
}
