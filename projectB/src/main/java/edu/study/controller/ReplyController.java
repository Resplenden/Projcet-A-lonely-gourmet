package edu.study.controller;





import javax.inject.Inject;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import edu.study.service.ReplyService;



import edu.study.vo.ReplyVo;


import edu.study.vo.UserVo;

@RequestMapping(value="/reply")
@Controller
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	
	
	@RequestMapping(value = "/replyWrite.do", method=RequestMethod.POST)
	public String write(ReplyVo vo, HttpSession session) {
		
		UserVo login = (UserVo)session.getAttribute("login");		
		vo.setUidx(login.getUidx());		
		vo.setWriter(login.getName());
		
		replyService.write(vo);
								
		return "redirect:/board/view.do?bidx="+vo.getBidx();
	
	}
	
	
	
}