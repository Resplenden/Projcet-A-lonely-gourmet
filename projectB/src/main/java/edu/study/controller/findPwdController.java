package edu.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value="/findPwd")
@Controller

public class findPwdController {
	
	@RequestMapping(value="/findPwd-fir", method=RequestMethod.GET)
	public String findPwd1(){
		
		return "findPwd/findPwd-fir";
		
	}
	
	
	@RequestMapping(value="/findPwd-sec", method=RequestMethod.GET)
	public String findPwd2(){
		
		return "findPwd/findPwd-sec";
		
	}
	
	@RequestMapping(value="/findPwd-thd", method=RequestMethod.GET)
	public String findPwd3(){
		
		return "findPwd/findPwd-thd";
		
	}
	
}
