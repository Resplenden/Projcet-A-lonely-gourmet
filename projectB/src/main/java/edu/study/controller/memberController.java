package edu.study.controller;


import java.io.File;
import java.io.PrintWriter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import edu.study.service.MemberService;
import edu.study.service.MessageService;
import edu.study.service.NaverLoginBo;
import edu.study.service.SessionConfig;
import edu.study.service.sha256;
import edu.study.vo.MemberFileVo;
import edu.study.vo.MemberVo;


@RequestMapping(value="/member")
@Controller

public class memberController {
	
	@Autowired
	private MemberService memberService;
	
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
		//System.out.println("네이버:" + naverAuthUrl);
		/* 객체 바인딩 */
		model.addAttribute("urlNaver", naverAuthUrl);
		
		return "member/memberLogin";
	}
	
	@RequestMapping(value="/memberLogin.do", method=RequestMethod.POST)
						

	public String login(MemberVo vo, MemberFileVo vo2, HttpSession session, HttpServletRequest request,RedirectAttributes rttr, Model model) throws Exception {
		
		String inputPwd = vo.getPwd();
		vo.setPwd(sha256.encrypt(inputPwd));
	
		MemberVo loginVO = memberService.login(vo);	
	
		System.out.println("loginVO 값 : "+loginVO);
		System.out.println("vo값 : "+vo);
		MemberFileVo loginVo2 = memberService.file(loginVO.getMidx());
				
		if( loginVo2 != null )
		{
			loginVO.setMidx(loginVo2.getMidx());
			loginVO.setOrgname(loginVo2.getOrgfilename());
			loginVO.setStname(loginVo2.getStoredname());
			System.out.println("vo : "+vo);
			System.out.println("vo2 : "+ loginVo2);
			
		}	

		
		model.addAttribute("vo", vo );

		
		String memberId = request.getParameter("id");
		if(memberId != null){
			String usingId = SessionConfig.getSessionidCheck("login_id", memberId);
			System.out.println(memberId + " : " + usingId);
			session.setMaxInactiveInterval(60*60);
			session.setAttribute("login_id", memberId);
			
		}
	
		session.setAttribute("login", loginVO);
			
		return "redirect:/";
			
	}
	

		
	@ResponseBody
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public String loginCheck(MemberVo vo,HttpSession session,Model model) {
		
		System.out.println("id : " + vo.getId()); 

		//비밀번호 암호화
		String str_pwd = sha256.encrypt(vo.getPwd()); 
		
		vo.setPwd(str_pwd);
		System.out.println("vo pwd : "+ str_pwd);
		int count = memberService.loginCheck(vo, session);
		System.out.println("count:"+count);
		if(count == 1)
		{	
			session.setAttribute("session id", vo.getId()); //session
			return "1";
		} else {
			return "0";
		}
	}
	
	/* 로그아웃 */
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	/* 회원가입 */
	@RequestMapping(value="/memberJoin.do", method=RequestMethod.GET)
	public String join() {
		
		return "member/memberJoin";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(MemberVo vo, MultipartFile profileImg, HttpServletRequest req) throws IllegalStateException, IOException {
				
		String inputPwd = vo.getPwd();
		String pwd = sha256.encrypt(inputPwd); //암호화
		
		vo.setPwd(pwd); //vo에 넣고
		
		int result = memberService.join(vo); 
		
		String path = "C:\\Users\\MYCOM\\git\\Projcet-A-lonely-gourmet\\projectB\\src\\main\\webapp\\resources\\upload";
		
		System.out.println(path);
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		String originname = "";
		String randomname = "";
		HashMap<String, Object> mfFile = new HashMap<String, Object>();
		int pos = 0;
		String ext = "";
		Date now = new Date();
		String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);
		int random = (int) ((Math.random() * 100) + 1);			
		String result1 = today + random;
		
		boolean flag = profileImg.getOriginalFilename().isEmpty();
		
		if(flag){
			// 받은 파일이 없을 겨우
			originname = "commonProfile.png";
			randomname = "commonProfile.png";
		}else {
			// 파일이 있는 경우
			originname = profileImg.getOriginalFilename();
			pos = originname.lastIndexOf(".");			
			ext = originname.substring(pos + 1);
			randomname = result1 + "." + ext;
		}
		
		
//		pos = profileImg.getOriginalFilename().lastIndexOf(".");			
//		ext = profileImg.getOriginalFilename().substring(pos + 1);
		
		// 파일이 있으면 upload 폴더에 넣는다
		if(!flag){
			profileImg.transferTo(new File(path,randomname));
		}
		
		// DB에 넣을 파일 정보 설정
		mfFile.put("orgfilename", originname);
		mfFile.put("storedname", randomname);
		mfFile.put("midx", vo.getMidx());
		
		// DB에 정보를 넣는다
		memberService.fileInsert(mfFile);

		return "redirect:/member/memberLogin.do";
	}
	

	/* 아이디 중복확인  */
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
		
	/* 닉네임 중복확인 */
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

	/* 이메일 중복확인 */
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

	
	
	/*마이페이지 이동*/
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage(int midx, MemberVo vo, Model model, HttpSession session) {
		
		MemberVo loginVO = memberService.login(vo);	
		MemberVo vo2 = memberService.profile(midx);
		session.removeAttribute(vo.getNickname());
		session.getAttribute("vo2");
		model.addAttribute("vo2", vo2);
		
		
		return "/member/myPage";
	}
	
	
	/*회원 정보 이동*/
	@RequestMapping(value="/profile.do", method=RequestMethod.GET)
	public String profile(int midx, MemberVo vo, Model model, HttpSession session) {
	
		MemberVo loginVO = memberService.login(vo);	
		MemberVo vo2 = memberService.profile(midx);
		session.removeAttribute(vo.getNickname());
		session.removeAttribute(vo.getStname());
		session.getAttribute("vo2");
		model.addAttribute("vo2", vo2);
		
		return "/member/profile";
	}
	
	
	/*회원 정보 수정 이동*/
	@RequestMapping(value="/profileModify.do", method=RequestMethod.GET)
	public String profileModify(int midx, Model model) {

		MemberVo vo = memberService.profile(midx);
		model.addAttribute("vo", vo);
		System.out.println("회원 정보 수정 전:"+ vo);

		
		return "/member/profileModify";
	}
	
	/*회원 정보 수정하기*/
	@RequestMapping(value="/profileModify.do", method=RequestMethod.POST)
	public String profileModify(MemberVo vo, Model model, MultipartFile profileImg, HttpServletRequest req) throws IllegalStateException, IOException {
	
	String path = "C:\\Users\\759\\git\\Projcet-A-lonely-gourmet\\projectB\\src\\main\\webapp\\resources\\upload";
		
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
			
			memberService.fileUpdate(mfFile);
		}
		
		
		int result = memberService.profileModify(vo);
		System.out.println("회원 정보 수정 후:"+ vo);

		if(result>0) {
			return "redirect:profile.do?midx="+vo.getMidx();
		}else {
			return "redirect:/";
		}	

	}
	
	
	/*회원 탈퇴하기*/
	@RequestMapping(value="/unregister.do", method=RequestMethod.POST)
	public String unregister(int midx, MemberVo vo, HttpSession session) {
		
		int result = memberService.unregister(vo);
		
		if(result > 0) {
			session.invalidate();
			return "redirect:/";	
		}else {
			return "0";
		}
		
		
	}
	

	
}
	

	
	

