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
	
	//�޼ҵ� �κ��� ���� �ѹ��ۿ� ���� ���Ѵ�.
//	@RequestMapping(value="/list.do",method=RequestMethod.GET)
//	public String listSearch(SearchCriteria scri, Model model) {
//		
//		List<BoardVo> list = boardService.list(scri);
//		
//		model.addAttribute("list", list);
//		System.out.println(scri.toString());
//		for (BoardVo item : list)
//		{
//			System.out.println(item.getBidx());
//		}
//		
//		PageVo pageVo = new PageVo();
//		pageVo.setScri(scri);
//		pageVo.setTotalCount(boardService.listCount(scri));
//		model.addAttribute("page", pageVo);
//		
//		return "board/l";
		
		/*
		 * List<BoardVo> list = new ArrayList<BoardVo>();
		 * 
		 * BoardVo vo1 = new BoardVo(); vo1.setTitle("ù��° �Խñ�"); vo1.setWriter("�ۼ���1");
		 * vo1.setContent("ù��° ����");
		 * 
		 * list.add(vo1);
		 * 
		 * BoardVo vo2 = new BoardVo(); vo2.setTitle("�ι�° �Խñ�"); vo2.setWriter("�ۼ���2");
		 * vo2.setContent("�ι�° ����");
		 * 
		 * list.add(vo2);
		 * 
		 * BoardVo vo3 = new BoardVo(); vo3.setTitle("����° �Խñ�"); vo3.setWriter("�ۼ���3");
		 * vo3.setContent("����° ����");
		 * 
		 * list.add(vo3);
		 * 
		 * model.addAttribute("datalist", list);
		 */	
		
		
	
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
	public String list() {
		return "board/boardList";
	}
	
//	@RequestMapping(value="/view.do",method=RequestMethod.GET)
//	public String view(int bidx, Model model) {	
//		//DB �󼼵����� ��ȸ
//		BoardVo vo = boardService.selectByBidx(bidx);
//		
//		model.addAttribute("vo", vo);
//		
//		List<ReplyVo> reply = null;
//		reply = replyService.list(bidx);
//		model.addAttribute("reply", reply);	
//		
//		return "board/v";
//	}
//	
	@RequestMapping(value="/noticeList.do", method=RequestMethod.GET)
	public String notice() {
		return "board/noticeList";
	}
	
	@RequestMapping(value="/eventList.do", method=RequestMethod.GET)
	public String event() {
		return "board/eventList";
	}
	
	@RequestMapping(value="/boardContent.do",method=RequestMethod.GET)
	public String content() {
		
		return "board/boardContent";
	}
	
	@RequestMapping(value="/boardWrite.do",method=RequestMethod.GET)
	public String write() {
		
		return "board/boardWrite";
	}
	//�����δ� �޼ҵ� �ϳ��� ������ �ѹ��� RequestMapping�� �Ҽ� ����.
	
	
	
	@RequestMapping(value="/write.do",method=RequestMethod.POST)
	public String write(BoardVo vo, HttpSession session) {//�Ű������� ���� ���ƾ� �Ѵ�.
		//�ش� �޼ҵ带 ȣ���ϴ� ���� ��� -> projectpath/board/write.do
						
		UserVo login = (UserVo)session.getAttribute("login");
		
		vo.setUidx(login.getUidx());	
		
		int result = boardService.insert(vo);
		//insert�� �Խñ��� pk ���� ������ view.do�� �̵��ϼ���
		
		//int maxBidx = boardService.maxBidx();
		
		//System.out.println("param etc ::"+etc);
		//null�� �Ѿ�ý� nullüũ�� ���� ����� �Ѵ�.
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
		//db�۾�(insert)
		//return "redirect:list.do"; //redircet�Ǵ� ������ -> projectpath/board/list.do
		
		return "redirect:view.do?bidx="+vo.getBidx(); //�����̷�Ʈ�ϴ� �Ķ���� ��δ� do?param=test.doó�� ���ڿ��� ��θ� �Է�������Ѵ�.
		//redirect�Ǵ� ���� ��� -> projectpath/board/list.do
		//return "redirect:/user/list.do"; //redirect�Ǵ� ���� ��� -> projectpath/user/list.do
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
		System.out.println("vo����"+vo.toString());
		
		
		if(result>0) {		
			return "redirect:list.do?bidx="+vo.getBidx();
		}else {
			return "redirect:/";
		}
		
	}
	
}
