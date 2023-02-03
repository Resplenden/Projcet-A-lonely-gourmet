package edu.study.controller;


import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.MemberService;
import edu.study.service.MessageService;
import edu.study.service.NaverLoginBo;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;



//@ComponentScan(basePackages = {"edu.study.service.UserService"})
@RequestMapping(value="/member")
@Controller

public class memberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	@Autowired
	private MessageService messageService;
	
	/* NaverLoginBO */
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
	@RequestMapping(value="/memberLogin.do",method=RequestMethod.GET)
	public String login(Model model, HttpSession session) {
		
		/* 네아로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		/* 인증요청문 확인 */
		System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("urlNaver", naverAuthUrl);

		
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
	public String login(MemberVo vo, MemberFileVo vo2, HttpSession session, Model model) {
		
		MemberVo loginVO = memberService.login(vo);		
		boolean passMatch = passEncoder.matches(vo.getPwd(), loginVO.getPwd());
		MemberFileVo loginVo2 = memberService.file(loginVO.getMidx());		
				
		loginVO.setMidx(loginVo2.getMidx());
		loginVO.setOrgname(loginVo2.getOrgfilename());
		loginVO.setStname(loginVo2.getStoredname());
		System.out.println("vo : "+vo);
		System.out.println("vo2 : "+ loginVo2);
		System.out.println("passMatch"+passMatch);
		
		if (loginVO != null && passMatch) {
			//�꽦怨�
			//�씪移섑븯�뒗 �쉶�썝 �젙蹂닿� �엳�떎硫� �쉶�썝 �젙蹂대�� �꽭�뀡�뿉 �떞�뒗�떎
			
			session.setAttribute("login", loginVO);
			
			
		} else {
			
			return "redirect:/member/memberLogin.do";
		}
		
		return "redirect:/";
		
	}
	
	/* 濡쒓렇�븘�썐 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String join() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(MemberVo vo, MultipartFile profileImg, HttpServletRequest req) throws IllegalStateException, IOException {
				
		String inputPwd = vo.getPwd();
		String pwd = passEncoder.encode(inputPwd); //�븫�샇�솕
		
		vo.setPwd(pwd); //vo�뿉 ���옣
		
		int result = memberService.join(vo); 
		
		String path = "C:\\Users\\MYCOM\\git\\Projcet-A-lonely-gourmet\\projectB\\src\\main\\webapp\\resources\\upload";
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(!profileImg.getOriginalFilename().isEmpty()) {
			HashMap<String, Object> mfFile = new HashMap<String, Object>();
			int pos = profileImg.getOriginalFilename().lastIndexOf(".");			
			String ext = profileImg.getOriginalFilename().substring(pos + 1);
			
			Date now = new Date();
			String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);
			 
			int random = (int) ((Math.random() * 100) + 1);			
			String result1 = today + random;
			String randomname = result1 + "." + ext;
			String originname = profileImg.getOriginalFilename();
						
			profileImg.transferTo(new File(path,randomname));
			
			mfFile.put("orgfilename", originname);
			mfFile.put("storedname", randomname);
			mfFile.put("midx", vo.getMidx());
			
			memberService.fileInsert(mfFile);
		}	
				
		return "redirect:/member/memberLogin.do";
	}
	
	/*  以묐났寃��궗  */
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(String id) {
		int result = memberService.idCheck(id);

		if(result >0) {
			return "1";
		} else {
			return "0";
		}
	} 
	
	/* �땳�꽕�엫 以묐났寃��궗 */
	@ResponseBody
	@RequestMapping(value="/checkNick.do", method=RequestMethod.POST)
	public String checkNick(String nickname) {
		int result = memberService.nickCheck(nickname);
		
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	/* �씠硫붿씪 以묐났寃��궗 */
	@ResponseBody
	@RequestMapping(value="/checkEmail.do", method=RequestMethod.POST)
	public String checkEmail(String email) {
		int result = memberService.emailCheck(email);
		
		if(result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping("/sendSMS1.do") //
	@ResponseBody    
	    public String sendSMS(String phone) {
	 
	        Random rand  = new Random(); //랜덤숫자 생성하기 !!
	        String numStr = "";
	        for(int i=0; i<6; i++) {
	            String ran = Integer.toString(rand.nextInt(10));
	            numStr+=ran;
	        }
	        	        
	         
	        messageService.message(phone, numStr);	
	         
	          return numStr;
	    }
	
	
	
	
	
	
}
