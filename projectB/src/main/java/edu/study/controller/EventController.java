package edu.study.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.EventService;

import edu.study.vo.EventVo;
import edu.study.vo.MemberVo;
import edu.study.vo.PageMaker;
import edu.study.vo.SearchVo;


@RequestMapping(value="/event")
@Controller
public class EventController{

	@Autowired
	private EventService eventService;
	
	
	/* 글 목록 보기(검색,페이징) */
	@RequestMapping(value="/list.do",method=RequestMethod.GET)
	public String list(EventVo vo,Model model, @ModelAttribute("searchVo") SearchVo searchVo) {
		
		//게시글 보기
		List<EventVo> list = eventService.list(searchVo);
		model.addAttribute("list",list);
		model.addAttribute("searchVo",searchVo);
		
		//페이징
		PageMaker pageMaker = new PageMaker(eventService.count(searchVo),searchVo);
		pageMaker.setSearchVo(searchVo);	
		model.addAttribute("pageMaker",pageMaker);
		
		return "event/list";	
	}
	
	@RequestMapping(value="/view.do",method=RequestMethod.GET)
	public String view(int eidx,Model model) {
		eventService.updateREC(eidx);//조회수
		EventVo vo =  eventService.selectByEidx(eidx); 
		System.out.println("vo:"+vo);
		model.addAttribute("vo",vo);
		
		return "event/view";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write() {
		
		return "event/write";
	}
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write(EventVo vo) {
		
		eventService.write(vo);
		
		return "redirect:list.do";
		
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int eidx, Model model) {
		
		EventVo vo = eventService.selectByEidx(eidx);
		
		model.addAttribute("vo", vo);
		
		return "event/modify";
	}
	
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(EventVo vo) {
		
		int result = eventService.modify(vo);
		
		if(result > 0) {
			return "redirect:view.do?eidx="+vo.getEidx();
		} else {
			return "event/list";
		}
	
	}
	

	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(int eidx) {
		
		eventService.delete(eidx);
		
		return "redirect:list.do";
	}
	
	
	
	
	
}