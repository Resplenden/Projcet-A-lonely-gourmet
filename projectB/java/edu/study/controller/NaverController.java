package edu.study.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;



import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




import com.github.scribejava.core.model.OAuth2AccessToken;

import edu.study.service.NaverLoginBo;


@RequestMapping(value="/naver")
@Controller
public class NaverController {

	/* NaverLoginBO */
	private NaverLoginBo naverLoginBo;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}
	
	// �α���������
	//�α��� ù ȭ�� ��û �޼ҵ�
	
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* �׾Ʒ� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
		String naverAuthUrl = naverLoginBo.getAuthorizationUrl(session);
		/* ������û�� Ȯ�� */
		System.out.println("���̹�:" + naverAuthUrl);
		/* ��ü ���ε� */
		model.addAttribute("urlNaver", naverAuthUrl);

		/* ������ ���� URL�� View�� ���� */
		return "naver/login";
	}
	
	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackNaver(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws Exception {
		System.out.println("�α��� ���� logindone");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBo.getAccessToken(session, code, state);
        //�α��� ����� ������ �о�´�.
	    apiResult = naverLoginBo.getUserProfile(oauthToken);
	    
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj;
		
		jsonObj = (JSONObject) jsonParser.parse(apiResult);
		JSONObject response_obj = (JSONObject) jsonObj.get("response");			
		// ������ ��ȸ
		String email = (String) response_obj.get("email");
		String name = (String) response_obj.get("name");
		// ���ǿ� ����� ���� ���
		// session.setAttribute("islogin_r", "Y");
		session.setAttribute("signIn", apiResult);
		session.setAttribute("email", email);
		session.setAttribute("name", name);
		
        /* ���̹� �α��� ���� ������ View ȣ�� */
		return "redirect:/";
	}
    	
	public String logout(HttpSession session) throws IOException {
		
		System.out.println("�α׾ƿ� ����");
		session.invalidate();
		
		return "redirect:main.jsp";
	}
	
}