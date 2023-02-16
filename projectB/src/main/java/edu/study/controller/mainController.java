package edu.study.controller;

import java.io.File;


import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Locale;
	
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.MemberService;

import edu.study.service.BoardService;

import edu.study.vo.BoardVo;

import edu.study.vo.MemberVo;

import edu.study.vo.SearchVo;


/**
 * Handles requests for the application home page.
 */
@Controller
public class mainController {
	
	@Autowired
	private MemberService memberService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(mainController.class);
	
	@Autowired
	private BoardService boardService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale,  Model model, BoardVo vo ) {

		List<BoardVo> list2 = boardService.listView();
		model.addAttribute("list",list2);
		
		logger.info("Welcome home! The client locale is {}.", locale);

		
		
		return "main";
	}

	
	
	@RequestMapping(value="/test.do", method = RequestMethod.GET)
	public String sample(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "sample/sample";
		//������ ����̹Ƿ� sample�����ȿ� �ִ� sample.jsp�� �ҷ��;� �ϹǷ� sample/sample�� �ȴ�.
	}
	
	/*
	 * @RequestMapping(value= {"/list.do","/view.do","/write.do"}, method =
	 * RequestMethod.GET) public String board(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "board";
	 * 
	 * }
	 */
	@RequestMapping(value="/fileupload.do", method=RequestMethod.GET)
	public String fileupload() {
		
		
		return"file/upload";
	}
	
	@RequestMapping(value="/fileupload.do", method=RequestMethod.POST)
	public String fileupoad(MultipartFile uploadF1,MultipartFile uploadF2,HttpServletRequest req, BoardVo vo) throws IllegalStateException, IOException {
		System.out.println("title->"+vo.getTitle());
		
		//String path="D:\\springframework\\springMVC\\src\\main\\webapp\\resources\\upload";
		
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(!uploadF1.getOriginalFilename().isEmpty()) {
			int pos = uploadF1.getOriginalFilename().lastIndexOf(".");			
			String ext = uploadF1.getOriginalFilename().substring(pos + 1);
			
			Date now = new Date();
			String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);
			 
			int random = (int) ((Math.random() * 100) + 1);			
			String result = today + random;
			
			uploadF1.transferTo(new File(path,result+"."+ext));
		}
		if(!uploadF2.getOriginalFilename().isEmpty()) {
			int pos = uploadF2.getOriginalFilename().lastIndexOf(".");			
			String ext = uploadF2.getOriginalFilename().substring(pos + 1);
			
			Date now = new Date();
			String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);
			 
			int random = (int) ((Math.random() * 100) + 1);			
			String result = today + random;
			
			uploadF1.transferTo(new File(path,result+"."+ext));
		}
		return "";
		// origin�� upload���� ���ϸ� real�� ���� ������ ���ϸ�
	}
	
}
