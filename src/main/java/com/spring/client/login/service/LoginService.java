package com.spring.client.login.service;

import com.spring.client.login.vo.LoginVO;

public interface LoginService {
	public LoginVO userIdSelect(String userId);
	public LoginVO loginSelect(String userId, String userPw);
	
	public int loginHistoryInserts(LoginVO lvo);
	public int loginHistoryUpdate(LoginVO lvo);
	public LoginVO loginHistorySelect(String userId);

}
