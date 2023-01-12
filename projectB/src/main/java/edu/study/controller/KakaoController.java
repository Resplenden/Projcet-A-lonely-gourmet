package edu.study.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.study.service.KakaoService;

@RequestMapping(value="/kakao")
@Controller
public class KakaoController {
	
	@Autowired
	private KakaoService kakaoService;
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value="code", required = false)String code, Model model){
		
			System.out.println("#########" + code);
			
	        String access_Token = kakaoService.getAccessToken(code);
	        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
	        
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        
	        model.addAttribute("uin", userInfo);
	        
		return "kakao/login";
	}
	
	
	
	@RequestMapping(value="/view.do" , method=RequestMethod.GET)
	public String view() {		
		
		return"kakao/view";
	}
	
	
	
}
