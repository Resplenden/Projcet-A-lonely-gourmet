package edu.study.vo;

public class KakaoVo {
	private String nickname;
	private String email;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "KakaoVo [nickname=" + nickname + ", email=" + email + "]";
	}
	
	
}
