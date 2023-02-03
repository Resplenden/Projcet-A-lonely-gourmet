package edu.study.service;


import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MessageService {
	public void message(String phone , String numStr ) {
		
		String apiKey = "NCSRLYUA5GRJYRDS";
		String apiSecret = "VXYMF6LNXN8FWBPOOFVUJREXIQIERWUP";
		Message coolsms = new Message(apiKey,apiSecret);
		
		
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("to", phone);
		params.put("from", "01045045697");
		params.put("type", "SMS");
		params.put("text", "["+numStr+"] ����Ȯ�� ������ȣ��\n�Է����ּ���![ȥ���ǰ��]");
		params.put("app_version", "test app 1.2");
		
		  try {
              JSONObject obj = (JSONObject) coolsms.send(params);
              System.out.println(obj.toString());
          } catch (CoolsmsException e) {
              System.out.println(e.getMessage());
              System.out.println(e.getCode());
          }
	
	}
}
