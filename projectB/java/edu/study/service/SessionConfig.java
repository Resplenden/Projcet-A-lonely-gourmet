package edu.study.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class SessionConfig implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	
	//중복로그인 지우기
	public synchronized static String getSessionidCheck(String usingtype, String usingcompareId){
		String usingresult = "";
		for( String usingkey : sessions.keySet() ){
			HttpSession hs = sessions.get(usingkey);
			if(hs != null &&  hs.getAttribute(usingtype) != null && hs.getAttribute(usingtype).toString().equals(usingcompareId) ){
				usingresult =  usingkey.toString();
			}
		}
		removeSessionForDoubleLogin(usingresult);
		return usingresult;
	}
	
	private static void removeSessionForDoubleLogin(String usingId){    	
		System.out.println("remove usingId : " + usingId);
		if(usingId != null && usingId.length() > 0){
			sessions.get(usingId).invalidate();
			sessions.remove(usingId);    		
		}
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		System.out.println(se);
	    sessions.put(se.getSession().getId(), se.getSession());
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		if(sessions.get(se.getSession().getId()) != null){
			sessions.get(se.getSession().getId()).invalidate();
			sessions.remove(se.getSession().getId());	
		}
	}
}