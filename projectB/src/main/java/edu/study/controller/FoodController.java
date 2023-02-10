package edu.study.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.vo.EventVo;

@RequestMapping(value="/food")
@Controller 
public class FoodController {

	/*�Ĵ� ��� ������*/
	@RequestMapping(value="/foodList.do",method=RequestMethod.GET)
	public String list() {
		
	return "food/foodList";
	
	}
	
	/*�Ĵ� �� ������*/
	@RequestMapping(value="/foodView.do",method=RequestMethod.GET)
	public String view(HttpSession session) {
		System.out.println("session ��:" + session);
		
	return "food/foodView1";
	
	}
	
	/*���� �� ������*/
	@RequestMapping(value="/review.do",method=RequestMethod.GET)
	public String review() {
		
	return "food/review";
	
	}
	
	/*���� �ۼ� ������*/
	@RequestMapping(value="/reviewWrite.do",method=RequestMethod.GET)
	public String write() {
		
	return "food/reviewWrite";
	
	}
	
}
