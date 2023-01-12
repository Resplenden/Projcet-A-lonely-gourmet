package edu.study.controller;


import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.UserService;

import edu.study.vo.UserVo;
@ComponentScan(basePackages = {"edu.study.service.UserService"})
@RequestMapping(value="/user")
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String list(Model model){
		
		List<UserVo> list = userService.list();
		
		model.addAttribute("datalist",list);
		
		return "user/l";
	}
	
	@RequestMapping(value="/view.do", method=RequestMethod.GET)
	public String view(int uidx, Model model) {
		
		UserVo vo = userService.selectByUidx(uidx);
		
		model.addAttribute("vo", vo);
		
		return "user/v";
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int uidx, Model model) {
		
		UserVo vo = userService.selectByUidx(uidx);
		
		model.addAttribute("vo", vo);
		
		return "user/m";
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.POST)
	public String modify(UserVo vo) {
		
		int result = userService.updateByUidx(vo);
		
		if(result>0) {
			return "redirect:view.do?uidx="+vo.getUidx();
		}else {
			return "redirect:/";
		}
	}	
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String login() {
		
		
		return "user/login";
	}
	
	/* 
	  �α��ι�ư Ŭ�� �� ����ڰ� �Է��� ���̵� �н����� ������ ��ġ�ϴ� usertb ������ controller���� ��ȸ�� ����
	*/
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login(UserVo vo, HttpSession session) {/* ����Ʈ Ÿ�� ���� UserVo�̱⿡ �Ű������� UserVo */
		
		
		//���⼭ ������ ��ȸ
		UserVo loginVo = userService.login(vo);
		if(loginVo != null) {
			session.setAttribute("login", loginVo);
			
			System.out.println(loginVo.toString());
		}
				
		return "redirect:/";
	}
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		
		return "user/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(UserVo vo) {
		
		int result = userService.join(vo);
		
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value="/idCheck.do", method=RequestMethod.POST)
	public String idCheck(String id) {
		
		int result = userService.idCheck(id);
		if(result>0) {
			return "1";	
		}else {
			return "0";
		}
			
		}	
	
}
