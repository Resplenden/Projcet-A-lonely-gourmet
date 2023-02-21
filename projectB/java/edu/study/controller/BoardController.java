package edu.study.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.BoardService;
import edu.study.service.ReplyService;
import edu.study.service.ReviewService;
import edu.study.vo.BoardVo;
import edu.study.vo.LikeVo;
import edu.study.vo.MemberVo;
import edu.study.vo.PageMaker;
import edu.study.vo.ReplyPageMaker;
import edu.study.vo.ReplyVo;
import edu.study.vo.ReviewFileVo;
import edu.study.vo.SearchVo;


@RequestMapping(value="/board")
@Controller
public class BoardController{

	@Autowired
	private BoardService boardService;
	@Inject
	private ReplyService replyService;
	@Inject
	private ReviewService reviewService;
	/* �� ��� ����(�˻�,����¡) */
	@RequestMapping(value="/list.do",method=RequestMethod.GET)
	public String listPage(BoardVo vo,Model model,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		//�Խñ� ����
		List<BoardVo> list = boardService.listPage(searchVo);
		model.addAttribute("list",list);
		model.addAttribute("searchVo",searchVo);
		
		//����¡
		PageMaker pageMaker = new PageMaker(boardService.count(searchVo),searchVo);
		pageMaker.setSearchVo(searchVo);	
		model.addAttribute("pageMaker",pageMaker);
		
		return "board/list";	
	}
	
	/* �� �� ���� */
	@RequestMapping(value="/view.do",method=RequestMethod.GET)
	public String view(int bidx,Model model,HttpSession session,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		MemberVo login = (MemberVo)session.getAttribute("login");
		
		//��ȸ�� 
		boardService.hitCnt(bidx);
		
		//��� ����
		boardService.updateReplyCnt(bidx);
		
		//������ �Խù� ����
		model.addAttribute("list",boardService.selectByBidx(bidx));
		model.addAttribute("searchVo",searchVo);
		
		//��� ����
		List<ReplyVo> replyList = replyService.replyListPage(searchVo);
		model.addAttribute("replyList",replyList);
				
		//��� ����¡
		ReplyPageMaker replyPageMaker = new ReplyPageMaker(replyService.count(bidx),searchVo);
		replyPageMaker.setSearchVo(searchVo);
		model.addAttribute("replyPageMaker",replyPageMaker);
		
		return "board/view";	
	}
	
	/* �� ���� �������� �̵�*/
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write(Model model, @ModelAttribute("searchVo") SearchVo searchVo) {
		
		model.addAttribute("searchVo",searchVo);
		
		return "board/write";
	}
	
	/* �� ���� ���� */
	   @RequestMapping(value="/write.do",method=RequestMethod.POST)
	   public String write(BoardVo vo,ReviewFileVo vo2, HttpSession session,@RequestParam("file") MultipartFile file) {

	      //�α��� �� midx,nickname�� vo�� ��´�.
	      MemberVo login = (MemberVo)session.getAttribute("login");
	      vo.setMidx(login.getMidx());
	      vo.setWriter(login.getNickname());
	      vo.setStname(login.getStname());
	      System.out.println(login.getMidx());
	      System.out.println(login.getNickname());
	      
	      if(!file.isEmpty()) {
	         String OriginalFilename = file.getOriginalFilename();
	         long size = file.getSize();
	         String ext = OriginalFilename.substring(OriginalFilename.lastIndexOf("."), OriginalFilename.length());
	         String path = "C:\\Users\\745\\git\\Projcet-A-lonely-gourmet\\projectB\\src\\main\\webapp\\resources\\upload";
	   
	         UUID uuid = UUID.randomUUID();
	         String[] uuids = uuid.toString().split("-");
	   
	         String uniqueName = uuids[0];
	   
	         File saveFile = new File(path + "\\" + uniqueName + ext);
	      
	         try {
	            file.transferTo(saveFile);
	         } catch (IllegalStateException e) {
	            e.printStackTrace();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	         
	         vo2.setOriginalfilename(OriginalFilename);
	         vo2.setSavefilename(uniqueName + ext);
	         reviewService.reviewFile(vo2);
	         
	         vo.setFilename(uniqueName + ext);
	      
	      }
	      
	      boardService.write(vo);
	      
	      return "redirect:list.do";
	   }

	
	/* �� ���� �������� �̵� */
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int bidx, Model model,@ModelAttribute("searchVo") SearchVo searchVo) {

		model.addAttribute("vo",boardService.selectByBidx(bidx));
		model.addAttribute("searchVo",searchVo);
		
		return "board/modify";
	}
	
	/* �� ���� ���� */
	@RequestMapping(value ="/modify.do",method=RequestMethod.POST)
	public String modify(BoardVo vo,SearchVo searchVo,RedirectAttributes rttr) {

		//�� �����ϱ�
		boardService.updateByBidx(vo);
		
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());

		return "redirect:view.do?bidx="+vo.getBidx();
		
	}

	
	/* �� ���� �������� �̵� */
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public String delete(int bidx, Model model,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		//������ �� �� ����
		model.addAttribute("vo",boardService.selectByBidx(bidx));	
		model.addAttribute("searchVo",searchVo);
		
		return "board/delete";
	}
	
	/* �� ���� ���� */
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(@RequestParam("bidx")int bidx,SearchVo searchVo,RedirectAttributes rttr) {
		
		//�� �����ϱ�
		boardService.deleteByBidx(bidx);
		
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("category",searchVo.getCategory());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());
		
		return "redirect:list.do";	
	}
	
	/* �Խù��� ��õ Ŭ�� */
	@ResponseBody
	@RequestMapping(value="/like.do",method=RequestMethod.GET)
	public int like(int bidx,LikeVo vo,HttpSession session){

		//�α����ϸ� id�� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		
		//��õ Ŭ���� liketb���� id�� bidx�� likeCheck �� ���� ī��Ʈ
		int likeCheck = boardService.likeCheck(vo);
		if(likeCheck == 0) { //��õ ó�� Ŭ����
			boardService.updateLikeCnt(bidx); //��õ �� Ƚ�� ����
			boardService.insertLiketb(vo); 	//liketb�� insert
			boardService.updateByLikeCheck(vo); //LikeCheck�� 1�� �ٲپ� �ߺ�����
		}

		return likeCheck;
	}
	
	/* �Խù��� ����õ Ŭ�� */
	@ResponseBody
	@RequestMapping(value="/hate.do",method=RequestMethod.GET)
	public int hate(int bidx,LikeVo vo,HttpSession session) {
		
		//�α����ϸ� id�� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		
		//����õ Ŭ���� liketb���� id�� bidx�� hateCheck �� ���� ī��Ʈ
		int hateCheck = boardService.likeCheck(vo);
		if(hateCheck == 0) { //����õ ó�� Ŭ����
			boardService.updateHateCnt(bidx); //����õ �� Ƚ�� ����
			boardService.insertLiketb(vo); 	//liketb�� insert
			boardService.updateByHateCheck(vo); //HateCheck�� 1�� �ٲپ� �ߺ�����
		}
		
		return hateCheck;
	}
}