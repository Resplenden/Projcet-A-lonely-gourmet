package edu.study.controller;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.study.service.BoardService;
import edu.study.service.ReplyService;
import edu.study.vo.BoardVo;
import edu.study.vo.CriteriaVo;
import edu.study.vo.PageVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchCriteria;

import edu.study.vo.UserVo;

@RequestMapping(value="/board")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Inject
	private ReplyService replyService;
	
	//메소드 부분을 빼면 한번밖에 쓰지 못한다.
	@RequestMapping(value="/list.do",method=RequestMethod.GET)
	public String listSearch(SearchCriteria scri, Model model) {
		
		List<BoardVo> list = boardService.list(scri);
		
		model.addAttribute("list", list);
		System.out.println(scri.toString());
		for (BoardVo item : list)
		{
			System.out.println(item.getBidx());
		}
		
		PageVo pageVo = new PageVo();
		pageVo.setScri(scri);
		pageVo.setTotalCount(boardService.listCount(scri));
		model.addAttribute("page", pageVo);
		
		return "board/l";
		
		/*
		 * List<BoardVo> list = new ArrayList<BoardVo>();
		 * 
		 * BoardVo vo1 = new BoardVo(); vo1.setTitle("첫번째 게시글"); vo1.setWriter("작성자1");
		 * vo1.setContent("첫번째 내용");
		 * 
		 * list.add(vo1);
		 * 
		 * BoardVo vo2 = new BoardVo(); vo2.setTitle("두번째 게시글"); vo2.setWriter("작성자2");
		 * vo2.setContent("두번째 내용");
		 * 
		 * list.add(vo2);
		 * 
		 * BoardVo vo3 = new BoardVo(); vo3.setTitle("세번째 게시글"); vo3.setWriter("작성자3");
		 * vo3.setContent("세번째 내용");
		 * 
		 * list.add(vo3);
		 * 
		 * model.addAttribute("datalist", list);
		 */
		
		
		
		
	}
	
	@RequestMapping(value="/view.do",method=RequestMethod.GET)
	public String view(int bidx, Model model) {	
		//DB 상세데이터 조회
		BoardVo vo = boardService.selectByBidx(bidx);
		
		model.addAttribute("vo", vo);
		
		List<ReplyVo> reply = null;
		reply = replyService.list(bidx);
		model.addAttribute("reply", reply);	
		
		return "board/v";
	}
	

	
	
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write() {
		
		return "board/w";
	}
	//가상경로당 메소드 하나기 때문에 한번에 RequestMapping를 할수 없다.
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write(BoardVo vo, HttpSession session) {//매개변수과 같이 같아야 한다.
		//해당 메소드를 호출하는 가상 경로 -> projectpath/board/write.do
						
		UserVo login = (UserVo)session.getAttribute("login");
		
		vo.setUidx(login.getUidx());	
		
		int result = boardService.insert(vo);
		//insert된 게시글의 pk 값을 가져와 view.do로 이동하세요
		
		//int maxBidx = boardService.maxBidx();
		
		//System.out.println("param etc ::"+etc);
		//null로 넘어올시 null체크를 따로 해줘야 한다.
		/*
		 * if(title != null && !title.equals("")) {
		 * 
		 * }
		 */
		
		/*
		 * System.out.println("param title ::"+title);
		 * System.out.println("param writer ::"+writer);
		 * System.out.println("param content ::"+content);
		 */
		//db작업(insert)
		//return "redirect:list.do"; //redircet되는 가상경로 -> projectpath/board/list.do
		
		return "redirect:view.do?bidx="+vo.getBidx(); //리다이렉트하는 파라미터 경로는 do?param=test.do처럼 문자열로 경로를 입력해줘야한다.
		//redirect되는 가상 경로 -> projectpath/board/list.do
		//return "redirect:/user/list.do"; //redirect되는 가상 경로 -> projectpath/user/list.do
	}
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int bidx, Model model) {
		
		BoardVo vo = boardService.selectByBidx(bidx);
		
		model.addAttribute("vo", vo);
		
		return "board/m";
	}
	
	@RequestMapping(value="/modify.do",method=RequestMethod.POST)
	public String modify(BoardVo vo) {
		
		int result = boardService.updateByBidx(vo);
		
		if(result>0) {		
			return "redirect:view.do?bidx="+vo.getBidx();
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(BoardVo vo, HttpSession session) {
		
		UserVo login = (UserVo)session.getAttribute("login");
		
		int uidx = login.getUidx();
		
		int result = boardService.delete(vo);		
		System.out.println("vo값은"+vo.toString());
		
		
		if(result>0) {		
			return "redirect:list.do?bidx="+vo.getBidx();
		}else {
			return "redirect:/";
		}
		
	}
	
}
