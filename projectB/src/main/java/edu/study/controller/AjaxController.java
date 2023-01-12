package edu.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.BoardService;
import edu.study.service.UserService;
import edu.study.vo.BoardVo;


@RequestMapping(value="/ajax")
@Controller
public class AjaxController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main() {
		return "ajax/main";
	}
	
	@ResponseBody //리턴값이 화면경로로 가는것이 아닌 그냥 문자열을 화면에 뿌려준다.
	@RequestMapping(value="/callString.do", method=RequestMethod.GET)
	public String callStr() {
		return "ajax test data!!";
	}
	
	@ResponseBody
	@RequestMapping(value="/callClick.do", method=RequestMethod.GET)
	public String callClick(String test1, String test2) {
		return test1+"_"+test2+"_ajax!!";
	}
	
	@ResponseBody
	@RequestMapping(value="/findBidx.do", method=RequestMethod.GET)
	public BoardVo findBidx(int bidx) {
		
		BoardVo vo = boardService.selectByBidx(bidx);
		
		return vo;
	}
	
	
	
	
	
	
}
