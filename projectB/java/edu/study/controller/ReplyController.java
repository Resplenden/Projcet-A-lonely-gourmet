package edu.study.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.ReplyService;
import edu.study.vo.MemberVo;
import edu.study.vo.ReplyLikeVo;
import edu.study.vo.ReplyVo;
import edu.study.vo.SearchVo;


@RequestMapping(value="/reply")
@Controller
public class ReplyController{

	@Autowired
	private ReplyService replyService;
	
	/* 댓글 보기*/
	@RequestMapping(value="/list.do")
	public List<ReplyVo> replyList(SearchVo searchVo,Model model){
		
		List<ReplyVo> replyList = replyService.replyListPage(searchVo);
		model.addAttribute("replyList",replyList);

		return replyList;
	}
	
	/* 댓글 쓰기 */
	@ResponseBody
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public int writeReply(ReplyVo vo,HttpSession session) {
		
		//로그인하면 닉네임을 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setWriter(login.getNickname());
		int result = replyService.writeReply(vo);
		
		return result;	
	}

	/* 댓글 수정 */
	@ResponseBody
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public int modifyReply(ReplyVo vo,SearchVo searchVo,RedirectAttributes rttr) {
		
		//댓글 수정하기
		int result = replyService.updateReply(vo);
		
		rttr.addAttribute("bidx",searchVo.getBidx());
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());
		
		return result;
	}
	
	/* 댓글 삭제 */
	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public int deleteReply(int ridx) {
		
		return replyService.deleteReply(ridx);
	}
	
	/* 답글 쓰기 */
	@ResponseBody
	@RequestMapping(value="/writeRereply.do",method=RequestMethod.GET)
	public int writeRereply(ReplyVo vo,HttpSession session) {
		
		//로그인하면 닉네임을 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setWriter(login.getNickname());
		System.out.println(login.getNickname());
		replyService.updateDepth(vo);

		return replyService.writeRereply(vo);	
	}
	
	
	/* 댓글의 추천 클릭 */
	@ResponseBody
	@RequestMapping(value="/replyLike.do",method=RequestMethod.GET)
	public int replyLike(int ridx,ReplyLikeVo vo,HttpSession session){

		//로그인하면 id를 vo에 담는다.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		System.out.println("vo" + login);
		
		//추천 클릭시 replyLiketb에서 id와 ridx로 likeCheck 총 갯수 카운트
		int likeCheck = replyService.replyLikeCheck(vo);
		if(likeCheck == 0) { //추천 처음 클릭시
			replyService.updateReplyLikeCnt(ridx); //추천 총 횟수 증가
			replyService.insertReplyLiketb(vo); 	//replyLiketb에 insert
			replyService.updateByReplyLikeCheck(vo); //likeCheck를 1로 바꾸어 중복방지
		}

		return likeCheck;
	}
	
}