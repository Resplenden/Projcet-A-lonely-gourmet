package edu.study.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



//@ComponentScan(basePackages = {"edu.study.service.UserService"})
@RequestMapping(value="/member")
@Controller

public class memberController {
	
	@RequestMapping(value="/memberLogin.do",method=RequestMethod.GET)
	public String login() {
		
		
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String join() {
		
		return "member/memberJoin";
	}
}
