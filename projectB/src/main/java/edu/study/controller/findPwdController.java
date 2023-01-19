package edu.study.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.study.service.MemberService;
import edu.study.vo.MemberVo;


@RequestMapping(value="/findPwd")
@Controller
public class findPwdController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired 
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/findPwd-fir", method=RequestMethod.GET)
	public String findPwd1(){
		
		return "findPwd/findPwd-fir";
		
	}
	@RequestMapping(value = "/findPwd-fir.do", method=RequestMethod.POST)
	public ModelAndView pw_auth(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model){
		String email = (String)request.getParameter("email");
		String name = (String)request.getParameter("name");
		String id = (String)request.getParameter("id");
				
		MemberVo vo = memberService.selectMember(email);
				
		if(vo != null) {
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		if (vo.getName().equals(name)&vo.getId().equals(id)) {
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			String setfrom = "kbs5697@naver.com"; // naver 
			String tomail = vo.getEmail(); //받는사람
			String title = "비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title);
				messageHelper.setText(content); 

				mailSender.send(message);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			ModelAndView mv = new ModelAndView();
			mv.setViewName("findPwd/findPwd-sec");
			mv.addObject("num", num);			
			return mv;
		}else {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("findPwd/findPwd-fir");
			mv.addObject("name", name);
			mv.addObject("id", id);	
			return mv;
		}
		}else {
			ModelAndView mv = new ModelAndView();
				mv.setViewName("findPwd/findPwd-fir");
				mv.addObject("name", name);
				mv.addObject("id", id);	
				return mv;
		}
	}
	
	@RequestMapping(value = "/findPwd-sec.do", method = RequestMethod.POST)
	public String pw_set(@RequestParam(value="confirmNum") String confirmNum,
				@RequestParam(value = "num") String num) {
			
			if(confirmNum.equals(num)) {
				return "findPwd/findPwd-thd";
			}
			else {
				return "findPwd/findPwd-sec";
			}
	} //이메일 인증번호 확인
	
	@RequestMapping(value = "/findPwd-thd.do", method = RequestMethod.POST)
	public String pw_new(MemberVo vo, HttpSession session){
		int result = memberService.updatePw(vo);
		if(result == 1) {
			
			return "redirect:/";
		}
		else {
			System.out.println("pw_update"+ result);
			return "findPwd/findPwd-thd";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/check.do")
	public String Check(String name, String id, String email) {
		System.out.println(name);
		System.out.println(id);
		int result = memberService.nameCheck(name);
		int data = memberService.idCheck(id);
		int em = memberService.emailCheck(email);
		
		
		String value = "{ \"name\": \""+result+"\" , \"id\":\""+data+"\" , \"email\":\""+em+"\"}";
		
		return value;
	}
	
		
}
