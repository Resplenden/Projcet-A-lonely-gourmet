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
	
	/* ��� ����*/
	@RequestMapping(value="/list.do")
	public List<ReplyVo> replyList(SearchVo searchVo,Model model){
		
		List<ReplyVo> replyList = replyService.replyListPage(searchVo);
		model.addAttribute("replyList",replyList);

		return replyList;
	}
	
	/* ��� ���� */
	@ResponseBody
	@RequestMapping(value="/write.do",method=RequestMethod.GET)
	public int writeReply(ReplyVo vo,HttpSession session) {
		
		//�α����ϸ� �г����� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setWriter(login.getNickname());
		int result = replyService.writeReply(vo);
		
		return result;	
	}

	/* ��� ���� */
	@ResponseBody
	@RequestMapping(value="/modify.do",method=RequestMethod.GET)
	public int modifyReply(ReplyVo vo,SearchVo searchVo,RedirectAttributes rttr) {
		
		//��� �����ϱ�
		int result = replyService.updateReply(vo);
		
		rttr.addAttribute("bidx",searchVo.getBidx());
		rttr.addAttribute("page",searchVo.getPage());
		rttr.addAttribute("perPageNum",searchVo.getPerPageNum());		
		rttr.addAttribute("searchType",searchVo.getSearchType());
		rttr.addAttribute("searchVal",searchVo.getSearchVal());
		
		return result;
	}
	
	/* ��� ���� */
	@ResponseBody
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public int deleteReply(int ridx) {
		
		return replyService.deleteReply(ridx);
	}
	
	/* ��� ���� */
	@ResponseBody
	@RequestMapping(value="/writeRereply.do",method=RequestMethod.GET)
	public int writeRereply(ReplyVo vo,HttpSession session) {
		
		//�α����ϸ� �г����� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setWriter(login.getNickname());
		System.out.println(login.getNickname());
		replyService.updateDepth(vo);

		return replyService.writeRereply(vo);	
	}
	
	
	/* ����� ��õ Ŭ�� */
	@ResponseBody
	@RequestMapping(value="/replyLike.do",method=RequestMethod.GET)
	public int replyLike(int ridx,ReplyLikeVo vo,HttpSession session){

		//�α����ϸ� id�� vo�� ��´�.
		MemberVo login = (MemberVo)session.getAttribute("login");
		vo.setId(login.getId());
		System.out.println("vo" + login);
		
		//��õ Ŭ���� replyLiketb���� id�� ridx�� likeCheck �� ���� ī��Ʈ
		int likeCheck = replyService.replyLikeCheck(vo);
		if(likeCheck == 0) { //��õ ó�� Ŭ����
			replyService.updateReplyLikeCnt(ridx); //��õ �� Ƚ�� ����
			replyService.insertReplyLiketb(vo); 	//replyLiketb�� insert
			replyService.updateByReplyLikeCheck(vo); //likeCheck�� 1�� �ٲپ� �ߺ�����
		}

		return likeCheck;
	}
	
}