package edu.study.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.ReviewService;
import edu.study.vo.MemberVo;
import edu.study.vo.ReviewFileVo;
import edu.study.vo.ReviewLikeVo;
import edu.study.vo.ReviewPageMaker;
import edu.study.vo.ReviewVo;
import edu.study.vo.SearchVo;

@RequestMapping(value="/food")
@Controller 
public class FoodController {
	
	@Inject
	private ReviewService reviewService;
	
	/*식당 목록 페이지*/
	@RequestMapping(value="/foodList.do",method=RequestMethod.GET)
	public String list() {
		
	return "food/foodList";
	
	}
	
	/*식당 상세보기*/
	@RequestMapping(value="/foodView.do",method=RequestMethod.GET)
	public String view(HttpServletRequest req, Model model,ReviewVo reviewVo,SearchVo searchVo) {
	      
		System.out.println("session 값:" + req.getParameter("name"));
	    System.out.println("session 값:" + req.getParameter("category"));
	    
	    String name= req.getParameter("name");
	    String addr = req.getParameter("addr");
	    String category = req.getParameter("category");
	    String phone = req.getParameter("phone");
	      
	    req.setAttribute("title", name);
	    req.setAttribute("addr", addr);
	    req.setAttribute("category", category);
	    req.setAttribute("phone", phone);
	    
	    //리뷰 보기
	    List<ReviewVo> review = reviewService.reviewListPage(searchVo);
	    model.addAttribute("review",review);
	    
	    //리뷰 페이징
	    ReviewPageMaker reviewPageMaker = new ReviewPageMaker(reviewService.reviewCount(reviewVo),searchVo);
	  	reviewPageMaker.setSearchVo(searchVo);
	  	model.addAttribute("reviewPageMaker",reviewPageMaker);
	  		
	    return "food/foodView1";
	}
	
	/*리뷰 상세 페이지*/
	@RequestMapping(value="/review.do",method=RequestMethod.GET)
	public String review(HttpServletRequest req,Model model,int vidx) {
		
		String category = req.getParameter("category");
		req.setAttribute("category", category);
		
		model.addAttribute("review", reviewService.selectByVidx(vidx));
		
		return "food/review";
	}
	
	/*리뷰 작성 페이지*/
	@RequestMapping(value="/reviewWrite.do",method=RequestMethod.GET)
	public String write(HttpServletRequest req, Model model) {
		
		System.out.println("session 값:" + req.getParameter("name"));
	    System.out.println("session 값:" + req.getParameter("category"));
	    
	    String name= req.getParameter("name");
	    String addr = req.getParameter("addr");
	    String category = req.getParameter("category");
	    String phone = req.getParameter("phone");
	      
	    req.setAttribute("title", name);
	    req.setAttribute("addr", addr);
	    req.setAttribute("category", category);
	    req.setAttribute("phone", phone);
	
	    return "food/reviewWrite";
	
	}
	
	/*리뷰작성*/
	@RequestMapping(value="/reviewWrite.do",method=RequestMethod.POST)
	public String write(ReviewVo vo,ReviewFileVo vo2,@RequestParam("file") MultipartFile file) {
	
		
		if(!file.isEmpty()) {
			String OriginalFilename = file.getOriginalFilename();
			long size = file.getSize();
			String ext = OriginalFilename.substring(OriginalFilename.lastIndexOf("."), OriginalFilename.length());
			String path = "C:\\Users\\MYCOM\\git\\Projcet-A-lonely-gourmet\\projectB\\src\\main\\webapp\\resources\\upload";
	
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
		
		reviewService.writeReview(vo);

		return "redirect:foodView.do";
	}
	
	/*리뷰 추천*/
	@ResponseBody
	@RequestMapping(value="/reviewLike.do", method = RequestMethod.GET)
	public int reviewLike(int vidx,ReviewLikeVo vo, HttpSession session) {

		MemberVo login = (MemberVo) session.getAttribute("login");
		vo.setId(login.getId());
		
		int likeCheck = reviewService.likeCheck(vo);
		if (likeCheck == 0) {
			reviewService.updateLikeCnt(vidx); 
			reviewService.insertReviewLiketb(vo); 
			reviewService.updateByLikeCheck(vo); 
		}

		return likeCheck;
	}
}
