package edu.study.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KakaoService {
	public String getAccessToken (String auth_code) {
		String access_token = "";
		String refresh_token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			            
			//    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			            
			//    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=0c4af53abdedaf0c73af2ec8b352e10c");
			sb.append("&redirect_uri=http://192.168.0.20:8090/controller/member/logindone.do");			
			sb.append("&code=" + auth_code);
			bw.write(sb.toString());
			bw.flush();
			            
			//    결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
			 
			//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			            
			//Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			            
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			            
			System.out.println("access_token : " + access_token);
			System.out.println("refresh_token : " + refresh_token);
			            
			br.close();
			bw.close();
			} catch (IOException e) {
				e.printStackTrace();	
		} 
		return access_token;
	}
	
	public HashMap<String, Object> getUserInfo (String access_token) {
		HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try{
	    	URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_token);   
	        int responseCode = conn.getResponseCode();       
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8")); 
	        String line = "";
	        String result = "";    
	        while ((line = br.readLine()) != null) {
	        	result += line;
	        }
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        String id = element.getAsJsonObject().get("id").getAsString();
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();    
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        userInfo.put("id", id);
	        userInfo.put("name", nickname);
	        br.close();
	            
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	        
	    return userInfo;
	}
}
		
		
