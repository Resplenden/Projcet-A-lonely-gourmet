package edu.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value="/foodView.do",method=RequestMethod.GET)
	   public String view(HttpServletRequest req, Model model) {
	      System.out.println("session 값:" + req.getParameter("name"));
	      System.out.println("session 값:" + req.getParameter("category"));
	      String name= req.getParameter("name");
	      String addr = req.getParameter("addr");
	      String category = req.getParameter("category");
	      String phone = req.getParameter("phone");
	      req.setAttribute("title", name);
	      req.setAttribute("addr", addr);
	      req.setAttribute("category", category);
	      req.setAttribute("phone", phone);
	   return "food/foodView1";
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
