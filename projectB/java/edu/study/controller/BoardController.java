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
	/* 글 목록 보기(검색,페이징) */
	@RequestMapping(value="/list.do",method=RequestMethod.GET)
	public String listPage(BoardVo vo,Model model,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		//게시글 보기
		List<BoardVo> list = boardService.listPage(searchVo);
		model.addAttribute("list",list);
		model.addAttribute("searchVo",searchVo);
		
		//페이징
		PageMaker pageMaker = new PageMaker(boardService.count(searchVo),searchVo);
		pageMaker.setSearchVo(searchVo);	
		model.addAttribute("pageMaker",pageMaker);
		
		return "board/list";	
	}
	
	/* 글 상세 보기 */
	@RequestMapping(value="/view.do",method=RequestMethod.GET)
	public String view(int bidx,Model model,HttpSession session,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		MemberVo login = (MemberVo)session.getAttribute("login");
		
		//조회수 
		boardService.hitCnt(bidx);
		
		//댓글 개수
		boardService.updateReplyCnt(bidx);
		
		//선택한 게시물 보기
		model.addAttribute("list",boardService.selectByBidx(bidx));
		model.addAttribute("searchVo",searchVo);
		
		//댓글 보기
		List<ReplyVo> replyList = replyService.replyListPage(searchVo);
		model.addAttribute("replyList",replyList);
				
		//댓글 페이징
		ReplyPageMaker replyPageMaker = new ReplyPageMaker(replyService.count(bidx),searchVo);
		replyPageMaker.setSearchVo(searchVo);
		model.addAttribute("replyPageMaker",replyPageMaker);
		
		return "board/view";	
	}
	
	/* 글 쓰기 페이지로 이동*/
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public String write(Model model, @ModelAttribute("searchVo") SearchVo searchVo) {
		
		model.addAttribute("searchVo",searchVo);
		
		return "board/write";
	}
	
	/* 글 쓰기 실행 */
	   @RequestMapping(value="/write.do",method=RequestMethod.POST)
	   public String write(BoardVo vo,ReviewFileVo vo2, HttpSession session,@RequestParam("file") MultipartFile file) {

	      //로그인 후 midx,nickname을 vo에 담는다.
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

	
	/* 글 수정 페이지로 이동 */
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public String modify(int bidx, Model model,@ModelAttribute("searchVo") SearchVo searchVo) {

		model.addAttribute("vo",boardService.selectByBidx(bidx));
		model.addAttribute("searchVo",searchVo);
		
		return "board/modify";
	}
	
	/* 글 수정 실행 */
	@RequestMapping(value ="/modify.do",method=RequestMethod.POST)
	public String modify(BoardVo vo,SearchVo searchVo,RedirectAttributes rttr) {

		//글 수정하기
		boardService.updateByBidx(vo);
		
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());

		return "redirect:view.do?bidx="+vo.getBidx();
		
	}

	
	/* 글 삭제 페이지로 이동 */
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public String delete(int bidx, Model model,@ModelAttribute("searchVo") SearchVo searchVo) {
		
		//선택한 글 상세 보기
		model.addAttribute("vo",boardService.selectByBidx(bidx));	
		model.addAttribute("searchVo",searchVo);
		
		return "board/delete";
	}
	
	/* 글 삭제 실행 */
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public String delete(@RequestParam("bidx")int bidx,SearchVo searchVo,RedirectAttributes rttr) {
		
		//글 삭제하기
		boardService.deleteByBidx(bidx);
		
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("category",searchVo.getCategory());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());
		
		return "redirect:list.do";	
	}
	
	/* 게시물의 추천 클릭 */
	@ResponseBody
	@RequestMapping(value="/like.do",method=RequestMethod.GET)
	public int like(int bidx,LikeVo vo,HttpSession session){

		//로그인하면 id를 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		
		//추천 클릭시 liketb에서 id와 bidx로 likeCheck 총 갯수 카운트
		int likeCheck = boardService.likeCheck(vo);
		if(likeCheck == 0) { //추천 처음 클릭시
			boardService.updateLikeCnt(bidx); //추천 총 횟수 증가
			boardService.insertLiketb(vo); 	//liketb에 insert
			boardService.updateByLikeCheck(vo); //LikeCheck를 1로 바꾸어 중복방지
		}

		return likeCheck;
	}
	
	/* 게시물의 비추천 클릭 */
	@ResponseBody
	@RequestMapping(value="/hate.do",method=RequestMethod.GET)
	public int hate(int bidx,LikeVo vo,HttpSession session) {
		
		//로그인하면 id를 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		
		//비추천 클릭시 liketb에서 id와 bidx로 hateCheck 총 갯수 카운트
		int hateCheck = boardService.likeCheck(vo);
		if(hateCheck == 0) { //비추천 처음 클릭시
			boardService.updateHateCnt(bidx); //비추천 총 횟수 증가
			boardService.insertLiketb(vo); 	//liketb에 insert
			boardService.updateByHateCheck(vo); //HateCheck를 1로 바꾸어 중복방지
		}
		
		return hateCheck;
	}
}