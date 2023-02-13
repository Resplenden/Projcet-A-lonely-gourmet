package edu.study.controller;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import edu.study.service.KakaoService;





@RequestMapping(value="/kakao")
@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;

	@RequestMapping(value = "/logindone.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false)String code, HttpSession session) {
		
		System.out.println("##"+code);		
		String access_token = kakaoService.getAccessToken(code);
		System.out.println("access_token"+access_token);
		HashMap<String,Object> userInfo = kakaoService.getUserInfo(access_token);

		
//		session.invalidate();

		System.out.println("session qqq" + session);

		session.setAttribute("userId", userInfo.get("id"));
		session.setAttribute("name", userInfo.get("name"));
		System.out.println(userInfo);
		
		return "redirect:/";
	
	}
	
	

	
}