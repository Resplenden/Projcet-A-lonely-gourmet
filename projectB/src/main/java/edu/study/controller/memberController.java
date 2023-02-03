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
			//�꽦怨�
			//�씪移섑븯�뒗 �쉶�썝 �젙蹂닿� �엳�떎硫� �쉶�썝 �젙蹂대�� �꽭�뀡�뿉 �떞�뒗�떎
			model.addAttribute("msg", true);
			session.setAttribute("login", loginVO);
			
			
		} else {
			model.addAttribute("msg", false);
			return "redirect:/member/memberLogin.do";
		}
		
		return "redirect:/";
		
	}
	
	/* 濡쒓렇�븘�썐 */
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
		String pwd = passEncoder.encode(inputPwd); //�븫�샇�솕
		
		vo.setPwd(pwd); //vo�뿉 ���옣

		memberService.join(vo); //db�뿉 蹂대궦�떎
		
		return "member/memberLogin";
	}
	
	/*  以묐났寃��궗  */
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
	
	/* �땳�꽕�엫 以묐났寃��궗 */
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
	
	/* �씠硫붿씪 以묐났寃��궗 */
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
