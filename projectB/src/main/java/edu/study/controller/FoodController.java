package edu.study.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.vo.BoardVo;

import edu.study.vo.MemberVo;
import edu.study.vo.ReviewVo;

@RequestMapping(value="/food")
@Controller 
public class FoodController {

	/*�Ĵ� ��� ������*/
	@RequestMapping(value="/foodList.do",method=RequestMethod.GET)
	public String list() {
		
	return "food/foodList";
	
	}
	
	@RequestMapping(value="/foodView.do",method=RequestMethod.GET)
	   public String view(HttpServletRequest req, Model model) {
	      System.out.println("session ��:" + req.getParameter("name"));
	      System.out.println("session ��:" + req.getParameter("category"));
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
	
	@RequestMapping(value="/reviewWrite.do",method=RequestMethod.POST)
	public String write(ReviewVo vo, HttpSession session) {

		//�α��� �� midx,nickname�� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setMidx(login.getMidx());
		vo.setWriter(login.getNickname());
		System.out.println(login.getMidx());
		System.out.println(login.getNickname());

	
		
		return "redirect:review.do";
	}
	
}
