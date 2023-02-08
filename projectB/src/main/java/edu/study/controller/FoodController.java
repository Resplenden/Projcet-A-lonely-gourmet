package edu.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.vo.EventVo;

@RequestMapping(value="/food")
@Controller 
public class FoodController {

	/*식당 목록 페이지*/
	@RequestMapping(value="/foodList.do",method=RequestMethod.GET)
	public String list() {
		
	return "food/foodList";
	
	}
	
	/*식당 상세 페이지*/
	@RequestMapping(value="/foodView.do",method=RequestMethod.GET)
	public String view() {
		
	return "food/foodView";
	
	}
	
	/*리뷰 상세 페이지*/
	@RequestMapping(value="/review.do",method=RequestMethod.GET)
	public String review() {
		
	return "food/review";
	
	}
	
	/*리뷰 작성 페이지*/
	@RequestMapping(value="/reviewWrite.do",method=RequestMethod.GET)
	public String write() {
		
	return "food/reviewWrite";
	
	}
	
}
